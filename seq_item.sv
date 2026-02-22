import uvm_pkg::*;
class seq_item extends uvm_sequence_item;
    rand int paddr;
    rand int pwdata;
    rand int prdata;
    rand logic psel;
    rand logic penable;
    rand logic pready;
    rand logic pwrite;
    
    
    `uvm_object_utils_begin(seq_item)
    `uvm_field_int(paddr,UVM_ALL_ON)
    `uvm_field_int(pwdata,UVM_ALL_ON)
    `uvm_field_int(prdata,UVM_ALL_ON)
    `uvm_field_int(psel,UVM_ALL_ON)
    `uvm_field_int(penable,UVM_ALL_ON)
    `uvm_field_int(pready,UVM_ALL_ON)
    `uvm_field_int(pwrite,UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "seq_item");
    super.new(name);  
    endfunction //new()

endclass

