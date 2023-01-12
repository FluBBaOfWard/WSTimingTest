;
;  tests_op.asm
;  V30MZ cpu timing tester for WonderSwan.
;
;  Created by Robert Peip on 2021.
;  Additions by Fredrik Ahlström on 2022-12-13.
;

;#################################################################
;############ Group 0x0
;#################################################################

SIMPLETEST {add byte [workbyte], al}, 00

SIMPLETEST {add word [workword], ax}, 01

SIMPLETEST {add byte al, [workbyte]}, 02

SIMPLETEST {add word ax, [workword]}, 03

SIMPLETEST {add al, 40}, 04

SIMPLETEST {add ax, 1234}, 05

test_op06:
   dotest2 push es, {add sp, 2}, op06
   ret

test_op07:
   push es
   dotest2 pop es, {sub sp, 2}, op07
   pop es
   ret

SIMPLETEST {or byte [workbyte], al}, 08

SIMPLETEST {or word [workword], ax}, 09

SIMPLETEST {or byte al, [workbyte]}, 0A

SIMPLETEST {or word ax, [workword]}, 0B

SIMPLETEST {or al, 40}, 0C

SIMPLETEST {or ax, 1234}, 0D

test_op0E:
   dotest2 push cs, {add sp, 2}, op0E
   ret

SIMPLETEST db 0x0f, 0F


;#################################################################
;############ Group 0x1
;#################################################################

SIMPLETEST {adc byte [workbyte], al}, 10

SIMPLETEST {adc word [workword], ax}, 11

SIMPLETEST {adc byte al, [workbyte]}, 12

SIMPLETEST {adc word ax, [workword]}, 13

SIMPLETEST {adc al, 40}, 14

SIMPLETEST {adc ax, 1234}, 15

test_op16:
   dotest2 push ss, {add sp, 2}, op16
   ret

test_op17:
   push ss
   dotest2 pop ss, {sub sp, 2}, op17
   pop ss
   ret

SIMPLETEST {sbb byte [workbyte], al}, 18

SIMPLETEST {sbb word [workword], ax}, 19

SIMPLETEST {sbb byte al, [workbyte]}, 1A

SIMPLETEST {sbb word ax, [workword]}, 1B

SIMPLETEST {sbb al, 40}, 1C

SIMPLETEST {sbb ax, 1234}, 1D

test_op1E:
   dotest2 push ds, {add sp, 2}, op1E
   ret

test_op1F:
   push ds
   dotest2 pop ds, {sub sp, 2}, op1F
   pop ds
   ret  

;#################################################################
;############ Group 0x2
;#################################################################

SIMPLETEST {and byte [workbyte], al}, 20

SIMPLETEST {and word [workword], ax}, 21

SIMPLETEST {and byte al, [workbyte]}, 22

SIMPLETEST {and word ax, [workword]}, 23

SIMPLETEST {and al, 40}, 24

SIMPLETEST {and ax, 1234}, 25

SIMPLETEST {mov ax, [es:workword]}, 26

SIMPLETEST daa, 27

SIMPLETEST {sub byte [workbyte], al}, 28

SIMPLETEST {sub word [workword], ax}, 29

SIMPLETEST {sub byte al, [workbyte]}, 2A

SIMPLETEST {sub word ax, [workword]}, 2B

SIMPLETEST {sub al, 40}, 2C

SIMPLETEST {sub ax, 1234}, 2D

SIMPLETEST {mov ax, [cs:workword]}, 2E

SIMPLETEST das, 2F


;#################################################################
;############ Group 0x3
;#################################################################

SIMPLETEST {xor byte [workbyte], al}, 30

SIMPLETEST {xor word [workword], ax}, 31

SIMPLETEST {xor byte al, [workbyte]}, 32

SIMPLETEST {xor word ax, [workword]}, 33

SIMPLETEST {xor al, 40}, 34

SIMPLETEST {xor ax, 1234}, 35

SIMPLETEST {mov ax, [ss:workword]}, 36

SIMPLETEST aaa, 37

SIMPLETEST {cmp byte [workbyte], al}, 38

SIMPLETEST {cmp word [workword], ax}, 39

SIMPLETEST {cmp byte al, [workbyte]}, 3A

SIMPLETEST {cmp word ax, [workword]}, 3B

SIMPLETEST {cmp al, 40}, 3C

SIMPLETEST {cmp ax, 1234}, 3D

SIMPLETEST {mov ax, [ds:workword]}, 3E

SIMPLETEST aas, 3F

;#################################################################
;############ Group 0x4
;#################################################################

SIMPLETEST inc ax, 40

test_op41:
   mov bx, TESTCOUNT
align 2
repeat_op41:
   fill_prefetch
   inc cx
   dec bx
   jnz repeat_op41
   ret

test_op42:
   mov dx, 0x1000
   dotest inc dx, op42
   ret

