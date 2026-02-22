class apb_test extends uvm_test;
 `uvm_object_component(apb_test)
  agent agnt;
  apb_seq seq;;
  function new(string name = "apb_test", uvm_component parent = null);
   super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  agnt = agent::type_id::create("agnt",this);
  seq = apb_seq::type_id::create("seq");
  endfunction
 
   virtual task run_phase(uvm_phase phase);
   super.run_phase(phase);
   phase.raise_objection(this)
   seq.start(agnt.sequencer);
   phase.drop_objection(this);
   endtask
endclass