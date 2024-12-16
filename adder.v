// 4-bit Adder

module adder(
    input  [3:0] a,        // 4-bit input a
    input  [3:0] b,        // 4-bit input b
    input        cin,      // Carry-in
    output [3:0] sum,      // 4-bit sum output
    output       cout      // Carry-out
);

    assign {cout, sum} = a + b + cin; // Perform addition with carry

endmodule