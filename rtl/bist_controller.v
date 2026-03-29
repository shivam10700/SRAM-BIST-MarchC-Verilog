module bist_controller #(parameter ADDR_WIDTH = 4)(
    input clk, rst,
    output reg [ADDR_WIDTH-1:0] addr,
    output reg we,
    output reg [1:0] state,
    output reg phase,
    output reg done
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        addr <= 0;
        state <= 0;
        phase <= 1;
        done <= 0;
    end else begin

        case (state)

        // S0: write 0 ↑
        0: begin
            we <= 1;
            if (addr == (1<<ADDR_WIDTH)-1) begin
                state <= 1;
                addr <= 0;
            end else addr <= addr + 1;
        end

        // S1: read 0, write 1 ↑
        1: begin
            if (phase == 0) begin
                we <= 0;
                phase <= 1;
            end else begin
                we <= 1;
                phase <= 0;
                if (addr == (1<<ADDR_WIDTH)-1) begin
                    state <= 2;
                    addr <= (1<<ADDR_WIDTH)-1;
                end else addr <= addr + 1;
            end
        end

        // S2: read 1, write 0 ↓
        2: begin
            if (phase == 0) begin
                we <= 0;
                phase <= 1;
            end else begin
                we <= 1;
                phase <= 0;
                if (addr == 0) begin
                    state <= 3;
                end else addr <= addr - 1;
            end
        end

        // S3: read 0 ↓
        3: begin
            we <= 0;
            if (addr == 0)
                done <= 1;
            else
                addr <= addr - 1;
        end

        endcase
    end
end

endmodule
