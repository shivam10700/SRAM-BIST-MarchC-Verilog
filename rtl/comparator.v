
module comparator(
    input clk,
    input we,
    input [7:0] din,
    input [7:0] dout,
    output reg fail
);

reg [7:0] last_written;
reg we_d;

// Initialization
initial begin
    fail = 0;
    last_written = 0;
    we_d = 1;
end

// Track last written data
always @(posedge clk) begin
    if (we)
        last_written <= din;
end

// Delay WE
always @(posedge clk) begin
    we_d <= we;
end

// Compare ONLY on read
always @(posedge clk) begin
    if (!we_d) begin
        if (dout !== last_written)
            fail <= 1;
    end
end

endmodule
