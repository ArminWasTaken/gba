
q
Command: %s
53*	vivadotcl2@
,synth_design -top cpu -part xc7a100tcsg324-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px? 
?
%s*synth2?
xStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 467.715 ; gain = 100.898
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
cpu2default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/cpu.vhd2default:default2
432default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
control2default:default2F
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
302default:default2
CONTROL12default:default2
control2default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/cpu.vhd2default:default2
1062default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
452default:default8@Z8-638h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2)
inst_reg_reg[orig_8b]2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
672default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2)
inst_reg_reg[dest_8b]2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
672default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2&
inst_reg_reg[cond]2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
672default:default8@Z8-6014h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2"
sys_ctrl[n_m1]2default:default2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
382default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
sys_ctrl[n_mreq]2default:default2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
382default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
sys_ctrl[n_iorq]2default:default2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
382default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2"
sys_ctrl[n_rd]2default:default2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
382default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2"
sys_ctrl[n_wr]2default:default2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
382default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
sys_ctrl[n_rfsh]2default:default2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
382default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
n_halt2default:default2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
402default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
n_busack2default:default2
control2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
422default:default8@Z8-3848h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
control2default:default2
12default:default2
12default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/control.vhd2default:default2
452default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
regfile2default:default2F
2C:/Users/nccas/VivadoWorkspace/gba/src/regfile.vhd2default:default2
342default:default2
REGFILE12default:default2
regfile2default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/cpu.vhd2default:default2
1212default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
regfile2default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/regfile.vhd2default:default2
432default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
regfile2default:default2
22default:default2
12default:default2H
2C:/Users/nccas/VivadoWorkspace/gba/src/regfile.vhd2default:default2
432default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	ALU_block2default:default2H
4C:/Users/nccas/VivadoWorkspace/gba/src/ALU_block.vhd2default:default2
332default:default2
ALUblock2default:default2
	ALU_block2default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/cpu.vhd2default:default2
1302default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	ALU_block2default:default2J
4C:/Users/nccas/VivadoWorkspace/gba/src/ALU_block.vhd2default:default2
412default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ALU2default:default2B
.C:/Users/nccas/VivadoWorkspace/gba/src/ALU.vhd2default:default2
292default:default2
ALU12default:default2
ALU2default:default2J
4C:/Users/nccas/VivadoWorkspace/gba/src/ALU_block.vhd2default:default2
712default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
ALU2default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/ALU.vhd2default:default2
412default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
ALU2default:default2
32default:default2
12default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/ALU.vhd2default:default2
412default:default8@Z8-256h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2

A2_reg_reg2default:default2J
4C:/Users/nccas/VivadoWorkspace/gba/src/ALU_block.vhd2default:default2
912default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2

F2_reg_reg2default:default2J
4C:/Users/nccas/VivadoWorkspace/gba/src/ALU_block.vhd2default:default2
922default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	ALU_block2default:default2
42default:default2
12default:default2J
4C:/Users/nccas/VivadoWorkspace/gba/src/ALU_block.vhd2default:default2
412default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
blk_mem_gen_02default:default2?
?C:/Users/nccas/VivadoWorkspace/gba/vivado/control/control.runs/synth_1/.Xil/Vivado-3724-DESKTOP-NPP0168/realtime/blk_mem_gen_0_stub.v2default:default2
62default:default2
MEM2default:default2!
blk_mem_gen_02default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/cpu.vhd2default:default2
1382default:default8@Z8-3491h px? 
?
synthesizing module '%s'%s4497*oasys2!
blk_mem_gen_02default:default2
 2default:default2?
?C:/Users/nccas/VivadoWorkspace/gba/vivado/control/control.runs/synth_1/.Xil/Vivado-3724-DESKTOP-NPP0168/realtime/blk_mem_gen_0_stub.v2default:default2
62default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
blk_mem_gen_02default:default2
 2default:default2
