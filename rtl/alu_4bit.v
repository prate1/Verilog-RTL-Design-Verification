# code
module alu_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [2:0] opcode,
    output reg  [3:0] result,
    output reg        carry_out,
    output wire       zero
);

    // Zero flag asserts high whenever output result is 0
    assign zero = (result == 4'b0000);

    always @(*) begin
        carry_out = 1'b0;
        case (opcode)
            3'b000: {carry_out, result} = a + b;        // Addition with Carry
            3'b001: {carry_out, result} = a - b;        // Subtraction with Borrow
            3'b010: result = a & b;                     // Bitwise AND
            3'b011: result = a | b;                     // Bitwise OR
            3'b100: result = a ^ b;                     // Bitwise XOR
            3'b101: result = ~a;                        // Bitwise NOT (A)
            3'b110: result = a << 1;                    // Logical Shift Left
            3'b111: result = a >> 1;                    // Logical Shift Right
            default: result = 4'b0000;
        endcase
    end

endmodule