SIMPLETEST inc bx, 43

test_op44:
   mov bx, sp
   dotest inc sp, op44
   mov sp, bx
   ret

SIMPLETEST inc bp, 45
SIMPLETEST inc si, 46
SIMPLETEST inc di, 47
SIMPLETEST dec ax, 48

test_op49:
   mov bx, TESTCOUNT
align 2
repeat_op49:
   fill_prefetch
   dec cx
   dec bx
   jnz repeat_op49
   ret

SIMPLETEST dec dx, 4A
SIMPLETEST dec bx, 4B

test_op4C:
   mov bx, sp
   dotest dec sp, op4C
   mov sp, bx
   ret

SIMPLETEST dec bp, 4D
SIMPLETEST dec si, 4E
SIMPLETEST dec di, 4F


;#################################################################
;############ Group 0x5
;#################################################################

PUSHTEST ax, 50
PUSHTEST cx, 51
PUSHTEST dx, 52
PUSHTEST bx, 53
PUSHTEST sp, 54
PUSHTEST bp, 55
PUSHTEST si, 56
PUSHTEST di, 57
POPTEST  ax, 58

test_op59:
   mov bx, TESTCOUNT
align 2
repeat_op59:
   fill_prefetch
   pop cx
   sub sp, 2
   dec bx
   jnz repeat_op59
   ret

POPTEST  dx, 5A
POPTEST  bx, 5B

test_op5C:
   mov bx, sp
   push sp
   dotest pop sp, op5C
   mov sp, bx
   ret

POPTEST  bp, 5D
POPTEST  si, 5E
POPTEST  di, 5F

;#################################################################
;############ Group 0x6
;#################################################################

test_op60:
   dotest2 pusha, {add sp, 16}, op60
   ret

test_op61:
   mov cx,TESTCOUNT
align 2
repeat_op61:
   fill_prefetch
   push cx
   popa
   sub sp, 16
   pop cx 
   dec cx
   jnz repeat_op61
   ret

test_op62:
	mov ax, MYSEGMENT
	mov ds, ax
   mov bx, boundData
   mov dx, 1235
   dotest {bound dx, [bx]}, op62
   ret

SIMPLETEST db 0x63, 63

SIMPLETEST db 0x64, 64

SIMPLETEST db 0x65, 65

SIMPLETEST db 0x66, 66

SIMPLETEST db 0x67, 67

PUSHTEST 1234, 68

test_op69:
   dotest {db 0x69, 0xC0, 0xD2, 0x04}, op69 ; mul ax <= ax,1234
   ret

PUSHTEST 42, 6A

test_op6B:
   dotest {db 0x6B, 0xC0, 0x2A}, op6B ; mul ax <= ax, 42
   ret

test_op6C:
   mov di, scratchspace
   dotest insb, op6C
   ret

test_op6D:
   mov di, scratchspace
   dotest insw, op6D
   ret

test_op6E:
   mov dx, 44
  	mov si, scratchspace
   dotest outsb, op6E
   ret

test_op6F:
   mov dx, 44
   mov si, scratchspace
   dotest outsw, op6F
   ret

;#################################################################
;############ Group 0x7
;#################################################################

test_op70:
align 2
repeat_op70:
   fill_prefetch
   mov al, 64
   add al, al ; Set oVerflow
   jo dest_op70
align 2
dest_op70:
   dec cx
   jnz repeat_op70
   ret

test_op71:
   mov al, 32
   add al, al ; Clear oVerflow
align 2
repeat_op71:
   fill_prefetch
   jno dest_op71
align 2
dest_op71:
   dec cx ; No Overflow
   jnz repeat_op71
   ret

test_op72:
align 2
repeat_op72:
   fill_prefetch
   stc ; Set Carry
   jc dest_op72
align 2
dest_op72:
   dec cx
   jnz repeat_op72
   ret

test_op73:
align 2
repeat_op73:
   fill_prefetch
   clc ; Clear Carry
   jnc dest_op73
align 2
dest_op73:
   dec cx
   jnz repeat_op73
   ret

test_op74:
align 2
repeat_op74:
   fill_prefetch
   xor al, al
   jz dest_op74
align 2
dest_op74:
   dec cx
   jnz repeat_op74
   ret

test_op75:
   cmp cx, 0 ; Clear Zero
align 2
repeat_op75:
   fill_prefetch
   jnz dest_op75
align 2
dest_op75:
   dec cx
   jnz repeat_op75
   ret

test_op76:
align 2
repeat_op76:
   fill_prefetch
   mov al, 128
   add al, al ; Set Carry & Zero
   jbe dest_op76
align 2
dest_op76:
   dec cx
   jnz repeat_op76
   ret

test_op77:
align 2
repeat_op77:
   fill_prefetch
   mov al, 32
   add al, al ; Clear Carry & Zero
   jnbe dest_op77
