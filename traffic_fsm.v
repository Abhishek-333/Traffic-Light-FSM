// Traffic Light FSM (Moore) - traffic_fsm.v
module traffic_fsm (
    input  wire clk,
    input  wire rst,
    output reg [1:0] ns, // 00=red,01=green,10=yellow
    output reg [1:0] ew
);

typedef enum reg [1:0] {S_RED=2'd0, S_NS_GREEN=2'd1, S_NS_YELLOW=2'd2} state_t;
state_t state, next;

always @(posedge clk or posedge rst) begin
    if (rst) state <= S_RED;
    else state <= next;
end

always @(*) begin
    next = state;
    case(state)
        S_RED: next = S_NS_GREEN;
        S_NS_GREEN: next = S_NS_YELLOW;
        S_NS_YELLOW: next = S_RED;
    endcase
end

always @(*) begin
    // default
    ns = 2'b00; ew = 2'b00;
    case(state)
        S_RED: begin ns = 2'b00; ew = 2'b01; end
        S_NS_GREEN: begin ns = 2'b01; ew = 2'b00; end
        S_NS_YELLOW: begin ns = 2'b10; ew = 2'b00; end
    endcase
end

endmodule
