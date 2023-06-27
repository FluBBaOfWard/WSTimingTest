;
;  testcalls.asm
;  V30MZ cpu timing tester for WonderSwan.
;
;  Created by Robert Peip on 2021.
;  Additions by Fredrik Ahlström on 2022-12-13.
;

%macro testgroup 1
   mov al,[es:pageCounter]
   cmp al,%1
   jnz test%1end
%endmacro

testgroup 0
execute  1, 54, teststring1  , test_jumponly
execute  2, 58, teststring2  , test_jumponlyUnaligned
execute  3, 54, teststring3  , test_looponly
;execute  3, 54, teststring3  , test_newjump
execute  4, 58, teststring4  , test_nop
execute  5, 62, teststring5  , test_nop2x
execute  6, 58, teststring6  , test_incbl
execute  7, 58, teststring7  , test_incbx
execute  8, 62, teststring8  , test_incbx2x
execute  9, 70, teststring9  , test_cli
execute 10, 82, teststring10 , test_in_al
execute 11, 74, teststring11 , test_in_aldx
execute 12, 58, teststring12 , test_sp_add2
execute 13, 58, teststring13 , test_sp_sub2
execute 14, 62, teststring14 , test_push
execute 15, 62, teststring15 , test_pop
execute 16, 58, teststring16 , test_movaxmem
execute 17, 58, teststring17 , test_movaxmemes
test0end:

testgroup 1
execute  1, 66, teststringx00, test_op00
execute  2, 66, teststringx01, test_op01
execute  3, 62, teststringx02, test_op02
execute  4, 62, teststringx03, test_op03
execute  5, 58, teststringx04, test_op04
execute  6, 58, teststringx05, test_op05
execute  7, 66, teststringx06, test_op06
execute  8, 70, teststringx07, test_op07
execute  9, 66, teststringx08, test_op08
execute 10, 66, teststringx09, test_op09
execute 11, 62, teststringx0A, test_op0A
execute 12, 62, teststringx0B, test_op0B
execute 13, 58, teststringx0C, test_op0C
execute 14, 58, teststringx0D, test_op0D
execute 15, 66, teststringx0E, test_op0E
execute 16, 58, teststringx0F, test_op0F
test1end:

testgroup 2
execute  1, 66, teststringx10, test_op10
execute  2, 66, teststringx11, test_op11
execute  3, 62, teststringx12, test_op12
execute  4, 62, teststringx13, test_op13
execute  5, 58, teststringx14, test_op14
execute  6, 58, teststringx15, test_op15
execute  7, 66, teststringx16, test_op16
execute  8, 70, teststringx17, test_op17
execute  9, 66, teststringx18, test_op18
execute 10, 66, teststringx19, test_op19
execute 11, 62, teststringx1A, test_op1A
execute 12, 62, teststringx1B, test_op1B
execute 13, 58, teststringx1C, test_op1C
execute 14, 58, teststringx1D, test_op1D
execute 15, 66, teststringx1E, test_op1E
execute 16, 70, teststringx1F, test_op1F
test2end:

testgroup 3
execute  1, 66, teststringx20, test_op20
execute  2, 66, teststringx21, test_op21
execute  3, 62, teststringx22, test_op22
execute  4, 62, teststringx23, test_op23
execute  5, 58, teststringx24, test_op24
execute  6, 58, teststringx25, test_op25
execute  7, 58, teststringx26, test_op26
execute  8, 93, teststringx27, test_op27
execute  9, 66, teststringx28, test_op28
execute 10, 66, teststringx29, test_op29
execute 11, 62, teststringx2A, test_op2A
execute 12, 62, teststringx2B, test_op2B
execute 13, 58, teststringx2C, test_op2C
execute 14, 58, teststringx2D, test_op2D
execute 15, 58, teststringx2E, test_op2E
execute 16, 97, teststringx2F, test_op2F
test3end:

testgroup 4
execute  1, 66, teststringx30, test_op30
execute  2, 66, teststringx31, test_op31
execute  3, 62, teststringx32, test_op32
execute  4, 62, teststringx33, test_op33
execute  5, 58, teststringx34, test_op34
execute  6, 58, teststringx35, test_op35
execute  7, 58, teststringx36, test_op36
execute  8, 90, teststringx37, test_op37
execute  9, 62, teststringx38, test_op38
execute 10, 62, teststringx39, test_op39
execute 11, 62, teststringx3A, test_op3A
execute 12, 62, teststringx3B, test_op3B
execute 13, 58, teststringx3C, test_op3C
execute 14, 58, teststringx3D, test_op3D
execute 15, 58, teststringx3E, test_op3E
execute 16, 90, teststringx3F, test_op3F
test4end:

