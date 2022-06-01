`timescale 1ps/1ps
module fsmtest();
reg Tdin, Tclk, Trst;
wire [2:0] Tstate;
wire outp;
fsmmo testo (
    .reset(Trst),
    .clk(Tclk),
    .din(Tdin),
    .seqcheck(outp),
    .state(Tstate)
);
always begin
    Tclk <= 1'b0;
    #10;
    Tclk <=1'b1;
    #10;
end
initial begin
    Trst = 1'b0;
    Tdin = 1'b0;
    // let us enter the seq : 10110110
    @(posedge Tclk) begin
        #5;
        Trst <= 1'b1;
        Tdin <= 1'b1;
    end
    @(posedge Tclk) begin
        #5;
        Trst = 1'b1;
        Tdin = 1'b0;
    end
    @(posedge Tclk) begin
        #5;
        Trst <= 1'b1;
        Tdin <= 1'b1;
    end
    @(posedge Tclk) begin
        #5;
        Trst <= 1'b1;
        Tdin <= 1'b1;
    end
    @(posedge Tclk) begin
        #5;
        Trst = 1'b1;
        Tdin = 1'b0; 
    end
    @(posedge Tclk) begin
        #5;
        Trst <= 1'b1;
        Tdin <= 1'b1;
        if(!outp) begin
          $display("%t: Holy Moly the sequence check is not 1!!!", $time);
        end
        else $display("%t: we are okay:)", $time);
    end
    @(posedge Tclk) begin
        #5;
        Trst <= 1'b1;
        Tdin <= 1'b1;
     
    end
    @(posedge Tclk) begin
        #5;
        Trst <= 1'b1;
        Tdin <= 1'b0;
    end
     @(posedge Tclk) begin
        #5;
        Trst <= 1'b1;
        Tdin <= 1'b0;
        if(!outp) begin
          $display("%t: Holy Moly the sequence check is not 1!!!", $time);
        end
        else $display("%t: we are okay:)", $time);
    end
end

endmodule