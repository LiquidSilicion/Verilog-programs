module master_fadder_tb();
reg [7:0]A;
reg [7:0]B;
reg CIN;
wire COUT;
wire [7:0]SUM;
wire [6:0]carry;

master_fadder uut (.A(A),.B(B),.CIN(CIN),.COUT(COUT),.SUM(SUM));

reg [7:0]counter;
reg clk;
reg rst_n;

initial begin
    clk=1'b0;
forever #10 clk=~clk;
end

initial begin
rst_n=1'b0;
counter<=8'b00000000;
A<=8'b00000000;
B<=8'b10101010;
CIN=1'b0;
#20;
rst_n=1'b1;

while(counter < 8'b11111111)begin
@(posedge clk or negedge rst_n)
     A<=counter;
     CIN<=counter[0];
     counter<=counter+1;
end
endmodule
