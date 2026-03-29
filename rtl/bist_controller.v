module bist_controller #(parameter ADDR_WIDTH = 4)(
    input clk, rst,
    output reg [ADDR_WIDTH-1:0] addr,
    output reg we,
    output reg [1:0] state,
    output reg done
);

reg direction; // 0 = up, 1 = down

always @(posedge clk or posedge rst) begin
    if (rst) begin
        addr <= 0;
        state <= 0;
        direction <= 0;
        done <= 0;
    end else begin
        case (state)

        0: begin // write 0 ↑
            we <= 1;
            if (addr == (1<<ADDR_WIDTH)-1) begin
                state <= 1;
                addr <= 0;
            end else addr <= addr + 1;
        end

        1: begin // read 0 write 1 ↑
            we <= 1;
            if (addr == (1<<ADDR_WIDTH)-1) begin
                state <= 2;
                addr <= (1<<ADDR_WIDTH)-1;
                direction <= 1;
            end else addr <= addr + 1;
        end

        2: begin // read 1 write 0 ↓
            we <= 1;
            if (addr == 0) begin
                state <= 3;
            end else addr <= addr - 1;
        end

        3: begin // read 0 ↓
            we <= 0;
            if (addr == 0) begin
                done <= 1;
            end else addr <= addr - 1;
        end

        endcase
    end
end

endmodule
