module DataMemory (
    input clk,
    input memRead,
    input memWrite,
    input [31:0] address,
    input [31:0] writeData,
    output [31:0] readData
);
    reg [31:0] memory [0:1023];

    assign readData = (memRead) ? memory[address >> 2] : 32'bz;

    always @(posedge clk) begin
        if (memWrite)
            memory[address >> 2] <= writeData;
    end
endmodule

  