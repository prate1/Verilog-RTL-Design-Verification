module tb_alu_4bit;
    reg  [3:0] a, b;
    reg  [2:0] opcode;
    wire [3:0] result;
    wire       carry_out, zero;

    alu_4bit uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result),
        .carry_out(carry_out),
        .zero(zero)
    );

    initial begin
        $dumpfile("alu_dump.vcd");
        $dumpvars(0, tb_alu_4bit);

        // Test 1: Addition with overflow (15 + 3 = 18 -> result=2, carry=1)
        a = 4'b1111; b = 4'b0011; opcode = 3'b000; #10;

        // Test 2: Subtraction resulting in zero (5 - 5 = 0 -> zero=1)
        a = 4'b0101; b = 4'b0101; opcode = 3'b001; #10;

        // Test 3: Bitwise AND
        a = 4'b1100; b = 4'b1010; opcode = 3'b010; #10;

        // Test 4: Bitwise XOR
        a = 4'b1100; b = 4'b1010; opcode = 3'b100; #10;

        // Test 5: Logical Shift Left
        a = 4'b0101; b = 4'b0000; opcode = 3'b110; #10;

        $finish;
    end
endmodule

