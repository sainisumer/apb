interface apb_intf(logic clk,logic rstn);
    logic[31:0] paddr;
    logic[31:0] pwdata;
    logic[31:0] prdata;
    logic psel;
    logic penable;
    logic pready;
    logic pwrite;

endinterface