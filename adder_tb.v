// Testbench for 4-bit Adder

module adder_tb;

    reg  [3:0] a;        // 4-bit input a
    reg  [3:0] b;        // 4-bit input b
    reg        cin;      // Carry-in
    wire [3:0] sum;      // 4-bit sum output
    wire       cout;     // Carry-out

    // Instantiate the adder
    adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Test sequence
    initial begin
        // Display header
        $display("Time\ta\tb\tcin\tsum\tcout");
        $monitor("%0d\t%b\t%b\t%b\t%b\t%b", $time, a, b, cin, sum, cout);

        // Test Case 1: Add 0 + 0, no carry-in
        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #10;

        // Test Case 2: Add 1 + 1, no carry-in
        a = 4'b0001; b = 4'b0001; cin = 1'b0;
        #10;

        // Test Case 3: Add 5 + 7, no carry-in
        a = 4'b0101; b = 4'b0111; cin = 1'b0;
        #10;

        // Test Case 4: Add 8 + 8, with carry-in
        a = 4'b1000; b = 4'b1000; cin = 1'b1;
        #10;

        // Test Case 5: Add 15 + 15, no carry-in
        a = 4'b1111; b = 4'b1111; cin = 1'b0;
        #10;

        // Test Case 6: Add 15 + 15, with carry-in
        a = 4'b1111; b = 4'b1111; cin = 1'b1;
        #10;

        // Finish simulation
        $finish;
    end

endmodule