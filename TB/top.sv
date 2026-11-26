# code for Top Module
...
  module top;
        import test_pkg::*;
        import uvm_pkg::*;
        `include "uvm_macros.svh"

         bit clk;
         always #5 clk= ~clk;

         inter INTER(clk);

         initial
                 begin
                        run_test("test");
                 end


endmodule
...
