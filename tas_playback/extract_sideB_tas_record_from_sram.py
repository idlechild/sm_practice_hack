#!/usr/bin/env python
import io
import os
import sys

frame_number = 0
frame_end = 16383
input_offset = 0
if len(sys.argv) == 5:
   frame_number = int(sys.argv[2])
   frame_end = int(sys.argv[3])
   input_offset = int(sys.argv[4])
   if input_offset < frame_number:
      input_offset = 0
   else:
      input_offset = (input_offset - frame_number) * 2
      if input_offset > 32766:
         input_offset = 0
      else:
         frame_number += int(input_offset / 2)
elif len(sys.argv) == 4:
   frame_number = int(sys.argv[2])
   frame_end = int(sys.argv[3])
elif len(sys.argv) == 3:
   frame_number = int(sys.argv[2])
   frame_end += frame_number
elif len(sys.argv) != 2:
   print("extract_sideB_tas_record_from_sram.py <sram_file> <optional_frame_number> <optional_frame_end> <optional_frame_start>")
   sys.exit()
sram_name = sys.argv[1]
if frame_end < frame_number:
   frame_end = (frame_number + 16383) - int(input_offset / 2)
print(f"{frame_number} {frame_end} {input_offset}\n")

sram_file = io.open(os.path.join(os.path.dirname(os.path.realpath(__file__)), sram_name), "rb")
sram_file.seek(196608)
ctrl_data = sram_file.read(32768)
rng_data = sram_file.read(32768)
sram_file.close()

previous_full_time = 0
previous_input = "............"
verify_value = 0
all_file = io.open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "sideB_" + sram_name + "_all.txt"), "w", newline='\n')
ctrl_file = io.open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "sideB_" + sram_name + "_ctrl.txt"), "w", newline='\n')
rng_file = io.open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "sideB_" + sram_name + "_rng.txt"), "w", newline='\n')
rng_file.write(f"\n%startfree()\n")
rng_file.write(f"ZebesTASCachedRng:\n")
time_file = io.open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "sideB_" + sram_name + "_time.txt"), "w", newline='\n')
time_file.write(f"\n%startfree()\n")
time_file.write(f"ZebesTASFrameCounter:\n")
verify_file = io.open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "sideB_" + sram_name + "_verify.txt"), "w", newline='\n')
verify_file.write(f"\n%startfree()\n")
verify_file.write(f"ZebesTASVerifyInput:\n")
for i in range(input_offset, 32768, 2):
   full_time = ctrl_data[i]
   if 0xFF == ctrl_data[i + 1]:
      ctrl_file.write(f"|..|{previous_input}|\n")
      all_file.write(f"{frame_number:06} ---- |..|{previous_input}|{full_time:02X}\n")
      previous_full_time = full_time - 1
   elif 0x0F == ctrl_data[i + 1]:
      rng_value = rng_data[i + 1]
      rng_value <<= 8
      rng_value |= rng_data[i]
      verify_file.write(f"    dw ${verify_value:04X}\n")
      time_file.write(f"    db ${full_time:02X}\n")
      rng_file.write(f"    dw ${rng_value:04X}\n")
      ctrl_file.write(f"|..|{previous_input}|\n")
      all_file.write(f"{frame_number:06} {rng_value:04X} |..|{previous_input}|{full_time:02X}\n")
      previous_full_time = full_time
   else:
      rng_value = rng_data[i + 1]
      rng_value <<= 8
      rng_value |= rng_data[i]
      verify_value = ctrl_data[i + 1]
      verify_value <<= 8
      verify_value |= ctrl_data[i] & 0xF0
      previous_input = 'U' if ctrl_data[i + 1] & 0x08 else '.'
      previous_input += 'D' if ctrl_data[i + 1] & 0x04 else '.'
      previous_input += 'L' if ctrl_data[i + 1] & 0x02 else '.'
      previous_input += 'R' if ctrl_data[i + 1] & 0x01 else '.'
      previous_input += 's' if ctrl_data[i + 1] & 0x20 else '.'
      previous_input += 'S' if ctrl_data[i + 1] & 0x10 else '.'
      previous_input += 'Y' if ctrl_data[i + 1] & 0x40 else '.'
      previous_input += 'B' if ctrl_data[i + 1] & 0x80 else '.'
      previous_input += 'X' if ctrl_data[i] & 0x40 else '.'
      previous_input += 'A' if ctrl_data[i] & 0x80 else '.'
      previous_input += 'l' if ctrl_data[i] & 0x20 else '.'
      previous_input += 'r' if ctrl_data[i] & 0x10 else '.'
      partial_time = full_time & 0x0F
      full_time = ((previous_full_time + 1) & 0xF0) | partial_time
      verify_file.write(f"    dw ${verify_value:04X}\n")
      time_file.write(f"    db ${full_time:02X}\n")
      rng_file.write(f"    dw ${rng_value:04X}\n")
      ctrl_file.write(f"|..|{previous_input}|\n")
      all_file.write(f"{frame_number:06} {rng_value:04X} |..|{previous_input}|{full_time:02X} ({partial_time:01X})\n")
      previous_full_time = full_time
   if frame_number == frame_end:
      break
   frame_number += 1
verify_file.write(f"%endfree()\n\n")
verify_file.close()
time_file.write(f"%endfree()\n\n")
time_file.close()
rng_file.write(f"%endfree()\n\n")
rng_file.close()
ctrl_file.close()
all_file.close()

