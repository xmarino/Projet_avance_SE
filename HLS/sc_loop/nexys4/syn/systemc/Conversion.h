// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.3
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _Conversion_HH_
#define _Conversion_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "Conversion_do_conversion.h"

namespace ap_rtl {

struct Conversion : public sc_module {
    // Port declarations 8
    sc_in_clk clk;
    sc_in< sc_logic > reset;
    sc_in< sc_lv<8> > e_dout;
    sc_in< sc_logic > e_empty_n;
    sc_out< sc_logic > e_read;
    sc_out< sc_lv<8> > s_din;
    sc_in< sc_logic > s_full_n;
    sc_out< sc_logic > s_write;


    // Module declarations
    Conversion(sc_module_name name);
    SC_HAS_PROCESS(Conversion);

    ~Conversion();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    Conversion_do_conversion* grp_Conversion_do_conversion_fu_56;
    sc_signal< sc_logic > grp_Conversion_do_conversion_fu_56_e_read;
    sc_signal< sc_lv<8> > grp_Conversion_do_conversion_fu_56_s_din;
    sc_signal< sc_logic > grp_Conversion_do_conversion_fu_56_s_write;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_e_read();
    void thread_s_din();
    void thread_s_write();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
