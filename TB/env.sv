# code for Environment Class
...
  class env extends uvm_env;
        `uvm_component_utils(env)

         env_config env_cfg;
         scoreboard sb;
         wr_agt_top wr_t;
         rd_agt_top rd_t;

         function new(string name="env",uvm_component parent);
                super.new(name,parent);
         endfunction

         function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                if(!uvm_config_db#(env_config)::get(this,"*","env_config",env_cfg))
                        `uvm_fatal(get_type_name(),"env_config in env has failed!")

                 wr_t=wr_agt_top::type_id::create("wr_t",this);
                 rd_t=rd_agt_top::type_id::create("rd_t",this);
                 sb  =scoreboard::type_id::create("sb",this);
          endfunction

endclass
...
