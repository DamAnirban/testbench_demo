// Testbench for Barrel Shifter

module barrel_shifter_tb;

    reg  [3:0] data_in;       // 4-bit input data
    reg  [1:0] shift_amt;     // Shift amount (0 to 3)
    reg        dir;           // Direction: 0 = left, 1 = right
    wire [3:0] data_out;      // Shifted output data

    // Instantiate the barrel shifter
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .dir(dir),
        .data_out(data_out)
    );

    // Test sequence
    initial begin
        // Display header
        $display("Time	data_in	shift_amt	dir	data_out");
        $monitor("%0d	%b	%b	%b	%b", $time, data_in, shift_amt, dir, data_out);

        // Test Case 1: No shift
        data_in = 4'b1010; shift_amt = 2'b00; dir = 0;
        #10;

        // Test Case 2: Shift left by 1
        data_in = 4'b1010; shift_amt = 2'b01; dir = 0;
        #10;

        // Test Case 3: Shift left by 2
        data_in = 4'b1010; shift_amt = 2'b10; dir = 0;
        #10;

        // Test Case 4: Shift left by 3
        data_in = 4'b1010; shift_amt = 2'b11; dir = 0;
        #10;

        // Test Case 5: Shift right by 1
        data_in = 4'b1010; shift_amt = 2'b01; dir = 1;
        #10;

        // Test Case 6: Shift right by 2
        data_in = 4'b1010; shift_amt = 2'b10; dir = 1;
        #10;

        // Test Case 7: Shift right by 3
        data_in = 4'b1010; shift_amt = 2'b11; dir = 1;
        #10;

        // Test Case 8: Edge case - all bits are 1
        data_in = 4'b1111; shift_amt = 2'b01; dir = 1;
        #10;

        // Test Case 9: Edge case - all bits are 0
        data_in = 4'b0000; shift_amt = 2'b01; dir = 0;
        #10;

        // Finish simulation
        $finish;
    end

endmodule
