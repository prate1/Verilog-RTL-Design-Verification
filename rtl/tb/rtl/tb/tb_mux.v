module tb_mux;
    reg  t_a, t_b, t_sel;
    wire t_out;

    mux21 uut (
        .a(t_a),
        .b(t_b),
        .sel(t_sel),
        .out(t_out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mux);

        t_a = 1; t_b = 0; t_sel = 0;
        #10;

        t_a = 0; t_b = 1; t_sel = 1;
        #10;

        $finish;
    end
endmodule

