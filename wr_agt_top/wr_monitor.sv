# code for write monitor class
...
  class wr_monitor extends uvm_monitor;
        `uvm_component_utils(wr_monitor)

        function new(string name="wr_monitor", uvm_component parent);
                super.new(name,parent);
        endfunction

endclass
...
