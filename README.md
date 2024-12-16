# testbench_demo
demo testbench repo
demo design and testbench of a 4-bit barrel shifter implemented in Verilog. This design can shift input data left or right by 0 to 3 positions based on the shift amount provided.

Inputs:
data_in: The 4-bit data to be shifted.
shift_amt: Specifies the number of positions to shift (0–3).
dir: Determines the direction (0 for left, 1 for right).

Wire Stages:
Intermediate stages are used for 1-bit and 2-bit shifts.

Output:
The data_out is determined based on shift_amt, using intermediate stages for efficient shifting.
Can scale this design to larger word sizes (e.g., 8-bit, 16-bit)
