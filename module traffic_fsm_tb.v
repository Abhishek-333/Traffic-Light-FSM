`timescale 1ns/1ps
module traffic_fsm_tb;
reg clk, rst;
wire [1:0] ns, ew;
traffic_fsm uut(.clk(clk), .rst(rst), .ns(ns), .ew(ew));
initial clk=0; always #5 clk = ~clk;

initial begin
  rst = 1; #10 rst = 0;
  #200 $finish;
end
endmodule