testgroup 5
execute  1, 58, teststringx40, test_op40
execute  2, 58, teststringx41, test_op41
execute  3, 58, teststringx42, test_op42
execute  4, 58, teststringx43, test_op43
execute  5, 58, teststringx44, test_op44
execute  6, 58, teststringx45, test_op45
execute  7, 58, teststringx46, test_op46
execute  8, 58, teststringx47, test_op47
execute  9, 58, teststringx48, test_op48
execute 10, 58, teststringx49, test_op49
execute 11, 58, teststringx4A, test_op4A
execute 12, 58, teststringx4B, test_op4B
execute 13, 58, teststringx4C, test_op4C
execute 14, 58, teststringx4D, test_op4D
execute 15, 58, teststringx4E, test_op4E
execute 16, 58, teststringx4F, test_op4F
test5end:

testgroup 6
execute  1, 62, teststringx50, test_op50
execute  2, 62, teststringx51, test_op51
execute  3, 62, teststringx52, test_op52
execute  4, 62, teststringx53, test_op53
execute  5, 62, teststringx54, test_op54
execute  6, 62, teststringx55, test_op55
execute  7, 62, teststringx56, test_op56
execute  8, 62, teststringx57, test_op57
execute  9, 62, teststringx58, test_op58
execute 10, 62, teststringx59, test_op59
execute 11, 62, teststringx5A, test_op5A
execute 12, 62, teststringx5B, test_op5B
execute 13, 58, teststringx5C, test_op5C
execute 14, 62, teststringx5D, test_op5D
execute 15, 62, teststringx5E, test_op5E
execute 16, 62, teststringx5F, test_op5F
test6end:

testgroup 7
execute  1, 93, teststringx60, test_op60
execute  2,101, teststringx61, test_op61
execute  3,109, teststringx62, test_op62
execute  4, 58, teststringx63, test_op63
execute  5, 58, teststringx64, test_op64
execute  6, 58, teststringx65, test_op65
execute  7, 58, teststringx66, test_op66
execute  8, 58, teststringx67, test_op67
execute  9, 62, teststringx68, test_op68
execute 10, 66, teststringx69, test_op69
execute 11, 62, teststringx6A, test_op6A
execute 12, 66, teststringx6B, test_op6B
execute 13, 74, teststringx6C, test_op6C
execute 14, 74, teststringx6D, test_op6D
execute 15, 74, teststringx6E, test_op6E
execute 16, 74, teststringx6F, test_op6F
test7end:

testgroup 8
execute  1, 78, teststringx70, test_op70
execute  2, 70, teststringx71, test_op71
execute  3, 86, teststringx72, test_op72
execute  4, 86, teststringx73, test_op73
execute  5, 74, teststringx74, test_op74
execute  6, 70, teststringx75, test_op75
execute  7, 78, teststringx76, test_op76
execute  8, 78, teststringx77, test_op77
execute  9, 78, teststringx78, test_op78
execute 10, 78, teststringx79, test_op79
execute 11, 74, teststringx7A, test_op7A
execute 12, 74, teststringx7B, test_op7B
execute 13, 78, teststringx7C, test_op7C
execute 14, 78, teststringx7D, test_op7D
execute 15, 78, teststringx7E, test_op7E
execute 16, 78, teststringx7F, test_op7F
execute 17,101, teststringx7X, test_tripplejump
test8end:

testgroup 9
execute  1, 66, teststringx80, test_op80
execute  2, 66, teststringx81, test_op81
execute  3, 66, teststringx82, test_op82
execute  4, 66, teststringx83, test_op83
execute  5, 62, teststringx84, test_op84
execute  6, 62, teststringx85, test_op85
execute  7, 74, teststringx86, test_op86
execute  8, 74, teststringx87, test_op87
execute  9, 58, teststringx88, test_op88
execute 10, 58, teststringx89, test_op89
execute 11, 58, teststringx8A, test_op8A
execute 12, 58, teststringx8B, test_op8B
execute 13, 58, teststringx8C, test_op8C
execute 14, 58, teststringx8D, test_op8D
execute 15, 66, teststringx8E, test_op8E
execute 16, 70, teststringx8F, test_op8F
test9end:

