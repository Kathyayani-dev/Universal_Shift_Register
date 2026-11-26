# code for write agent top class
...
  lass wr_agt_top extends uvm_env;
        `uvm_component_utils(wr_agt_top)

         env_config env_cfg;
         wr_agt_config wr_cfg;
         wr_agent agt[];

        function new(string name="wr_agt_top",uvm_component parent);
                super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
                super.build_phase(phase);

                if(!uvm_config_db#(env_config)::get(this,"","env_config",env_cfg))
                        `uvm_fatal(get_type_name(),"env_config in wr_agt_top has failed")

                if(env_cfg.has_wr_agt)
                begin

                        agt=new[env_cfg.no_of_wr_agt];
                        foreach(agt[i])
                        begin
                                agt[i]=wr_agent::type_id::create($sformatf("agt[%0d]",i),this);
                                uvm_config_db#(wr_agt_config)::get(this,$sformatf("agt[%0d]",i),"wr_agt_config",env_cfg.wr_cfg[i]);
                        end
                end
        endfunction

endclass
...