align 2
dest_op77:
   dec cx
   jnz repeat_op77
   ret

test_op78:
align 2
repeat_op78:
   fill_prefetch
   mov al, 64
   add al, al ; Set Sign
   js dest_op78
align 2
dest_op78:
   dec cx
   jnz repeat_op78
   ret

test_op79:
align 2
repeat_op79:
   fill_prefetch
   mov al, 32
   add al, al ; Clear Sign
   jns dest_op79
align 2
dest_op79:
   dec cx
   jnz repeat_op79
   ret

test_op7A:
align 2
repeat_op7A:
   fill_prefetch
   and al, 0 ; Set Parity
   jp dest_op7A
align 2
dest_op7A:
   dec cx
   jnz repeat_op7A
   ret

test_op7B:
   mov bl, 0
align 2
repeat_op7B:
   fill_prefetch
   or bl, 1 ; Clear Parity
   jnp dest_op7B
align 2
dest_op7B:
   dec cx
   jnz repeat_op7B
   ret

test_op7C:
align 2
repeat_op7C:
   fill_prefetch
   mov al, 130
   add al, 2 ; Set Sign != oVerflow
   jl dest_op7C
align 2
dest_op7C:
   dec cx
   jnz repeat_op7C
   ret

test_op7D:
align 2
repeat_op7D:
   fill_prefetch
   mov al, 65
   add al, al ; Set Sign == oVerflow
   jnl dest_op7D
align 2
dest_op7D:
   dec cx
   jnz repeat_op7D
   ret

test_op7E:
align 2
repeat_op7E:
   fill_prefetch
   mov al, 130
   add al, 2 ; Set Sign != oVerflow
   jle dest_op7E
align 2
dest_op7E:
   dec cx
   jnz repeat_op7E
   ret

test_op7F:
align 2
repeat_op7F:
   fill_prefetch
   mov al, 65
   add al, al ; Set Sign == oVerflow
   jnle dest_op7F
align 2
dest_op7F:
   dec cx
   jnz repeat_op7F
   ret

;#################################################################
;############ Group 0x8
;#################################################################

SIMPLETEST {add byte [workword], 42}, 80

SIMPLETEST {add word [workword], 1234}, 81

test_op82:
   dotest2 db 0x82, dd 0xD6000206, op82 ; add byte [workword], -42
   ret

SIMPLETEST {add word [workword], -42}, 83

SIMPLETEST {test byte al,[workword]}, 84

SIMPLETEST {test word ax,[workword]}, 85

SIMPLETEST {xchg byte al,[workword]}, 86

SIMPLETEST {xchg word ax,[workword]}, 87

SIMPLETEST {mov byte [workword],bl}, 88

SIMPLETEST {mov word [workword],bx}, 89

SIMPLETEST {mov byte bl,[workword]}, 8A

SIMPLETEST {mov word bx,[workword]}, 8B

SIMPLETEST {mov ax, ss}, 8C

SIMPLETEST {lea ax, [workword]}, 8D

test_op8E:
   push es
   dotest {mov es, [workword]}, op8E
   pop es
   ret

test_op8F:
   push ax
   dotest2 pop word [workword], {sub sp, 2}, op8F
   pop ax
   ret

;#################################################################
;############ Group 0x9
;#################################################################

SIMPLETEST nop, 90

test_op91:
   dotest2 {xchg ax, cx}, {mov cx, ax}, op91
   ret

SIMPLETEST {xchg ax, dx}, 92

SIMPLETEST {xchg ax, bx}, 93

test_op94:
   dotest2 {xchg ax, sp}, {mov sp, ax}, op94
   ret

test_op95:
   dotest2 {xchg ax, bp}, {mov bp, ax}, op95
   ret

test_op96:
   dotest2 {xchg ax, si}, {mov si, ax}, op96
   ret

test_op97:
   dotest2 {xchg ax, di}, {mov di, ax}, op97
   ret

SIMPLETEST cbw, 98 ; sign extend byte
SIMPLETEST cwd, 99 ; sign extend word

test_op9A:
align 2
repeat_op9A:
   fill_prefetch
   call MYSEGMENT:dest_op9A
align 2
dest_op9A:
   pop ax
   pop ax
   dec cx
   jnz repeat_op9A
   ret

SIMPLETEST wait, 9B ; wait

test_op9C:
   dotest2 {pushf}, {add sp, 2}, op9C
   ret

test_op9D:
   pushf
   dotest2 {popf}, {sub sp, 2}, op9D
   popf
   ret

SIMPLETEST sahf, 9E ; acc to flags
SIMPLETEST lahf, 9F ; flags to acc

;#################################################################
;############ Group 0xA
;#################################################################

SIMPLETEST {mov al, [workword]}, A0

