# code for write agent class
...
  class wr_agent extends uvm_agent;
        `uvm_component_utils(wr_agent)

         wr_driver drvh;
         wr_monitor monh;
         wr_sequencer seqrh;

         wr_agt_config wr_cfg;

        function new(string name="wr_agent",uvm_component parent);
                super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
                super.build_phase(phase);

                if(!uvm_config_db#(wr_agt_config)::get(this,"","wr_agt_config",wr_cfg))
                        `uvm_fatal(get_type_name(),"wr_agt_config in wr_agent has failed!")

                monh=wr_monitor::type_id::create("monh",this);
                if(wr_cfg.is_active==UVM_ACTIVE)
                begin
                        drvh=wr_driver::type_id::create("drvh",this);
                        seqrh=wr_sequencer::type_id::create("seqrh",this);
                end
        endfunction

endclass
...
