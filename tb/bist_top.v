module bist_top;

parameter ADDR_WIDTH = 4;
parameter DATA_WIDTH = 8;

reg clk = 0, rst = 1;

wire [ADDR_WIDTH-1:0] addr;
wire we;
wire [1:0] state;
wire phase;
wire done;

wire [DATA_WIDTH-1:0] din, dout;
wire fail;

always #5 clk = ~clk;

bist_controller ctrl(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .we(we),
    .state(state),
    .phase(phase),
    .done(done)
);

data_gen dg(
    .state(state),
    .data(din)
);

sram mem(
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

comparator cmp(
    .clk(clk),
    .we(we),
    .din(din),   
    .dout(dout),
    .fail(fail)
);
  
// Dump waveform
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, bist_top);
end

initial begin
    #10 rst = 0;
    #1000 $finish;
end

endmodule
