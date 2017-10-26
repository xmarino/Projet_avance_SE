-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.3
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Conversion_do_conversion is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    e_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    e_empty_n : IN STD_LOGIC;
    e_read : OUT STD_LOGIC;
    s_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    s_full_n : IN STD_LOGIC;
    s_write : OUT STD_LOGIC );
end;


architecture behav of Conversion_do_conversion is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal e_blk_n : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "010";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal s_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_reg_71 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state2;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (e_empty_n = ap_const_logic_1))) then
                tmp_reg_71 <= e_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (e_empty_n, s_full_n, ap_CS_fsm, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (e_empty_n = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (s_full_n = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    e_blk_n_assign_proc : process(e_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            e_blk_n <= e_empty_n;
        else 
            e_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    e_read_assign_proc : process(e_empty_n, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (e_empty_n = ap_const_logic_1))) then 
            e_read <= ap_const_logic_1;
        else 
            e_read <= ap_const_logic_0;
        end if; 
    end process;


    s_blk_n_assign_proc : process(s_full_n, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            s_blk_n <= s_full_n;
        else 
            s_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_din <= std_logic_vector(unsigned(tmp_reg_71) + unsigned(ap_const_lv32_1));

    s_write_assign_proc : process(s_full_n, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (s_full_n = ap_const_logic_1))) then 
            s_write <= ap_const_logic_1;
        else 
            s_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;