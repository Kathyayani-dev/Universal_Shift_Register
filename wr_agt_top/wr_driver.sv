# code for write driver class
...
  class wr_driver extends uvm_driver#(wr_xtn);
        `uvm_component_utils(wr_driver)

        function new(string name="wr_driver",uvm_component, parent);
                        super.new(name,parent);
        endfunction
endclass
...
