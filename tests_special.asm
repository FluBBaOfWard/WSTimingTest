;
;  tests_special.asm
;  V30MZ cpu timing tester for WonderSwan.
;
;  Created by Robert Peip on 2021.
;  Additions by Fredrik Ahlström on 2022-12-13.
;

test_jumponly:
align 2
repeat_jumponly:
   fill_prefetch
   dec cx
   jnz repeat_jumponly
   ret

;-----------------------------------------------------------------------------

test_jumponlyUnaligned:
align 2
   nop
repeat_jumponlyUnaligned:
   fill_prefetch
   dec cx
   jnz repeat_jumponlyUnaligned
   ret

;-----------------------------------------------------------------------------

test_looponly:
align 2
repeat_looponly:
   fill_prefetch
   loop repeat_looponly
   ret

;-----------------------------------------------------------------------------

test_nop:
   dotest nop
   ret

test_nop2x:
   dotest2 nop, nop
   ret

test_incbl:
   dotest inc bl
   ret

test_incbx:
   dotest inc bx
   ret

test_incbx2x:
   dotest2 inc bx, inc bx
   ret

test_newjump:
   mov cx,TESTCOUNT
align 2
repeat_newjump:
   cbw
   cbw
   cbw
   in al, dx
   dec cx
   jnz repeat_newjump
   ret

test_cli:
   dotest cli
   ret

test_in_al:
   dotest {in al, 0}
   ret

test_in_aldx:
   dotest {in al, dx}
   ret

test_sp_add2:
   mov [es:workword], sp
   dotest {add sp, 2}
   mov sp, [es:workword]
   ret

test_sp_sub2:
   mov [es:workword], sp
   dotest {sub sp, 2}
   mov sp, [es:workword]
   ret

test_push:
   dotest2 push ax, {add sp, 2}
   ret

test_pop:
   push ax
   dotest2 pop ax, {sub sp, 2}
   pop ax
   ret

test_movaxmem:
   dotest {mov ax, [workword]}
   ret

test_movaxmemes:
   dotest {mov ax, [es:workword]}
   ret

test_tripplejump:
   cmp cx,0
align 2
repeat_tripplejump:
   fill_prefetch
   jnz tj2
align 2
tj1:
   jnz tj3
align 2
tj2:
   jnz tj1
align 2
tj3:
   dec cx
   jnz repeat_tripplejump
   ret
