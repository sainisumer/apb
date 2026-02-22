class driver extends uvm_driver(seq_item);
 `uvm_object_component(driver)
  virtual apb_intf vintf;
  function new(string name = "driver", uvm_component parent = null);
   super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db#(virtual apb_intf)::get(this,"","vintf"vintf))
    `uvm_fatal(get_type_name()," driver not set at top")
  endfunction
 
  virtual task run_phase(uvm_phase phase);
   super.run_phase(phase);
   forever 
     begin
      seq_item_port.get_next_item(seq_item);
      @(posedge vintf.rstn);
      @(posedge vintf.clk);
      vintf.psel = 0;
      @(posedge vintf.clk);
      vintf.psel = 1;
      vintf.penable = 0;
      @(posedge vintf.clk);
      vintf.psel = 1;
      vintf.penable = 1;
      vintf.pwrite = seq_item.pwrite;
      vintf.pwdata = seq_item.pwdata;
      vintf.paddr = seq_item.paddr;
      @(posedge vintf.clk);
      if(seq_item.pwrite && vintf.pready)
       seq_item.prdata = 0;
      else
       seq_item.prdata = vintf.prdata;
      @(posedge vintf.clk);
      vintf.psel = 0;
      vintf.penable = 0;
      vintf.pwrite = 0;
      vintf.pwdata = 0;
      vintf.paddr = 0;
      seq_item_port.item_done();
    end
  endtask
endclass