SIMPLETEST {mov ax, [workword]}, A1

SIMPLETEST {mov byte [workword], al}, A2

SIMPLETEST {mov word [workword], ax}, A3

test_opA4:
   push si
   push di
   mov di, scratchspace
   dotest movsb, opA4
   pop di
   pop si
   ret

test_opA5:
   push si
   push di
   and si, 0xFFFE
   mov di, scratchspace
   dotest movsw, opA5
   pop di
   pop si
   ret

test_opA6:
   push si
   push di
   dotest cmpsb, opA6
   pop di
   pop si
   ret

test_opA7:
   push si
   push di
   and si, 0xFFFE
   and di, 0xFFFE
   dotest cmpsw, opA7
   pop di
   pop si
   ret

SIMPLETEST {test al, 42}, A8

SIMPLETEST {test ax, 1234}, A9

test_opAA:
   push di
   push es
   mov ax, 0xF000
   mov es, ax
   dotest stosb, opAA
   pop es
   pop di
   ret

test_opAB:
   push di
   push es
   and di, 0xFFFE
   mov ax, 0xF000
   mov es, ax
   dotest stosw, opAB
   pop es
   pop di
   ret

test_opAC:
   push si
   dotest lodsb, opAC
   pop si
   ret

test_opAD:
   push si
   and si, 0xFFFE
   dotest lodsw, opAD
   pop si
   ret

test_opAE:
   push di
   dotest scasb, opAE
   pop di
   ret

test_opAF:
   push di
   and di, 0xFFFE
   dotest scasw, opAF
   pop di
   ret

;#################################################################
;############ Group 0xB
;#################################################################

LOADIMMIDIATE al,   42, B0

test_opB1:
   mov bx, TESTCOUNT
align 2
repeat_opB1:
   fill_prefetch
   mov cl, 42
   dec bx
   jnz repeat_opB1
   ret

LOADIMMIDIATE dl,   42, B2
LOADIMMIDIATE bl,   42, B3
LOADIMMIDIATE ah,   42, B4

test_opB5:
   mov bx, TESTCOUNT
align 2
repeat_opB5:
   fill_prefetch
   mov ch, 42
   dec bx
   jnz repeat_opB5
   ret

LOADIMMIDIATE dh,   42, B6
LOADIMMIDIATE bh,   42, B7
LOADIMMIDIATE ax, 1234, B8

test_opB9:
   mov bx, TESTCOUNT
align 2
repeat_opB9:
   fill_prefetch
   mov cx, 1234
   dec bx
   jnz repeat_opB9
   ret

LOADIMMIDIATE dx, 1234, BA
LOADIMMIDIATE bx, 1234, BB

test_opBC:
   mov bx,sp
   dotest {mov sp, 1234}, opBC
   mov sp,bx
   ret

SIMPLETEST {mov bp, 1234}, BD

test_opBE:
   push si
   dotest {mov si, 1234}, opBE
   pop si
   ret

test_opBF:
   push di
   dotest {mov di, 1234}, opBF
   pop di
   ret

;#################################################################
;############ Group 0xC
;#################################################################

SIMPLETEST {ror byte [workword], 2}, C0

SIMPLETEST {ror word [workword], 2}, C1

test_opC2:
   mov ax, dest_opC2
   push ax
align 2
repeat_opC2:
   fill_prefetch
   ret -2
align 2
dest_opC2:
   dec cx
   jnz repeat_opC2
   add sp, 2
   ret

test_opC3:
   mov bx, dest_opC3
align 2
repeat_opC3:
   fill_prefetch
   push bx
   ret
align 2
dest_opC3:
   dec cx
   jnz repeat_opC3
   ret

test_opC4:
   push es
   dotest {les ax, [workword]}, opC4
   pop es
   ret

test_opC5:
   push ds
   dotest {lds ax, [workword]}, opC5
   pop ds
   ret

SIMPLETEST {mov byte [workword], 42}, C6

SIMPLETEST {mov word [workword], 1234}, C7

SIMPLETEST {enter -2, 0}, C8

test_opC9:
   mov bp, sp
   sub bp, 2
   push bp
   dotest leave, opC9
   ret

test_opCA:
   mov ax, dest_opCA
   push cs
   push ax
align 2
repeat_opCA:
   fill_prefetch
   retf -4
align 2
dest_opCA:
   dec cx
   jnz repeat_opCA
   add sp, 4
   ret

test_opCB:
   mov bx, dest_opCB
align 2
repeat_opCB:
   fill_prefetch
   push cs
   push bx
   retf
align 2
dest_opCB:
   dec cx
   jnz repeat_opCB
   ret

test_opCC:
align 2
repeat_opCC:
   fill_prefetch
   dec cx
   int3
   jnz repeat_opCC
   ret

SIMPLETEST {int 4}, CD

