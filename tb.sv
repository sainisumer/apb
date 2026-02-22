`include "uvm_macros.svh"

import uvm_pkg::*;
`include "seq_item.sv"
module tb;

reg clk;
reg rstn;
apb_intf vintf(clk,rstn);
initial begin
    clk =0;
    rstn =0;
    #50ns rstn = 1;
end
always # 5ns clk = ~clk;
    
initial begin
uvm_config_db#(virtual apb_intf)::set(null,"uvm_test_top.agent.drv","vintf",vintf);
run_test();
end

endmodule