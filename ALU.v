module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUControl,
    output reg [31:0] ALUResult,
    output Zero
);

    always @(*) begin
        case (ALUControl)
            4'b0000: ALUResult = A + B;   // ADD
            4'b0001: ALUResult = A - B;   // SUB
            4'b0010: ALUResult = A & B;   // AND
            4'b0011: ALUResult = A | B;   // OR
            4'b0100: ALUResult = B << A;  // SLL
            4'b0101: ALUResult = B >> A;  // SRL
            4'b0110: ALUResult = (A < B) ? 1 : 0; // SLT
            default: ALUResult = 0;
        endcase
    end

    assign Zero = (ALUResult == 0);
endmodule

