module bist_top;

parameter ADDR_WIDTH = 4;
parameter DATA_WIDTH = 8;

reg clk = 0, rst = 1;
wire [ADDR_WIDTH-1:0] addr;
wire we;
wire [DATA_WIDTH-1:0] din, dout;
wire [1:0] state;
wire done;
wire fail;

always #5 clk = ~clk;

bist_controller #(ADDR_WIDTH) ctrl(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .we(we),
    .state(state),
    .done(done)
);

data_gen dg(
    .state(state),
    .data(din)
);

sram #(ADDR_WIDTH, DATA_WIDTH) mem(
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

comparator cmp(
    .expected(din),
    .actual(dout),
    .fail(fail)
);

initial begin
    #10 rst = 0;
    #500 $finish;
end

endmodule
