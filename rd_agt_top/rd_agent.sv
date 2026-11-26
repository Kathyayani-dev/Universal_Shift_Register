# code for read agent class
... 
  class rd_agent extends uvm_agent;
        `uvm_component_utils(rd_agent)

         rd_monitor monh;
         rd_agt_config rd_cfg;

         function new(string name="rd_agent",uvm_component parent);
                super.new(name,parent);
         endfunction

         function void build_phase(uvm_phase phase);
                super.build_phase(phase);

                if(!uvm_config_db#(rd_agt_config)::get(this,"","rd_agt_config",rd_cfg))
                        `uvm_fatal(get_type_name(),"rd_agt_config in rd_agent has failed!")

                monh=rd_monitor::type_id::create("monh",this);


         endfunction

endclass
...
