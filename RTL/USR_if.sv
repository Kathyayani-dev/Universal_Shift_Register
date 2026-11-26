# code for Interface of Universal Shift Register 
...
  interface inter(input bit clk);

        logic rst;
        logic [3:0]pr_din;
        logic [1:0]psel;
        logic sh_left_din;
        logic sh_right_din;
        logic sh_left_dout;
        logic sh_right_dout;
        logic [3:0] dout;

//write driver
clocking wr_drv @(posedge clk);
        default input#1 output#1;

        output rst,sh_left_din,sh_right_din;
        output pr_din,psel;
endclocking

//write monitor
clocking wr_mon @(posedge clk);
        default input#1 output#1;

        input rst,sh_left_din,sh_right_din;
        input pr_din,psel;
endclocking

//read monitor
clocking rd_mon @(posedge clk);
        default input#1 output#1;

        input dout,sh_left_dout,sh_right_dout;
endclocking
    
endinterface
...
