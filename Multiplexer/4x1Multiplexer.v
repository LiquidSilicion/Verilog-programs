module mux4x1(a,s,o);
input [3:0]a;
input [1:0]s;
output reg o;
always@(a or s)
begin
if (s[1:0]==2'b00) begin
   o=a[0];
end
 else if (s[1:0]==2'b01) begin
   o=a[1];
 end
 else if (s[1:0]==2'b10) begin
   o=a[2];
 end
else begin
   o=a[3];
end
end
endmodule
