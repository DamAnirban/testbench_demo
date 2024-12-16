// Barrel Shifter (4-bit)
// Supports left and right shifts based on control signal

module barrel_shifter(
    input  [3:0] data_in,       // 4-bit input data
    input  [1:0] shift_amt,    // Shift amount (0 to 3)
    input        dir,          // Direction: 0 = left, 1 = right
    output [3:0] data_out      // Shifted output data
);

    wire [3:0] stage1, stage2;

    // Stage 1: Shift by 1 bit
    assign stage1 = dir ? {data_in[0], data_in[3:1]} : {data_in[2:0], data_in[3]};

    // Stage 2: Shift by 2 bits
    assign stage2 = dir ? {stage1[1:0], stage1[3:2]} : {stage1[1:0], stage1[3:2]};

    // Select final output based on shift amount
    assign data_out = (shift_amt == 2'b00) ? data_in :
                      (shift_amt == 2'b01) ? stage1 :
                      (shift_amt == 2'b10) ? stage2 :
                      (dir ? {data_in[2:0], data_in[3]} : {data_in[0], data_in[3:1]});

endmodule
