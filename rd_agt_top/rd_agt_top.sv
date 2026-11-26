# code read agent top class
...
  class rd_agt_top extends uvm_env;
        `uvm_component_utils(rd_agt_top)

         env_config env_cfg;
         rd_agt_config rd_cfg;
         rd_agent agt[];

         function new(string name="rd_agt_top",uvm_component parent);
                super.new(name,parent);
         endfunction

         function void build_phase(uvm_phase phase);
                super.build_phase(phase);

                if(!uvm_config_db#(env_config)::get(this,"","env_config",env_cfg))
                        `uvm_fatal(get_type_name(),"env_config in rd_agt_top has failed!")

                if(env_cfg.has_rd_agt)
                begin

                        agt=new[env_cfg.no_of_rd_agt];
                        foreach(agt[i])
                        begin
                                agt[i]=rd_agent::type_id::create($sformatf("agt[%0d]",i),this);
                                uvm_config_db#(rd_agt_config)::set(this,$sformatf("agt[%0d]",i),"rd_agt_config",env_cfg.rd_cfg[i]);
                        end
                end
        endfunction

endclass
...
