class agent extends uvm_agent;
 `uvm_object_component(agent)
  driver drv;
  uvm_sequencer #(seq_item) sequencer;
  function new(string name = "agent", uvm_component parent = null);
   super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  drv = driver::type_id::create("driver",this);
  endfunction
 
  funtion void connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   drv.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass