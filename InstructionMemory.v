module InstructionMemory (
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] memory [0:1023];

    initial begin
        // Load instructions into memory (can be hardcoded for testing)
        // Example: memory[0] = 32'hXXXXXXXX; // where XXXXXXXX is a 32-bit instruction
    end

    assign instruction = memory[address >> 2];
endmodule

    