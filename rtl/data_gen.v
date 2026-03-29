module data_gen(
    input [1:0] state,
    output reg [7:0] data
);

always @(*) begin
    case (state)
        0: data = 8'h00;
        1: data = 8'hFF;
        2: data = 8'h00;
        default: data = 8'h00;
    endcase
end

endmodule