test_opCE:
align 2
repeat_opCE:
   fill_prefetch
   dec cx      ; No Overflow
   into
   jnz repeat_opCE
   ret

test_opCF:
   mov bx, dest_opCF
align 2
repeat_opCF:
   fill_prefetch
   pushf
   push cs
   push bx
   iret
align 2
dest_opCF:
   dec cx
   jnz repeat_opCF
   ret

;#################################################################
;############ Group 0xD
;#################################################################

SIMPLETEST {ror byte [workword], 1}, D0
SIMPLETEST {ror word [workword], 1}, D1
SIMPLETEST {ror byte [workword], cl}, D2
SIMPLETEST {ror word [workword], cl}, D3

SIMPLETEST aam, D4
SIMPLETEST aad, D5

SIMPLETEST salc, D6 ; SALC
SIMPLETEST xlatb, D7

SIMPLETEST dw 0x00D8, D8
SIMPLETEST dw 0x00D9, D9
SIMPLETEST dw 0x00DA, DA
SIMPLETEST dw 0x00DB, DB
SIMPLETEST dw 0x00DC, DC
SIMPLETEST dw 0x00DD, DD
SIMPLETEST dw 0x00DE, DE
SIMPLETEST dw 0x00DF, DF


;#################################################################
;############ Group 0xE
;#################################################################

test_opE0:
align 2
repeat_opE0:
   fill_prefetch
   inc cx
   loopne dest_opE0
align 2
dest_opE0:
   dec cx
   jnz repeat_opE0
   ret

test_opE1:
align 2
repeat_opE1:
   fill_prefetch
   inc cx
   xor al, al
   loope dest_opE1
align 2
dest_opE1:
   dec cx
   jnz repeat_opE1
   ret

test_opE2:
align 2
repeat_opE2:
   fill_prefetch
   inc cx
   loop dest_opE2
align 2
dest_opE2:
   dec cx
   jnz repeat_opE2
   ret

test_opE3:
   mov cx, 0
   mov bx, TESTCOUNT
align 2
repeat_opE3:
   fill_prefetch
   jcxz dest_opE3
align 2
dest_opE3:
   dec bx
   jnz repeat_opE3
   ret

SIMPLETEST {in al, 0}, E4

SIMPLETEST {in ax, 0}, E5

SIMPLETEST {out 44, al}, E6

SIMPLETEST {out 44, ax}, E7

test_opE8:
align 2
.loop:
   fill_prefetch
   call .dest
align 2
.dest:
   pop ax
   dec cx
   jnz .loop
   ret

test_opE9:
   mov cx,TESTCOUNT
align 2
.loop:
   fill_prefetch
   jmp word .dest
align 2
.dest:
   dec cx
   jnz .loop
   ret

test_opEA:
   mov cx,TESTCOUNT
align 2
.loop:
   fill_prefetch
   jmp MYSEGMENT:.dest
align 2
.dest:
   dec cx
   jnz .loop
   ret

test_opEB:
   mov cx,TESTCOUNT
align 2
.loop:
   fill_prefetch
   jmp short .dest
align 2
.dest:
   dec cx
   jnz .loop
   ret

test_opEC:
   mov dx, 0
   dotest {in al, dx}, opEC
   ret

test_opED:
   mov dx, 0
   dotest {in ax, dx}, opED
   ret

test_opEE:
   mov dx, 44
   dotest {out dx, al}, opEE
   ret

test_opEF:
   mov dx, 44
   dotest {out dx, ax}, opEF
   ret  

;#################################################################
;############ Group 0xF
;#################################################################

test_opF0:
   dotest2 lock, nop, opF0
   ret

NOTEST F1 ; crash

test_opF2:
   dotest2 repne, nop, opF2
   ret

test_opF3:
   dotest2 rep, nop, opF3
   ret

test_opF4:
   mov al, COMM_ENABLE | COMM_SPEED_38400
   out IO_COMM_DIR, al
   mov al, INT_SERIAL_SEND | INT_VBLANK_START
   out IO_INT_ENABLE, al
   dotest hlt, opF4
   mov al, 0
   out IO_COMM_DIR, al
   out IO_INT_ENABLE, al
   dec al
   out IO_INT_ACK, al
   ret

SIMPLETEST cmc, F5
SIMPLETEST clc, F8
SIMPLETEST stc, F9
SIMPLETEST cli, FA

test_opFB:
   dotest sti, opFB
   cli
   ret

SIMPLETEST cld, FC   

test_opFD:
   dotest std, opFD
   cld
   ret

;#################################################################
;############ Group mem imm 3
;#################################################################

test_I30:
   dotest {test byte [workword], 42}, opI30
   ret

test_I31:
   dotest {db 0xf6, 0xC8 }, opI31
   ret

test_I32:
   dotest {not byte [workword]}, opI32
   ret

