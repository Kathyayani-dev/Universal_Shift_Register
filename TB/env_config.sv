# code Environment Configuration class
...
  class env_config extends uvm_object;
        `uvm_object_utils(env_config)

         wr_agt_config wr_cfg[];
         rd_agt_config rd_cfg[];

         int no_of_wr_agt=1;
         int no_of_rd_agt=1;
         int has_wr_agt=1;
         int has_rd_agt=1;

         function new(string name="env_config");
                super.new(name);
         endfunction

endclass
...
