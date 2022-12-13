;
;  texts.asm
;  V30MZ cpu timing tester for WonderSwan.
;
;  Created by Robert Peip on 2021.
;  Additions by Fredrik Ahlström on 2022-12-13.
;

titleinfo     : db "Test     Correct Actual Pass:", 0
teststring1   : db "Base loop:", 0
teststring2   : db "Unaligned:", 0
teststring3   : db "NOP      :", 0
teststring4   : db "NOP 2X   :", 0
teststring5   : db "INC BL   :", 0
teststring6   : db "INC BX   :", 0
teststring7   : db "INC BX 2X:", 0
teststring8   : db "CLI      :", 0
teststring9   : db "IN AL    :", 0
teststring10  : db "IN AL, DX:", 0
teststring11  : db "ADD SP,2 :", 0
teststring12  : db "SUB SP,2 :", 0
teststring13  : db "Push SP+2:", 0
teststring14  : db "POP  SP-2:", 0
teststring15  : db "AX<-MEM  :", 0
teststring16  : db "AX<MEM ES:", 0
teststring17  : db "TRIPLE_JP:", 0

teststringx00 : db "00 ADD   :", 0
teststringx01 : db "01 ADD   :", 0
teststringx02 : db "02 ADD   :", 0
teststringx03 : db "03 ADD   :", 0
teststringx04 : db "04 ADD   :", 0
teststringx05 : db "05 ADD   :", 0
teststringx06 : db "06 PUSHES:", 0
teststringx07 : db "07 POP ES:", 0
teststringx08 : db "08 ADD   :", 0
teststringx09 : db "09 ADD   :", 0
teststringx0A : db "0A ADD   :", 0
teststringx0B : db "0B ADD   :", 0
teststringx0C : db "0C ADD   :", 0
teststringx0D : db "0D ADD   :", 0
teststringx0E : db "0E PUSHCS:", 0
teststringx0F : db "0F NONE  :", 0

teststringx10 : db "10 ADC   :", 0
teststringx11 : db "11 ADC   :", 0
teststringx12 : db "12 ADC   :", 0
teststringx13 : db "13 ADC   :", 0
teststringx14 : db "14 ADC   :", 0
teststringx15 : db "15 ADC   :", 0
teststringx16 : db "16 PUSHSS:", 0
teststringx17 : db "17 POP SS:", 0
teststringx18 : db "18 SBB   :", 0
teststringx19 : db "19 SBB   :", 0
teststringx1A : db "1A SBB   :", 0
teststringx1B : db "1B SBB   :", 0
teststringx1C : db "1C SBB   :", 0
teststringx1D : db "1D SBB   :", 0
teststringx1E : db "1E PUSHDS:", 0
teststringx1F : db "1F POP DS:", 0

teststringx20 : db "20 AND   :", 0
teststringx21 : db "21 AND   :", 0
teststringx22 : db "22 AND   :", 0
teststringx23 : db "23 AND   :", 0
teststringx24 : db "24 AND   :", 0
teststringx25 : db "25 AND   :", 0
teststringx26 : db "26 PRE ES:", 0
teststringx27 : db "27 DAA   :", 0
teststringx28 : db "28 SUB   :", 0
teststringx29 : db "29 SUB   :", 0
teststringx2A : db "2A SUB   :", 0
teststringx2B : db "2B SUB   :", 0
teststringx2C : db "2C SUB   :", 0
teststringx2D : db "2D SUB   :", 0
teststringx2E : db "2E PRE CS:", 0
teststringx2F : db "2F DAS   :", 0

teststringx30 : db "30 XOR   :", 0
teststringx31 : db "31 XOR   :", 0
teststringx32 : db "32 XOR   :", 0
teststringx33 : db "33 XOR   :", 0
teststringx34 : db "34 XOR   :", 0
teststringx35 : db "35 XOR   :", 0
teststringx36 : db "36 PRE SS:", 0
teststringx37 : db "37 AAA   :", 0
teststringx38 : db "38 CMP   :", 0
teststringx39 : db "39 CMP   :", 0
teststringx3A : db "3A CMP   :", 0
teststringx3B : db "3B CMP   :", 0
teststringx3C : db "3C CMP   :", 0
teststringx3D : db "3D CMP   :", 0
teststringx3E : db "3E PRE DS:", 0
teststringx3F : db "3F AAS   :", 0

