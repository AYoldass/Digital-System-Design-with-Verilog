

I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:082default:default2
00:00:092default:default2
409.4062default:default2
60.9062default:defaultZ17-268h px 
x
Command: %s
53*	vivadotcl2G
3synth_design -top sort_memory -part xc7z020clg484-32default:defaultZ4-113h px 
:
Starting synth_design
149*	vivadotclZ4-321h px 

@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0202default:defaultZ17-347h px 

0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0202default:defaultZ17-349h px 

HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px 
_
#Helper process launched with PID %s4824*oasys2
24402default:defaultZ8-7075h px 

5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px 
 
%s*synth2
sStarting Synthesize : Time (s): cpu = 00:00:10 ; elapsed = 00:00:12 . Memory (MB): peak = 847.734 ; gain = 413.457
2default:defaulth px 

synthesizing module '%s'%s4497*oasys2
sort_memory2default:default2
 2default:default2
vC:/Users/ahmet/Desktop/4.sınıf/Digital System Design/Sort_Memory_Separate/Sort_Memory.srcs/sources_1/new/sort_memory.v2default:default2
52default:default8@Z8-6157h px 

synthesizing module '%s'%s4497*oasys2
memory_unit2default:default2
 2default:default2
vC:/Users/ahmet/Desktop/4.sınıf/Digital System Design/Sort_Memory_Separate/Sort_Memory.srcs/sources_1/new/memory_unit.v2default:default2
62default:default8@Z8-6157h px 

,$readmem data file '%s' is read successfully3426*oasys2
BRAM.mem2default:default2
vC:/Users/ahmet/Desktop/4.sınıf/Digital System Design/Sort_Memory_Separate/Sort_Memory.srcs/sources_1/new/memory_unit.v2default:default2
212default:default8@Z8-3876h px 
ú
-case statement is not full and has no default155*oasys2
vC:/Users/ahmet/Desktop/4.sınıf/Digital System Design/Sort_Memory_Separate/Sort_Memory.srcs/sources_1/new/memory_unit.v2default:default2
292default:default8@Z8-155h px 
Ú
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
memory_unit2default:default2
 2default:default2
02default:default2
12default:default2
vC:/Users/ahmet/Desktop/4.sınıf/Digital System Design/Sort_Memory_Separate/Sort_Memory.srcs/sources_1/new/memory_unit.v2default:default2
62default:default8@Z8-6155h px 

&Input port '%s' has an internal driver4442*oasys2
	content_a2default:default2
vC:/Users/ahmet/Desktop/4.sınıf/Digital System Design/Sort_Memory_Separate/Sort_Memory.srcs/sources_1/new/sort_memory.v2default:default2
372default:default8@Z8-6104h px 

&Input port '%s' has an internal driver4442*oasys2
	content_b2default:default2
vC:/Users/ahmet/Desktop/4.sınıf/Digital System Design/Sort_Memory_Separate/Sort_Memory.srcs/sources_1/new/sort_memory.v2default:default2
372default:default8@Z8-6104h px 
Ú
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
sort_memory2default:default2
 2default:default2
02default:default2
12default:default2
vC:/Users/ahmet/Desktop/4.sınıf/Digital System Design/Sort_Memory_Separate/Sort_Memory.srcs/sources_1/new/sort_memory.v2default:default2
52default:default8@Z8-6155h px 
°
qTrying to implement RAM '%s' in registers. Block RAM or DRAM implementation is not possible; see log for reasons.3901*oasys2
mem_reg2default:defaultZ8-4767h px 
U
%s
*synth2=
)Reason is one or more of the following :
2default:defaulth p
x
 
«
%s
*synth2
~	1: RAM has multiple writes via different ports in same process. If RAM inferencing intended, write to one port per process. 
2default:defaulth p
x
 
j
%s
*synth2R
>	2: Unable to determine number of words or word size in RAM. 
2default:defaulth p
x
 
T
%s
*synth2<
(	3: No valid read/write found for RAM. 
2default:defaulth p
x
 
S
%s
*synth2;
'RAM "mem_reg" dissolved into registers
2default:defaulth p
x
 