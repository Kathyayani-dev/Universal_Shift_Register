# code for write sequence class
...
  class wr_seqs extends uvm_sequence#(wr_xtn);
        `uvm_object_utils(wr_xtn)

        function new(string name="wr_seqs");
                super.new(name);
        endfunction

endclass
...
