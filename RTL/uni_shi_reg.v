#  RTL code for universal Shift Register
  ...
  module universal_shift_register(clk,rst,pr_din,sh_left_din,sh_right_din,sh_left_dout,sh_right_dout,psel,dout);
input clk,rst;
input [1:0] psel;
input [3:0] pr_din;
input sh_left_din,sh_right_din;
output sh_left_dout,sh_right_dout;
output reg [3:0] dout;
always @(posedge clk) begin
 if(rst)
    dout <= 0;

 else
    case(psel)
       2'b00:dout <= dout;//hold
       2'b01:dout <= {dout[2:0],sh_left_din}; //left shift
       2'b10:dout <= {sh_right_din,dout[3:1]};//right shift
       2'b11:dout <=pr_din;//load data
       default:dout <=4'd0;
    endcase
end
assign sh_left_dout = dout[3];
assign sh_right_dout = dout[0];


/*property rest;
        @(posedge clk) rst |=> ##1 dout == 0;
endproperty

property hold;
        @(posedge clk) (!rst && psel == 2'b00) |=> ##1 dout == $stable(dout);
endproperty

property left_shift;
        @(posedge clk) (!rst && psel == 2'b01) |=> ##1 dout == {dout[2:0],sh_left_din};
endproperty

property right_shift;
        @(posedge clk) (!rst && psel == 2'b10) |=> ##1 dout == {sh_right_din,dout[3:1]};
endproperty

property load;
           @(posedge clk) (!rst && psel == 2'b11) |=> ##1 dout == pr_din;
endproperty

assert property(rest);
assert property(hold);
assert property(left_shift);
assert property(right_shift);
assert property(load);
*/
endmodule
...                        