52default:default2
12default:default2?
?C:/Users/nccas/VivadoWorkspace/gba/vivado/control/control.runs/synth_1/.Xil/Vivado-3724-DESKTOP-NPP0168/realtime/blk_mem_gen_0_stub.v2default:default2
62default:default8@Z8-6155h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
databus_mux2default:default2J
6C:/Users/nccas/VivadoWorkspace/gba/src/databus_mux.vhd2default:default2
372default:default2
DATA_MUX2default:default2
databus_mux2default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/cpu.vhd2default:default2
1482default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
databus_mux2default:default2L
6C:/Users/nccas/VivadoWorkspace/gba/src/databus_mux.vhd2default:default2
462default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
databus_mux2default:default2
62default:default2
12default:default2L
6C:/Users/nccas/VivadoWorkspace/gba/src/databus_mux.vhd2default:default2
462default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
cpu2default:default2
72default:default2
12default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/cpu.vhd2default:default2
432default:default8@Z8-256h px? 
?
!design %s has unconnected port %s3331*oasys2
ALU2default:default2'
control[reg_enable]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
ALU2default:default2'
control[din_alu][2]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
ALU2default:default2'
control[din_alu][1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
ALU2default:default2'
control[din_alu][0]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
ALU2default:default2(
control[dout_alu][2]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
ALU2default:default2(
control[dout_alu][1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
ALU2default:default2(
control[dout_alu][0]2default:defaultZ8-3331h px? 
}
!design %s has unconnected port %s3331*oasys2
ALU2default:default2
flags_in[7]2default:defaultZ8-3331h px? 
}
!design %s has unconnected port %s3331*oasys2
ALU2default:default2
flags_in[6]2default:defaultZ8-3331h px? 
}
!design %s has unconnected port %s3331*oasys2
ALU2default:default2
flags_in[5]2default:defaultZ8-3331h px? 
}
!design %s has unconnected port %s3331*oasys2
ALU2default:default2
flags_in[4]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2"
sys_ctrl[n_m1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2$
sys_ctrl[n_mreq]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2$
sys_ctrl[n_iorq]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2"
sys_ctrl[n_rd]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2"
sys_ctrl[n_wr]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2$
sys_ctrl[n_rfsh]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
control2default:default2
n_halt2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
control2default:default2
n_busack2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2$
cpu_ctrl[n_wait]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2#
cpu_ctrl[n_int]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
control2default:default2#
cpu_ctrl[n_nmi]2default:defaultZ8-3331h px? 
}
!design %s has unconnected port %s3331*oasys2
control2default:default2
n_busrq2default:defaultZ8-3331h px? 
?
%s*synth2?
zFinished RTL Elaboration : Time (s): cpu = 00:00:24 ; elapsed = 00:00:25 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:24 ; elapsed = 00:00:25 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:24 ; elapsed = 00:00:25 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?c:/Users/nccas/VivadoWorkspace/gba/vivado/control/control.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0/blk_mem_gen_0_in_context.xdc2default:default2
MEM	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?c:/Users/nccas/VivadoWorkspace/gba/vivado/control/control.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0/blk_mem_gen_0_in_context.xdc2default:default2
MEM	2default:default8Z20-847h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1987.1172default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1987.1172default:default2
0.0002default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1987.1172default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Constraint Validation : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:31 ; elapsed = 00:00:33 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2!
state_reg_reg2default:default2
control2default:defaultZ8-802h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
inst[inst_type]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
inst[orig_dir]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
inst_next[inst_type]2default:default2
42default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys21
microcode_state_lut[0,8,0][2]2default:default2
42default:default2
52default:defaultZ8-5544h px? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
IX_next2default:defaultZ8-5546h px? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
IY_next2default:defaultZ8-5546h px? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
SP_next2default:defaultZ8-5546h px? 
?
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the output of the operator4233*oasys2
adder2default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/ALU.vhd2default:default2
822default:default8@Z8-5818h px? 
?
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the output of the operator4233*oasys2
adder2default:default2D
.C:/Users/nccas/VivadoWorkspace/gba/src/ALU.vhd2default:default2
822default:default8@Z8-5818h px? 
q
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Z2default:defaultZ8-5546h px? 
q
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Z2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
A_next2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
	temp_next2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE5 |                               00 |                             0000
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE4 |                               01 |                             0001
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE1 |                               10 |                             0010
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE8 |                               11 |                             0110
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
state_reg_reg2default:default2

sequential2default:default2
control2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     17 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      9 Bit       Adders := 2     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit         XORs := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                7 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 4     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  28 Input     17 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  11 Input     16 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      7 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      7 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      6 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  15 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      3 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  21 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  72 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      3 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  15 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  21 Input      2 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  72 Input      2 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   6 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  11 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  28 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  21 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  72 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 9     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  11 Input      1 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  28 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
<
%s
*synth2$
Module control 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                7 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 4     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      7 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      7 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      6 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  15 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      3 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  21 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  72 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      3 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  15 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  21 Input      2 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  72 Input      2 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   6 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  11 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  21 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  72 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
<
%s
*synth2$
Module regfile 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 6     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  11 Input     16 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  11 Input      1 Bit        Muxes := 6     
2default:defaulth p
x
? 
8
%s
*synth2 
Module ALU 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     17 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      9 Bit       Adders := 2     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit         XORs := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  28 Input     17 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  28 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  28 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 6     
2default:defaulth p
x
? 
>
%s
*synth2&
Module ALU_block 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 4     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
@
%s
*synth2(
Module databus_mux 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
ALUblock/ALU1/Z2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
ALUblock/ALU1/Z2default:defaultZ8-5546h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2"
sys_ctrl[n_m1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2$
sys_ctrl[n_mreq]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2$
sys_ctrl[n_iorq]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2"
sys_ctrl[n_rd]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2"
sys_ctrl[n_wr]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2$
sys_ctrl[n_rfsh]2default:defaultZ8-3331h px? 
x
!design %s has unconnected port %s3331*oasys2
cpu2default:default2
n_halt2default:defaultZ8-3331h px? 
z
!design %s has unconnected port %s3331*oasys2
cpu2default:default2
n_busack2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2$
cpu_ctrl[n_wait]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2#
cpu_ctrl[n_int]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cpu2default:default2#
cpu_ctrl[n_nmi]2default:defaultZ8-3331h px? 
y
!design %s has unconnected port %s3331*oasys2
cpu2default:default2
n_busrq2default:defaultZ8-3331h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[0]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[8]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[8]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[0]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[8]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[0]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[0]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
\ALUblock/A_reg_reg[0] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[1]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[9]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[9]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[1]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[9]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[1]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[1]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
\ALUblock/A_reg_reg[1] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[2]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IX_reg_reg[10]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/SP_reg_reg[10]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[2]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IY_reg_reg[10]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[2]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[2]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
\ALUblock/A_reg_reg[2] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[3]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IY_reg_reg[11]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[3]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/SP_reg_reg[11]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IX_reg_reg[11]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[3]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[3]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
\ALUblock/A_reg_reg[3] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
ALUblock/F_reg_reg[4]2default:default2
FDCE2default:default2)
ALUblock/F_reg_reg[5]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[4]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IX_reg_reg[12]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/SP_reg_reg[12]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[4]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IY_reg_reg[12]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[4]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[4]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
\ALUblock/A_reg_reg[4] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
ALUblock/F_reg_reg[5]2default:default2
FDCE2default:default2)
ALUblock/F_reg_reg[6]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[5]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[5]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IY_reg_reg[13]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[5]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[5]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[5]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/SP_reg_reg[13]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[5]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IX_reg_reg[13]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[5]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[5]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[5]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
\ALUblock/A_reg_reg[5] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
ALUblock/F_reg_reg[6]2default:default2
FDCE2default:default2)
ALUblock/F_reg_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[6]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[6]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IX_reg_reg[14]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[6]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/SP_reg_reg[14]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[6]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[6]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[6]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IY_reg_reg[14]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[6]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[6]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[6]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
\ALUblock/A_reg_reg[6] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
ALUblock/F_reg_reg[7]2default:default2
FDCE2default:default2-
ALUblock/tempA_reg_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IX_reg_reg[7]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IX_reg_reg[15]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/SP_reg_reg[15]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/SP_reg_reg[7]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
REGFILE1/IY_reg_reg[15]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
REGFILE1/IY_reg_reg[7]2default:default2
FDCE2default:default2)
ALUblock/A_reg_reg[7]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
\ALUblock/A_reg_reg[7] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2-
ALUblock/tempA_reg_reg[0]2default:default2
FDCE2default:default2-
ALUblock/tempA_reg_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2-
ALUblock/tempA_reg_reg[1]2default:default2
FDCE2default:default2-
ALUblock/tempA_reg_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2-
ALUblock/tempA_reg_reg[2]2default:default2
FDCE2default:default2-
ALUblock/tempA_reg_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2-
ALUblock/tempA_reg_reg[3]2default:default2
FDCE2default:default2-
ALUblock/tempA_reg_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2-
ALUblock/tempA_reg_reg[4]2default:default2
FDCE2default:default2-
ALUblock/tempA_reg_reg[5]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2-
ALUblock/tempA_reg_reg[5]2default:default2
FDCE2default:default2-
ALUblock/tempA_reg_reg[6]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2-
ALUblock/tempA_reg_reg[6]2default:default2
FDCE2default:default2-
ALUblock/tempA_reg_reg[7]2default:defaultZ8-3886h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:40 ; elapsed = 00:00:41 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Timing Optimization : Time (s): cpu = 00:00:40 ; elapsed = 00:00:41 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Technology Mapping : Time (s): cpu = 00:00:40 ; elapsed = 00:00:41 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
wFinished IO Insertion : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|      |BlackBox name |Instances |
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|1     |blk_mem_gen_0 |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
K
%s*synth23
+------+--------------+------+
2default:defaulth px? 
K
%s*synth23
|      |Cell          |Count |
2default:defaulth px? 
K
%s*synth23
+------+--------------+------+
2default:defaulth px? 
K
%s*synth23
|1     |blk_mem_gen_0 |     1|
2default:defaulth px? 
K
%s*synth23
|2     |BUFG          |     1|
2default:defaulth px? 
K
%s*synth23
|3     |CARRY4        |     4|
2default:defaulth px? 
K
%s*synth23
|4     |LUT1          |     2|
2default:defaulth px? 
K
%s*synth23
|5     |LUT2          |     8|
2default:defaulth px? 
K
%s*synth23
|6     |LUT3          |    11|
2default:defaulth px? 
K
%s*synth23
|7     |LUT4          |    36|
2default:defaulth px? 
K
%s*synth23
|8     |LUT5          |    11|
2default:defaulth px? 
K
%s*synth23
|9     |LUT6          |    49|
2default:defaulth px? 
K
%s*synth23
|10    |FDCE          |    36|
2default:defaulth px? 
K
%s*synth23
|11    |FDPE          |     5|
2default:defaulth px? 
K
%s*synth23
|12    |IBUF          |    10|
2default:defaulth px? 
K
%s*synth23
|13    |OBUF          |    24|
2default:defaulth px? 
K
%s*synth23
|14    |OBUFT         |     8|
2default:defaulth px? 
K
%s*synth23
+------+--------------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
S
%s
*synth2;
'+------+-----------+----------+------+
2default:defaulth p
x
? 
S
%s
*synth2;
'|      |Instance   |Module    |Cells |
2default:defaulth p
x
? 
S
%s
*synth2;
'+------+-----------+----------+------+
2default:defaulth p
x
? 
S
%s
*synth2;
'|1     |top        |          |   213|
2default:defaulth p
x
? 
S
%s
*synth2;
'|2     |  ALUblock |ALU_block |     8|
2default:defaulth p
x
? 
S
%s
*synth2;
'|3     |  CONTROL1 |control   |   133|
2default:defaulth p
x
? 
S
%s
*synth2;
'|4     |  REGFILE1 |regfile   |    21|
2default:defaulth p
x
? 
S
%s
*synth2;
'+------+-----------+----------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 12 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Runtime : Time (s): cpu = 00:00:12 ; elapsed = 00:00:37 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:41 ; elapsed = 00:00:42 . Memory (MB): peak = 1987.117 ; gain = 1620.301
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
42default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1987.1172default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1152default:default2
482default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:432default:default2
00:00:442default:default2
1987.1172default:default2
1631.8122default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1987.1172default:default2
0.0002default:defaultZ17-268h px? 
K
"No constraints selected for write.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2b
NC:/Users/nccas/VivadoWorkspace/gba/vivado/control/control.runs/synth_1/cpu.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2p
\Executing : report_utilization -file cpu_utilization_synth.rpt -pb cpu_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon Jan 10 23:01:35 20222default:defaultZ17-206h px? 


End Record