test_I33:
   dotest {neg byte [workword]}, opI33
   ret

test_I34:
   dotest {mul byte [workword]}, opI34
   ret

test_I35:
   dotest {imul byte [workword]}, opI35
   ret

test_I36:
   xor ah, ah
   mov word [es:workword], 1
   dotest {div byte [es:workword]}, opI36
   ret

test_I37:
   xor ah, ah
   mov word [es:workword], 1
   dotest {idiv byte [es:workword]}, opI37
   ret

test_I38:
   dotest {test word [workword], 42}, opI38
   ret

test_I39:
   dotest {db 0xf7, 0xC8 }, opI39
   ret

test_I3A:
   dotest {not word [workword]}, opI3A
   ret

test_I3B:
   dotest {neg word [workword]}, opI3B
   ret

test_I3C:
   dotest {mul word [workword]}, opI3C
   ret

test_I3D:
   dotest {imul word [workword]}, opI3D
   ret

test_I3E:
   xor dx, dx
   mov word [es:workword], 1
   dotest {div word [es:workword]}, opI3E
   ret

test_I3F:
   xor dx, dx
   mov word [es:workword], 1
   dotest {idiv word [es:workword]}, opI3F
   ret

;#################################################################
;############ Group mem imm 4
;#################################################################

test_I40:
   dotest {inc byte [workword]}, opI40
   ret

test_I41:
   dotest {dec byte [workword]}, opI41
   ret

test_I48:
   dotest {inc word [workword]}, opI48
   ret

test_I49:
   dotest {dec word [workword]}, opI49
   ret

i4A_addresses:
   dw dest_I4A
test_I4A:
align 2
repeat_I4A:
   fill_prefetch
   call [i4A_addresses]
align 2
dest_I4A:
   pop ax
   dec cx
   jnz repeat_I4A
   ret

i4B_addresses:
   dw dest_I4B, MYSEGMENT
test_I4B:
align 2
repeat_I4B:
   fill_prefetch
   call far [i4B_addresses]
align 2
dest_I4B:
   pop ax
   pop ax
   dec cx
   jnz repeat_I4B
   ret

i4C_addresses:
   dw dest_I4C
test_I4C:
align 2
repeat_I4C:
   fill_prefetch
   jmp [i4C_addresses]
align 2
dest_I4C:
   dec cx
   jnz repeat_I4C
   ret

i4D_addresses:
   dw dest_I4D, MYSEGMENT
test_I4D:
align 2
repeat_I4D:
   fill_prefetch
   jmp far [i4D_addresses]
align 2
dest_I4D:
   dec cx
   jnz repeat_I4D
   ret

test_I4E:
   dotest2 push word [workword], {add sp, 2}, opI4E
   ret

test_I4F:
   dotest {db 0xff, 0xf8 }, opI4F
   ret

;#################################################################
;############ Group Effective Address
;#################################################################

test_A00:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest {mov al, [bx + si]}, A00
   ret

test_A01:
   and bx, 0xFFFE
   and di, 0xFFFE
   dotest {mov al, [bx + di]}, A01
   ret

test_A02:
   and bp, 0xFFFE
   and si, 0xFFFE
   dotest {mov al, [bp + si]}, A02
   ret

test_A03:
   and bp, 0xFFFE
   and di, 0xFFFE
   dotest {mov al, [bp + di]}, A03
   ret

test_A04:
   and si, 0xFFFE
   dotest {mov al, [si]}, A04
   ret

test_A05:
   and di, 0xFFFE
   dotest {mov al, [di]}, A05
   ret

test_A06:
   dotest {db 0x8A, 0x06, 0x00, 0x00}, A06
   ret

test_A07:
   and bx, 0xFFFE
   dotest {mov al, [bx]}, A07
   ret

test_A40:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest {mov al, [bx + si + 2]}, A40
   ret

test_A41:
   and bx, 0xFFFE
   and di, 0xFFFE
   dotest {mov al, [bx + di + 2]}, A41
   ret

test_A42:
   and bp, 0xFFFE
   and si, 0xFFFE
   dotest {mov al, [bp + si + 2]}, A42
   ret

test_A43:
   and bp, 0xFFFE
   and di, 0xFFFE
   dotest {mov al, [bp + di + 2]}, A43
   ret

test_A44:
   and si, 0xFFFE
   dotest {mov al, [si + 2]}, A44
   ret

test_A45:
   and di, 0xFFFE
   dotest {mov al, [di + 2]}, A45
   ret

test_A46:
   and bp, 0xFFFE
   dotest {mov al, [bp + 2]}, A46
   ret

test_A47:
   and bx, 0xFFFE
   dotest {mov al, [bx + 2]}, A47
   ret

test_A80:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest {mov al, [bx + si + 1234]}, A80
   ret

