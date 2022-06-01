module fsmmo(
    input din, reset, clk,
    output reg seqcheck,
    output reg [2:0]state
);

always @(posedge clk or negedge reset) begin
    if(!reset) begin
      state <= 3'b0;
      seqcheck <= 0;
    end
    else
    begin
      case (state)
        3'b000 : begin
            if (din) begin
                state <= 3'b001;
            end
            else begin
                state <= 3'b000;
            end
        end
        3'b001 : begin
          if (din) begin
                state <= 3'b001;
            end
            else begin
                state <= 3'b010;
            end
        end
        3'b010 : begin
          if (din) begin
                state <= 3'b011;
            end
            else begin
                state <= 3'b000;
            end
        end
        3'b011 : begin
          if (din) begin
                state <= 3'b100;
            end
            else begin
                state <= 3'b010;
            end
        end
         3'b100 : begin
          if (din) begin
                state <= 3'b001;
            end
            else begin
                state <= 3'b010;
            end
        end
        default: begin
                state <= 3'b000;
        end
      endcase
    end
end
always @(posedge clk or negedge reset) begin
    if(!reset) begin
      seqcheck <= 1'b0 ;
    end
    else if (state == 3'b100 ) begin
      seqcheck <= 1'b1 ;
    end
    else begin
      seqcheck <= 1'b0 ;
    end
end
endmodule