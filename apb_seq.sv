class apb_seq extends uvm_sequence;
`uvm_object_utils(apb_seq)
 seq_item item;

 function new(string name = "apb_seq");
  super.new(name);
 endfunction
 virtual task body();
 `uvm_do(item);

 endtask


endclass