teststringx40 : db "40 INC ax:", 0
teststringx41 : db "41 NONE  :", 0
teststringx42 : db "42 INC dx:", 0
teststringx43 : db "43 INC bx:", 0
teststringx44 : db "44 NONE  :", 0
teststringx45 : db "45 INC bp:", 0
teststringx46 : db "46 INC si:", 0
teststringx47 : db "47 INC di:", 0
teststringx48 : db "48 DEC ax:", 0
teststringx49 : db "49 NONE  :", 0
teststringx4A : db "4A DEC dx:", 0
teststringx4B : db "4B DEC bx:", 0
teststringx4C : db "4C NONE  :", 0
teststringx4D : db "4D DEC bp:", 0
teststringx4E : db "4E DEC si:", 0
teststringx4F : db "4F DEC di:", 0

teststringx50 : db "50 PUSHax:", 0
teststringx51 : db "51 PUSHcx:", 0
teststringx52 : db "52 PUSHdx:", 0
teststringx53 : db "53 PUSHbx:", 0
teststringx54 : db "54 PUSHsp:", 0
teststringx55 : db "55 PUSHbp:", 0
teststringx56 : db "56 PUSHsi:", 0
teststringx57 : db "57 PUSHdi:", 0
teststringx58 : db "58 POP ax:", 0
teststringx59 : db "59 NONE  :", 0
teststringx5A : db "5A POP dx:", 0
teststringx5B : db "5B POP bx:", 0
teststringx5C : db "5C NONE  :", 0
teststringx5D : db "5D POP bp:", 0
teststringx5E : db "5E POP si:", 0
teststringx5F : db "5F POP di:", 0

teststringx60 : db "60 PUSHAL:", 0
teststringx61 : db "61 POPALL:", 0
teststringx63 : db "63 UNDEF :", 0
teststringx64 : db "64 UNDEF :", 0
teststringx65 : db "65 UNDEF :", 0
teststringx66 : db "66 UNDEF :", 0
teststringx67 : db "67 UNDEF :", 0
teststringx68 : db "68 PUSH W:", 0, 0
teststringx69 : db "69 MUL  W:", 0
teststringx6A : db "6A PUSH B:", 0
teststringx6B : db "6B MUL  B:", 0

teststringx70 : db "70 JO    :", 0
teststringx71 : db "71 JNO   :", 0
teststringx72 : db "72 JB    :", 0
teststringx73 : db "73 JNB   :", 0
teststringx74 : db "74 JZ    :", 0
teststringx75 : db "75 JNZ   :", 0
teststringx76 : db "76 JBE   :", 0
teststringx77 : db "77 JNBE  :", 0
teststringx78 : db "78 JS    :", 0
teststringx79 : db "79 JNS   :", 0
teststringx7A : db "7A JP    :", 0
teststringx7B : db "7B JNP   :", 0
teststringx7C : db "7C JL    :", 0
teststringx7D : db "7D JNL   :", 0
teststringx7E : db "7E JLE   :", 0
teststringx7F : db "7F JNLE  :", 0

teststringx80 : db "80 MEMIM1:", 0
teststringx81 : db "81 MEMIM1:", 0
teststringx82 : db "82 MEMIM1:", 0
teststringx83 : db "83 MEMIM1:", 0
teststringx84 : db "84 TEST  :", 0
teststringx85 : db "85 TEST  :", 0
teststringx86 : db "86 XCHGMR:", 0
teststringx87 : db "87 XCHGMR:", 0
teststringx88 : db "88 MOVMR :", 0
teststringx89 : db "89 MOVMR :", 0
teststringx8A : db "8A MOVRM :", 0
teststringx8B : db "8B MOVRM :", 0
teststringx8C : db "8C MOVSEG:", 0
teststringx8D : db "8D LEA   :", 0
teststringx8E : db "8E MOVSEG:", 0
teststringx8F : db "8F POPMEM:", 0

teststringx90 : db "90 NOP   :", 0
teststringx91 : db "91 XCHG M:", 0
teststringx92 : db "92 XCHG  :", 0
teststringx93 : db "93 XCHG  :", 0
teststringx94 : db "94 XCHG M:", 0
teststringx95 : db "95 XCHG M:", 0
teststringx96 : db "96 XCHG M:", 0
teststringx97 : db "97 XCHG M:", 0
teststringx98 : db "98 SXT   :", 0
teststringx99 : db "99 SXT   :", 0
teststringx9B : db "9B POLL  :", 0
teststringx9C : db "9C PUSH F:", 0
teststringx9D : db "9D POP  F:", 0
teststringx9E : db "9E ACC2F :", 0
teststringx9F : db "9F F2ACC :", 0