testgroup 10
execute  1, 58, teststringx90, test_op90
execute  2, 70, teststringx91, test_op91
execute  3, 66, teststringx92, test_op92
execute  4, 66, teststringx93, test_op93
execute  5, 70, teststringx94, test_op94
execute  6, 70, teststringx95, test_op95
execute  7, 70, teststringx96, test_op96
execute  8, 70, teststringx97, test_op97
execute  9, 58, teststringx98, test_op98
execute 10, 58, teststringx99, test_op99
execute 11,101, teststringx9A, test_op9A
execute 12, 93, teststringx9B, test_op9B
execute 13, 66, teststringx9C, test_op9C
execute 14, 70, teststringx9D, test_op9D
execute 15, 70, teststringx9E, test_op9E
execute 16, 62, teststringx9F, test_op9F
test10end:

testgroup 11
execute  1, 58, teststringxA0, test_opA0
execute  2, 58, teststringxA1, test_opA1
execute  3, 58, teststringxA2, test_opA2
execute  4, 58, teststringxA3, test_opA3
execute  5, 74, teststringxA4, test_opA4
execute  6, 74, teststringxA5, test_opA5
execute  7, 78, teststringxA6, test_opA6
execute  8, 78, teststringxA7, test_opA7
execute  9, 58, teststringxA8, test_opA8
execute 10, 58, teststringxA9, test_opA9
execute 11, 66, teststringxAA, test_opAA
execute 12, 66, teststringxAB, test_opAB
execute 13, 66, teststringxAC, test_opAC
execute 14, 66, teststringxAD, test_opAD
execute 15, 70, teststringxAE, test_opAE
execute 16, 70, teststringxAF, test_opAF
test11end:

testgroup 12
execute  1, 58, teststringxB0, test_opB0
execute  2, 58, teststringxB1, test_opB1
execute  3, 58, teststringxB2, test_opB2
execute  4, 58, teststringxB3, test_opB3
execute  5, 58, teststringxB4, test_opB4
execute  6, 58, teststringxB5, test_opB5
execute  7, 58, teststringxB6, test_opB6
execute  8, 58, teststringxB7, test_opB7
execute  9, 58, teststringxB8, test_opB8
execute 10, 58, teststringxB9, test_opB9
execute 11, 58, teststringxBA, test_opBA
execute 12, 58, teststringxBB, test_opBB
execute 13, 58, teststringxBC, test_opBC
execute 14, 58, teststringxBD, test_opBD
execute 15, 58, teststringxBE, test_opBE
execute 16, 58, teststringxBF, test_opBF
test12end:

testgroup 13
execute  1, 74, teststringxC0, test_opC0
execute  2, 74, teststringxC1, test_opC1
execute  3, 78, teststringxC2, test_opC2
execute  4, 82, teststringxC3, test_opC3
execute  5, 78, teststringxC4, test_opC4
execute  6, 78, teststringxC5, test_opC5
execute  7, 58, teststringxC6, test_opC6
execute  8, 58, teststringxC7, test_opC7
execute  9, 86, teststringxC8, test_opC8
execute 10, 66, teststringxC9, test_opC9
execute 11, 90, teststringxCA, test_opCA
execute 12, 97, teststringxCB, test_opCB
execute 13,254, teststringxCC, test_opCC
execute 14,257, teststringxCD, test_opCD
execute 15, 78, teststringxCE, test_opCE
execute 16,113, teststringxCF, test_opCF
test13end:

testgroup 14
execute  1, 66, teststringxD0, test_opD0
execute  2, 66, teststringxD1, test_opD1
execute  3, 74, teststringxD2, test_opD2
execute  4, 74, teststringxD3, test_opD3
execute  5,117, teststringxD4, test_opD4
execute  6, 78, teststringxD5, test_opD5
execute  7, 86, teststringxD6, test_opD6
execute  8, 74, teststringxD7, test_opD7
execute  9, 58, teststringxD8, test_opD8
execute 10, 58, teststringxD9, test_opD9
execute 11, 58, teststringxDA, test_opDA
execute 12, 58, teststringxDB, test_opDB
execute 13, 58, teststringxDC, test_opDC
execute 14, 58, teststringxDD, test_opDD
execute 15, 58, teststringxDE, test_opDE
execute 16, 58, teststringxDF, test_opDF
test14end:

