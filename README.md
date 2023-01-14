# WonderSwan TimingTest V0.2.0

This is a program to test the timing of the CPU in a Bandai WonderSwan.
These results are not an absolute definition of how long an opcode takes, the cpu has an instruction pipeline which is flushed when branching, it takes 1 extra clock when branching to an odd address, it also seems to take more cycles depending on what the destination instruction is. I have tried to make the tests of jump/branch/call avoid these situations but I'm not sure I did it correctly everywhere.
The test loop also takes 1 more cycle than it should, I'm not sure why this is yet, in my emulator I check for 3 nops and add 1 extra cycle, this is not correct but is a way to test all opcode timings.
You can also not compare the result value between opcodes, the result value is for the whole test loop, not the individual opcode. Some opcodes require more glue code than other, please check the source code to see what is happening.
The program test _all_ opcodes, even the undefined ones, on the WonderSwan these are almost allways one or two byte nops, including 0x0F & 0xFF 0x07.
Halt (0xF4) test uses serial buffer empty interrupt, I also enable VBlank so that it can continue if serial interrupts are not suported.
All opcode names are in Intel notation and not in NEC notation.

## How to use

Use X4 (Left) & X2 (Right) to switch between pages.
The result values are number of scanlines to run the test loop for each test, the tests are run 1000 times right now which means that the number of clock cycles x 4 almost should be the test result. Some result values can differ by 1 during certain circumstances this is not an error but happens on HW as well.
I have run the test on my Pink WonderSwan Color to get the results.

## Cycle counting according to NEC

The normal cycle count is achieved when:

1. Instruction decoding is completed. (I guess this is that the prefetch is filled).
2. No wait state occurs during memory access or I/O access. (On the WS you can set the ROM to 3 wait states).
3. There is no bus hold request.
4. Word data is allocated to even addresses. (Word access to odd address adds 1 cycle)
5. Registers required for calculating effective addresses (BX, BP, SP, SI, DI, etc.) do not change at immediately preceding instruction.
6. There is only 1 register required for calculating effective addresses. (All tested instructions adds 2 cycles except LEA, LDS, LES & POP Word which only adds 1 cycle).
7. The branching destination of a branch instruction is an even address. (Branching to odd address adds 1 cycle)

## Credits

```text
First version by Robert Peip. https://github.com/RobertPeip
Additions and corrections by Fredrik Ahlström.

Thanks to:
Ed Mandy (Flavor) for WonderSwan info & flashcart. https://www.flashmasta.com
Koyote for WonderSwan info.
Alex Marshall (trap15) for WonderSwan info. http://daifukkat.su/docs/wsman/
Guy Perfect for WonderSwan info http://perfectkiosk.net/stsws.html
asie for info and inspiration.
Godzil for boot rom stubs. https://github.com/Godzil/NewOswan
lidnariq for RTC info.
```

Twitter @TheRealFluBBa

<https://www.github.com/FluBBaOfWard>