teststringxA0 : db "A0 MOV AM:", 0
teststringxA1 : db "A1 MOV AM:", 0
teststringxA2 : db "A2 MOV MA:", 0
teststringxA3 : db "A3 MOV MA:", 0, 0
teststringxA4 : db "A4 MOV  S:", 0
teststringxA5 : db "A5 MOV  S:", 0
teststringxA6 : db "A6 CMP  S:", 0
teststringxA7 : db "A7 CMP  S:", 0
teststringxA8 : db "A8 TEST A:", 0
teststringxA9 : db "A9 TEST A:", 0
teststringxAA : db "AA STOR S:", 0
teststringxAB : db "AB STOR S:", 0
teststringxAC : db "AC LOAD S:", 0
teststringxAD : db "AD LOAD S:", 0
teststringxAE : db "AE SCAN S:", 0
teststringxAF : db "AF SCAN S:", 0

teststringxB0 : db "B0 MI  al:", 0
teststringxB1 : db "B1 NONE  :", 0
teststringxB2 : db "B2 MI  dl:", 0
teststringxB3 : db "B3 MI  bl:", 0
teststringxB4 : db "B4 MI  ah:", 0
teststringxB5 : db "B5 NONE  :", 0
teststringxB6 : db "B6 MI  dh:", 0
teststringxB7 : db "B7 MI  bh:", 0
teststringxB8 : db "B8 MI  ax:", 0
teststringxB9 : db "B9 NONE  :", 0
teststringxBA : db "BA MI  dx:", 0
teststringxBB : db "BB MI  bx:", 0
teststringxBC : db "BC MI  sp:", 0
teststringxBD : db "BD MI  bp:", 0
teststringxBE : db "BE MI  si:", 0
teststringxBF : db "BF MI  di:", 0

teststringxC0 : db "C0 MEMIM2:", 0
teststringxC1 : db "C1 MEMIM2:", 0
teststringxC4 : db "C4 LD S M:", 0
teststringxC5 : db "C5 LD S M:", 0
teststringxC6 : db "C6 MOV MI:", 0
teststringxC7 : db "C7 MOV MI:", 0

teststringxD0 : db "D0 MEMIM2:", 0
teststringxD1 : db "D1 MEMIM2:", 0
teststringxD2 : db "D2 MEMIM2:", 0
teststringxD3 : db "D3 MEMIM2:", 0
teststringxD4 : db "D4 AAMUL :", 0
teststringxD5 : db "D5 AADIV :", 0
teststringxD6 : db "D6 SALC  :", 0
teststringxD7 : db "D7 TRANSL:", 0
teststringxD8 : db "D8 UNDEF :", 0
teststringxD9 : db "D9 UNDEF :", 0
teststringxDA : db "DA UNDEF :", 0
teststringxDB : db "DB UNDEF :", 0
teststringxDC : db "DC UNDEF :", 0
teststringxDD : db "DD UNDEF :", 0
teststringxDE : db "DE UNDEF :", 0
teststringxDF : db "DF UNDEF :", 0

teststringxE4 : db "E4 OPIN B:", 0
teststringxE5 : db "E5 OPIN W:", 0
teststringxE6 : db "E6 OPOU B:", 0
teststringxE7 : db "E7 OPOU W:", 0
teststringxE9 : db "E9 JMP 16:", 0
teststringxEA : db "EA JMP FA:", 0
teststringxEB : db "EB JMP R8:", 0
teststringxEC : db "EC OPIN B:", 0
teststringxED : db "ED OPIN W:", 0
teststringxEE : db "EE OPOU B:", 0
teststringxEF : db "EF OPOU W:", 0

teststringxF3 : db "F3 R NOP:", 0
teststringxF8 : db "F8 F C 0:", 0
teststringxF9 : db "F9 F C 1:", 0
teststringxFA : db "FA F I 0:", 0
teststringxFB : db "FB NONE :", 0
teststringxFC : db "FC F D 0:", 0
teststringxFD : db "FD NONE :", 0

teststringI30 : db "F6 0 TST:", 0
teststringI31 : db "F6 1 UND:", 0
teststringI32 : db "F6 2 NOT:", 0
teststringI33 : db "F6 3 NEG:", 0
teststringI34 : db "F6 4 MUL:", 0
teststringI35 : db "F6 5 MUL:", 0
teststringI36 : db "F6 6 DIV:", 0
teststringI37 : db "F6 7 DIV:", 0
teststringI38 : db "F7 0 TST:", 0
teststringI39 : db "F7 1 UND:", 0
teststringI3A : db "F7 2 NOT:", 0
teststringI3B : db "F7 3 NEG:", 0
teststringI3C : db "F7 4 MUL:", 0
teststringI3D : db "F7 5 MUL:", 0
teststringI3E : db "F7 6 DIV:", 0
teststringI3F : db "F7 7 DIV:", 0

teststringI40 : db "FE 0 I M:", 0
teststringI41 : db "FE 1 D M:", 0
teststringI48 : db "FF 0 I M:", 0
teststringI49 : db "FF 1 D M:", 0
teststringI4E : db "FF 6 P M:", 0