test_A81:
   and bx, 0xFFFE
   and di, 0xFFFE
   dotest {mov al, [bx + di + 1234]}, A81
   ret

test_A82:
   and bp, 0xFFFE
   and si, 0xFFFE
   dotest {mov al, [bp + si + 1234]}, A82
   ret

test_A83:
   and bp, 0xFFFE
   and di, 0xFFFE
   dotest {mov al, [bp + di + 1234]}, A83
   ret

test_A84:
   and si, 0xFFFE
   dotest {mov al, [si + 1234]}, A84
   ret

test_A85:
   and di, 0xFFFE
   dotest {mov al, [di + 1234]}, A85
   ret

test_A86:
   and bp, 0xFFFE
   dotest {mov al, [bp + 1234]}, A86
   ret

test_A87:
   and bx, 0xFFFE
   dotest {mov al, [bx + 1234]}, A87
   ret

test_EA11:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest {adc [bx + si], ax}, EA11
   ret

test_EA69:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest {imul ax, [bx + si], 1234}, EA69
   ret

test_EA89:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest {mov [bx + si], ax}, EA89
   ret

test_EA8D:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest {lea ax, [bx + si]}, EA8D
   ret

test_EA8F:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest2 pop word [bx + si], {sub sp, 2}, EA8F
   ret

test_EAC4:
   and bx, 0xFFFE
   and si, 0xFFFE
   push es
   dotest {les ax, [bx + si]}, EAC4
   pop es
   ret

test_EAC5:
   mov bx, mySegmentPtr
   sub bx, 0x100
   mov si, 0x100
   push ds
   dotest {lds ax, [bx + si]}, EAC5
   pop ds
   ret

test_EAFF:
   and bx, 0xFFFE
   and si, 0xFFFE
   dotest2 push word [bx + si], {add sp, 2}, EAFF
   ret

test_EAC42:
   and bx, 0xFFFE
   and si, 0xFFFE
   push ds
   push es
   mov ax, 0xFFFF
   mov ds, ax
   dotest {les ax, [bx + si]}, EAC42
   pop es
   pop ds
   ret

test_EAC52:
   mov bx, 0x0300
   mov si, 0x4760
   push ds
   dotest {lds ax, [bx + si]}, EAC52
   pop ds
   ret


;#################################################################
;############ Group Exceptions
;#################################################################

test_Ex62:
	mov ax, MYSEGMENT
	mov ds, ax
   mov bx, boundData
   mov dx, 1240
   dotest {bound dx, [bx]}, ex62
   ret

test_ExCE:
align 2
repeat_ExCE:
   fill_prefetch
   mov al, 64
   add al, al  ; Set oVerflow
   nop         ; To align return address from exception
   into
   dec cx
   jnz repeat_ExCE
   ret

test_ExD4:
   dotest aam 0, ExD4
   ret

test_EI36:
   mov word [es:workword], 0
align 2
repeat_EI36:
   fill_prefetch
   nop         ; To align return address from exception
   div byte [es:workword]
   dec cx
   jnz repeat_EI36
   ret

test_EI37:
   mov word [es:workword], 0
align 2
repeat_EI37:
   fill_prefetch
   nop         ; To align return address from exception
   idiv byte [es:workword]
   dec cx
   jnz repeat_EI37
   ret

test_EI3E:
   mov word [es:workword], 0
align 2
repeat_EI3E:
   fill_prefetch
   nop         ; To align return address from exception
   div word [es:workword]
   dec cx
   jnz repeat_EI3E
   ret

test_EI3F:
   mov word [es:workword], 0
align 2
repeat_EI3F:
   fill_prefetch
   nop         ; To align return address from exception
   idiv word [es:workword]
   dec cx
   jnz repeat_EI3F
   ret

;#################################################################
;############ Group Repeat
;#################################################################

test_R6C0:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep insb
   dec bx
   jnz .loop
   ret

test_R6C1:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep insb
   dec bx
   jnz .loop
   ret

test_R6C:
   mov di, scratchspace
   rep insb
   ret

test_R6D0:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep insw
   dec bx
   jnz .loop
   ret

test_R6D1:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep insw
   dec bx
   jnz .loop
   ret

test_R6D:
   mov di, scratchspace
   rep insw
   ret

test_R6E0:
   mov dx, 44
   mov si, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep outsb
   dec bx
   jnz .loop
   ret

test_R6E1:
   mov dx, 44
   mov si, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep outsb
   dec bx
   jnz .loop
   ret

test_R6E:
   mov dx, 44
   mov si, scratchspace
   rep outsb
   ret

test_R6F0:
   mov dx, 44
   mov si, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep outsw
   dec bx
   jnz .loop
   ret

test_R6F1:
   mov dx, 44
   mov si, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep outsw
   dec bx
   jnz .loop
   ret

test_R6F:
   mov dx, 44
   mov si, scratchspace
   rep outsw
   ret

