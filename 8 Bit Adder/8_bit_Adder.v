module fadder(a,b,cin,cout,sum);
input a,b,cin;
output reg cout;
output reg sum;
always@(*)
begin
sum=a^b^cin;
cout=(a&b)|(b&cin)|(cin&a);
end
endmodule

module master_fadder(A,B,CIN,COUT,SUM);
input [7:0]A;
input [7:0]B;
input CIN;
output COUT;
output [7:0]SUM;
wire [6:0]carry;

fadder FA0 (.a(A[0]),.b(B[0]),.cin(CIN),.cout(carry[0]),.sum(SUM[0]));
fadder FA1 (.a(A[1]),.b(B[1]),.cin(carry[0]),.cout(carry[1]),.sum(SUM[1]));
fadder FA2 (.a(A[2]),.b(B[2]),.cin(carry[1]),.cout(carry[2]),.sum(SUM[2]));
fadder FA3 (.a(A[3]),.b(B[3]),.cin(carry[2]),.cout(carry[3]),.sum(SUM[3]));
fadder FA4 (.a(A[4]),.b(B[4]),.cin(carry[3]),.cout(carry[4]),.sum(SUM[4]));
fadder FA5 (.a(A[5]),.b(B[5]),.cin(carry[4]),.cout(carry[5]),.sum(SUM[5]));
fadder FA6 (.a(A[6]),.b(B[6]),.cin(carry[5]),.cout(carry[6]),.sum(SUM[6]));
fadder FA7 (.a(A[7]),.b(B[7]),.cin(carry[6]),.cout(COUT),.sum(SUM[7]));

endmodule
