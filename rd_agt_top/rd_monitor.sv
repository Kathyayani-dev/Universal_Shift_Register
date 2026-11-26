# code for read  monitor class
...
   class rd_monitor extends uvm_monitor;
        `uvm_component_utils(rd_monitor)

         function new(string name="rd_monitor",uvm_component parent);
                super.new(name,parent);
        endfunction

  endclass
...
