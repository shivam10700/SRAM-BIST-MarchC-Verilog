module comparator(
    input [7:0] expected,
    input [7:0] actual,
    output reg fail
);

always @(*) begin
    if (expected != actual)
        fail = 1;
    else
        fail = 0;
end

endmodule
