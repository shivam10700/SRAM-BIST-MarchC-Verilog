module sram #(parameter ADDR_WIDTH = 4, DATA_WIDTH = 8)(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

always @(posedge clk) begin
    if (we)
        mem[addr] <= din;
    else
        dout <= mem[addr];
end

endmodule