test_RA40:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep movsb
   dec bx
   jnz .loop
   ret

test_RA41:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep movsb
   dec bx
   jnz .loop
   ret

test_RA4:
   mov di, scratchspace
   rep movsb
   ret

test_RA50:
   and si, 0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep movsw
   dec bx
   jnz .loop
   ret

test_RA51:
   and si, 0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep movsw
   dec bx
   jnz .loop
   ret

test_RA5:
   and si, 0xFFFE
   mov di, scratchspace
   rep movsw
   ret

test_RA60:
   mov si, 0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   repnz cmpsb
   dec bx
   jnz .loop
   ret

test_RA61:
   and si, 0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   repnz cmpsb
   dec bx
   jnz .loop
   ret

test_RA6:
  	mov si, 0xF700       ; Should be filled with FF
   mov di, scratchspace
   repnz cmpsb
   ret

test_QA60:
   and si, 0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   repz cmpsb
   dec bx
   jnz .loop
   ret

test_QA61:
   and si, 0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   repz cmpsb
   dec bx
   jnz .loop
   ret

test_QA6:
  	mov si, 0
   mov di, scratchspace
   repz cmpsb
   ret

test_RA70:
   and si, 0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   repnz cmpsw
   dec bx
   jnz .loop
   ret

test_RA71:
   and si, 0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   repnz cmpsw
   dec bx
   jnz .loop
   ret

test_RA7:
  	mov si, 0xF700       ; Should be filled with FF
   mov di, scratchspace
   repnz cmpsw
   ret

test_QA70:
   and si,0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   repz cmpsw
   dec bx
   jnz .loop
   ret

test_QA71:
   and si,0xFFFE
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   repz cmpsw
   dec bx
   jnz .loop
   ret

test_QA7:
  	mov si, 0
   and si,0xFFFE
   mov di, scratchspace
   repz cmpsw
   ret

test_RAA0:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep stosb
   dec bx
   jnz .loop
   ret

test_RAA1:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep stosb
   dec bx
   jnz .loop
   ret

test_RAA:
   mov di, scratchspace
   rep stosb
   ret

test_RAB0:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep stosw
   dec bx
   jnz .loop
   ret

test_RAB1:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep stosw
   dec bx
   jnz .loop
   ret

test_RAB:
   mov di, scratchspace
   rep stosw
   ret

test_RAC0:
   mov si, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep lodsb
   dec bx
   jnz .loop
   ret

test_RAC1:
   mov si, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep lodsb
   dec bx
   jnz .loop
   ret

test_RAC:
   mov si, scratchspace
   rep lodsb
   ret

test_RAD0:
   mov si, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   rep lodsw
   dec bx
   jnz .loop
   ret

test_RAD1:
   mov si, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   rep lodsw
   dec bx
   jnz .loop
   ret

test_RAD:
   mov si, scratchspace
   rep lodsw
   ret

test_RAE0:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   repnz scasb
   dec bx
   jnz .loop
   ret

test_RAE1:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   repnz scasb
   dec bx
   jnz .loop
   ret

test_RAE:
   xor al, al
   mov di, scratchspace
   repnz scasb
   ret

test_QAE0:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   repz scasb
   dec bx
   jnz .loop
   ret

test_QAE1:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   repz scasb
   dec bx
   jnz .loop
   ret

test_QAE:
   mov al, 0x12
   mov di, scratchspace
   repz scasb
   ret

test_RAF0:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   repnz scasw
   dec bx
   jnz .loop
   ret

test_RAF1:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   repnz scasw
   dec bx
   jnz .loop
   ret

test_RAF:
   xor al, al
   mov di, scratchspace
   repnz scasw
   ret

test_QAF0:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 0
   repz scasw
   dec bx
   jnz .loop
   ret

test_QAF1:
   mov di, scratchspace
   mov bx, TESTCOUNT
align 2
.loop:
   fill_prefetch
   mov cx, 1
   repz scasw
   dec bx
   jnz .loop
   ret

test_QAF:
   mov ax, 0x1212
   mov di, scratchspace
   repz scasw
   ret

;#################################################################
;############ Group misc, wrong adr mode
;#################################################################

test_Z62:
   dotest {db 0x62, 0xC0}, Z62
   ret

test_Z8C:
   dotest {db 0x8C, 0xE0}, Z8C
   ret

test_Z8D:
   dotest {db 0x8D, 0xC0}, Z8D
   ret

test_Z8E:
   push es
   dotest {db 0x8E, 0xE0}, Z8E
   pop es
   ret

test_ZC4:
   push es
   dotest {db 0xC4, 0xC0}, ZC4
   pop es
   ret

test_ZC5:
   push ds
   dotest {db 0xC5, 0xC0}, ZC5
   pop ds
   ret

