# code for Testcases of Universal Shift Register
...
  class test extends uvm_test;
        `uvm_component_utils(test)

         env_config env_cfg;
         wr_agt_config wr_cfg[];
         rd_agt_config rd_cfg[];
         env          env_h;

         int no_of_wr_agt=1;
         int no_of_rd_agt=1;

         int has_wr_agt=1;
         int has_rd_agt=1;

         function new(string name="test",uvm_component parent);
                super.new(name,parent);
         endfunction

         function void build_phase(uvm_phase phase);
                super.build_phase(phase);

                env_cfg.no_of_wr_agt=this.no_of_wr_agt;
                env_cfg.no_of_rd_agt=this.no_of_rd_agt;
                env_cfg.has_wr_agt=this.has_wr_agt;
                env_cfg.has_rd_agt=this.has_rd_agt;
                env_cfg.wr_cfg=new[no_of_wr_agt];
                env_cfg.rd_cfg=new[no_of_rd_agt];

         if(env_cfg.has_wr_agt)
         begin
                 wr_cfg=new[no_of_wr_agt];
                 foreach(wr_cfg[i])
                 begin
                                wr_cfg[i]=wr_agt_config::type_id::create($sformatf("wr_cfg[%0d]",i));
                                wr_cfg[i].is_active=UVM_ACTIVE;
                                env_cfg.wr_cfg[i]=wr_cfg[i];
                 end
         end

         if(env_cfg.has_rd_agt)
         begin
                  rd_cfg=new[no_of_rd_agt];
                 foreach(rd_cfg[i])
                 begin
                                rd_cfg[i]=rd_agt_config::type_id::create($sformatf("rd_cfg[%0d]",i));
                                rd_cfg[i].is_active=UVM_ACTIVE;
                                env_cfg.rd_cfg[i]=rd_cfg[i];
                 end
         end

               uvm_config_db#(env_config)::set(this,"*","env_config",env_cfg);
              env_h=env::type_id::create("env_h",this);
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
                uvm_top.print_topology();
        endfunction


endclass
...