testgroup 15
execute  1, 82, teststringxE0, test_opE0
execute  2, 86, teststringxE1, test_opE1
execute  3, 78, teststringxE2, test_opE2
execute  4, 70, teststringxE3, test_opE3
execute  5, 82, teststringxE4, test_opE4
execute  6, 82, teststringxE5, test_opE5
execute  7, 82, teststringxE6, test_opE6
execute  8, 82, teststringxE7, test_opE7
execute  9, 78, teststringxE8, test_opE8
execute 10, 70, teststringxE9, test_opE9
execute 11, 82, teststringxEA, test_opEA
execute 12, 70, teststringxEB, test_opEB
execute 13, 74, teststringxEC, test_opEC
execute 14, 74, teststringxED, test_opED
execute 15, 74, teststringxEE, test_opEE
execute 16, 74, teststringxEF, test_opEF
test15end:

testgroup 16
execute  1, 58, teststringxF0, test_opF0
execute  2,  0, teststringxF1, test_opF1
execute  3, 58, teststringxF2, test_opF2
execute  4, 58, teststringxF3, test_opF3
execute  5,101, teststringxF4, test_opF4
execute  6, 70, teststringxF5, test_opF5
execute  7, 70, teststringxF8, test_opF8
execute  8, 70, teststringxF9, test_opF9
execute  9, 70, teststringxFA, test_opFA
execute 10, 70, teststringxFB, test_opFB
execute 11, 70, teststringxFC, test_opFC
execute 12, 70, teststringxFD, test_opFD
test16end:

testgroup 17
execute  1, 62, teststringI30, test_I30
execute  2, 58, teststringI31, test_I31
execute  3, 66, teststringI32, test_I32
execute  4, 66, teststringI33, test_I33
execute  5, 70, teststringI34, test_I34
execute  6, 70, teststringI35, test_I35
execute  7,117, teststringI36, test_I36
execute  8,125, teststringI37, test_I37
execute  9, 62, teststringI38, test_I38
execute 10, 58, teststringI39, test_I39
execute 11, 66, teststringI3A, test_I3A
execute 12, 66, teststringI3B, test_I3B
execute 13, 70, teststringI3C, test_I3C
execute 14, 70, teststringI3D, test_I3D
execute 15,148, teststringI3E, test_I3E
execute 16,152, teststringI3F, test_I3F
test17end:

testgroup 18
execute  1, 66, teststringI40, test_I40
execute  2, 66, teststringI41, test_I41
execute  3, 66, teststringI48, test_I48
execute  4, 66, teststringI49, test_I49
execute  5, 82, teststringI4A, test_I4A
execute  6,117, teststringI4B, test_I4B
execute  7, 78, teststringI4C, test_I4C
execute  8, 93, teststringI4D, test_I4D
execute  9, 66, teststringI4E, test_I4E
execute 10, 58, teststringI4F, test_I4F
test18end:

testgroup 19
execute  1, 66, teststringA00, test_A00
execute  2, 66, teststringA01, test_A01
execute  3, 66, teststringA02, test_A02
execute  4, 66, teststringA03, test_A03
execute  5, 58, teststringA04, test_A04
execute  6, 58, teststringA05, test_A05
execute  7, 58, teststringA06, test_A06
execute  8, 58, teststringA07, test_A07
execute  9, 66, teststringA40, test_A40
execute 10, 66, teststringA41, test_A41
execute 11, 66, teststringA42, test_A42
execute 12, 66, teststringA43, test_A43
execute 13, 58, teststringA44, test_A44
execute 14, 58, teststringA45, test_A45
execute 15, 58, teststringA46, test_A46
execute 16, 58, teststringA47, test_A47
test19end:

testgroup 20
execute  1, 66, teststringA80, test_A80
execute  2, 66, teststringA81, test_A81
execute  3, 66, teststringA82, test_A82
execute  4, 66, teststringA83, test_A83
execute  5, 58, teststringA84, test_A84
execute  6, 58, teststringA85, test_A85
execute  7, 58, teststringA86, test_A86
execute  8, 58, teststringA87, test_A87
test20end:

testgroup 21
execute  1, 74, teststringEA11, test_EA11
execute  2, 78, teststringEA69, test_EA69
execute  3, 66, teststringEA89, test_EA89
execute  4, 62, teststringEA8D, test_EA8D
execute  5, 66, teststringEA8D, test_EA8DX
execute  6, 62, teststringEA8D, test_EA8DY
execute  7, 74, teststringEA8F, test_EA8F
execute  8, 82, teststringEAC4, test_EAC4
execute  9, 82, teststringEAC4, test_EAC42
execute 10, 82, teststringEAC5, test_EAC5
execute 11, 86, teststringEAC5, test_EAC52
execute 12, 74, teststringEAFF, test_EAFF
execute 13, 70, teststringA00, test_A00X
execute 14, 66, teststringA04, test_A04X
test21end:

testgroup 22
execute  1,300, teststringEx62,test_Ex62
execute  2,281, teststringExCE,test_ExCE
execute  3,281, teststringExD4,test_ExD4
execute  4,289, teststringEI36,test_EI36
execute  5,300, teststringEI37,test_EI37
execute  6,289, teststringEI3E,test_EI3E
execute  7,300, teststringEI3F,test_EI3F
execute  8,293, teststringExIrq,test_ExIrq
test22end:

testgroup 23
execute  1, 78, teststringR6C0,test_R6C0
execute  2,101, teststringR6C1,test_R6C1
execute  3, 23, teststringR6C, test_R6C
execute  4, 78, teststringR6D0,test_R6D0
execute  5,101, teststringR6D1,test_R6D1
execute  6, 23, teststringR6D, test_R6D
execute  7, 78, teststringR6E0,test_R6E0
execute  8,101, teststringR6E1,test_R6E1
execute  9, 23, teststringR6E, test_R6E
execute 10, 78, teststringR6F0,test_R6F0
execute 11,101, teststringR6F1,test_R6F1
execute 12, 23, teststringR6F, test_R6F
test23end:

testgroup 24
execute  1, 78, teststringRA40,test_RA40
execute  2,105, teststringRA41,test_RA41
execute  3, 27, teststringRA4, test_RA4
execute  4, 78, teststringRA50,test_RA50
execute  5,105, teststringRA51,test_RA51
execute  6, 27, teststringRA5, test_RA5
test24end:

testgroup 25
  	mov si, 0
  	mov di, scratchspace
   mov cx, TESTCOUNT
   rep movsw            ; Copy data from rom
execute  1, 78, teststringRA60,test_RA60
execute  2,117, teststringRA61,test_RA61
execute  3, 39, teststringRA6, test_RA6
execute  4, 78, teststringQA60,test_QA60
execute  5,117, teststringQA61,test_QA61
execute  6, 39, teststringQA6, test_QA6
execute  7, 78, teststringRA70,test_RA70
execute  8,117, teststringRA71,test_RA71
execute  9, 39, teststringRA7, test_RA7
execute 10, 78, teststringQA70,test_QA70
execute 11,117, teststringQA71,test_QA71
execute 12, 39, teststringQA7, test_QA7
test25end:

testgroup 26
execute  1, 78, teststringRAA0,test_RAA0
execute  2,101, teststringRAA1,test_RAA1
execute  3, 23, teststringRAA, test_RAA
execute  4, 78, teststringRAB0,test_RAB0
execute  5,101, teststringRAB1,test_RAB1
execute  6, 23, teststringRAB, test_RAB
execute  7, 78, teststringRAC0,test_RAC0
execute  8,101, teststringRAC1,test_RAC1
execute  9, 23, teststringRAC, test_RAC
execute 10, 78, teststringRAD0,test_RAD0
execute 11,101, teststringRAD1,test_RAD1
execute 12, 23, teststringRAD, test_RAD
test26end:

testgroup 27
   mov ax, 0x1212
  	mov di, scratchspace
   mov cx, TESTCOUNT
   rep stosw            ; Set all words to 0x1212
execute  1, 78, teststringRAE0,test_RAE0
execute  2,113, teststringRAE1,test_RAE1
execute  3, 35, teststringRAE, test_RAE
execute  4, 78, teststringQAE0,test_QAE0
execute  5,113, teststringQAE1,test_QAE1
execute  6, 35, teststringQAE, test_QAE
execute  7, 78, teststringRAF0,test_RAF0
execute  8,113, teststringRAF1,test_RAF1
execute  9, 35, teststringRAF, test_RAF
execute 10, 78, teststringQAF0,test_QAF0
execute 11,113, teststringQAF1,test_QAF1
execute 12, 35, teststringQAF, test_QAF
test27end:

testgroup 28
execute  1,109, teststringZ62, test_Z62
execute  2, 58, teststringZ8C, test_Z8C
execute  3, 58, teststringZ8D, test_Z8D
execute  4, 62, teststringZ8E, test_Z8E
execute  5, 62, teststringZ8F, test_Z8F
execute  6, 86, teststringZC4, test_ZC4
execute  7, 86, teststringZC5, test_ZC5
execute  8,109, teststringLL0, test_longloop
execute  9, 31, teststringSL0, test_shortloop
execute 10, 19, teststringSL1, test_shortestloop
test28end:
