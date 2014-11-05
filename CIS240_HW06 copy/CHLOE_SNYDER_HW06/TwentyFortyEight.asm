;;;;;;;;;;;;;;;;;;;;;;;;;;;;printnum;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
printnum
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-13	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRnp L2_TwentyFortyEight
	LEA R7, L4_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L1_TwentyFortyEight
L2_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRzp L6_TwentyFortyEight
	LDR R7, R5, #3
	NOT R7,R7
	ADD R7,R7,#1
	STR R7, R5, #-13
	JMP L7_TwentyFortyEight
L6_TwentyFortyEight
	LDR R7, R5, #3
	STR R7, R5, #-13
L7_TwentyFortyEight
	LDR R7, R5, #-13
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRzp L8_TwentyFortyEight
	LEA R7, L10_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L1_TwentyFortyEight
L8_TwentyFortyEight
	ADD R7, R5, #-12
	ADD R7, R7, #10
	STR R7, R5, #-2
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	CONST R3, #0
	STR R3, R7, #0
	JMP L12_TwentyFortyEight
L11_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	LDR R3, R5, #-1
	CONST R2, #10
	MOD R3, R3, R2
	CONST R2, #48
	ADD R3, R3, R2
	STR R3, R7, #0
	LDR R7, R5, #-1
	CONST R3, #10
	DIV R7, R7, R3
	STR R7, R5, #-1
L12_TwentyFortyEight
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRnp L11_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRzp L14_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	CONST R3, #45
	STR R3, R7, #0
L14_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L1_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;endl;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
endl
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, L17_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L16_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;rand16;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
rand16
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	AND R7, R7, #15
L18_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;log;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
log
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
	JMP L21_TwentyFortyEight
L20_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #2
	DIV R7, R7, R3
	STR R7, R5, #3
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L21_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #2
	DIV R7, R7, R3
	CONST R3, #0
	CMP R7, R3
	BRnp L20_TwentyFortyEight
	LDR R7, R5, #-1
L19_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
L24_TwentyFortyEight 		.FILL #31
		.FILL #992
		.FILL #1023
		.FILL #32736
		.FILL #15391
		.FILL #31760
		.FILL #16415
		.FILL #32287
		.FILL #16415
		.FILL #32256
		.FILL #31744
		.DATA
L25_TwentyFortyEight 		.FILL #93
		.BLKW 3
		.FILL #46
		.BLKW 3
		.FILL #127
		.BLKW 3
		.FILL #36
		.FILL #123
		.BLKW 2
		.FILL #109
		.FILL #93
		.BLKW 2
		.FILL #123
		.FILL #46
		.BLKW 2
		.FILL #36
		.FILL #93
		.FILL #127
		.BLKW 1
		.FILL #93
		.FILL #107
		.FILL #123
		.BLKW 1
		.FILL #107
		.FILL #36
		.FILL #93
		.BLKW 1
		.FILL #36
		.FILL #119
		.FILL #93
		.FILL #46
		.FILL #93
		.FILL #119
		.FILL #46
		.FILL #127
		.DATA
L26_TwentyFortyEight 		.FILL #12
		.BLKW 3
		.FILL #9
		.FILL #16
		.BLKW 2
		.FILL #6
		.FILL #13
		.FILL #19
		.BLKW 1
		.FILL #3
		.FILL #10
		.FILL #16
		.FILL #22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;drawTiles;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
drawTiles
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	CONST R7, #78
	SUB R6, R6, R7	;; allocate stack space for local variables
	;; function body
	ADD R1, R5, #-16
	ADD R1, R1, #-16
	ADD R1, R1, #-16
	ADD R1, R1, #-16
	ADD R1, R1, #-10
	LEA R0, L24_TwentyFortyEight
;ASGNB
	ADD R6, R6, #-1
	STR R2, R6, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
;blkloop!!!!
	AND R3, R3, #0
	ADD R3, R3, #11
L41
	LDR R2, R0, #0
	STR R2, R1, #0
	ADD R0, R0, #1
	ADD R1, R1, #1
	ADD R3, R3, #-1
BRnp L41
	LDR R3, R6, #0
	ADD R6, R6, #1
	LDR R2, R6, #0
	ADD R6, R6, #1
	ADD R1, R5, #-16
	ADD R1, R1, #-16
	ADD R1, R1, #-13
	LEA R0, L25_TwentyFortyEight
;ASGNB
	ADD R6, R6, #-1
	STR R2, R6, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
;blkloop!!!!
	AND R3, R3, #0
	ADD R3, R3, #15
	ADD R3, R3, #15
	ADD R3, R3, #14
L42
	LDR R2, R0, #0
	STR R2, R1, #0
	ADD R0, R0, #1
	ADD R1, R1, #1
	ADD R3, R3, #-1
BRnp L42
	LDR R3, R6, #0
	ADD R6, R6, #1
	LDR R2, R6, #0
	ADD R6, R6, #1
	ADD R1, R5, #-16
	ADD R1, R1, #-16
	ADD R1, R1, #-16
	ADD R1, R1, #-13
	LEA R0, L26_TwentyFortyEight
;ASGNB
	ADD R6, R6, #-1
	STR R2, R6, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
;blkloop!!!!
	AND R3, R3, #0
	ADD R3, R3, #15
	ADD R3, R3, #1
L43
	LDR R2, R0, #0
	STR R2, R1, #0
	ADD R0, R0, #1
	ADD R1, R1, #1
	ADD R3, R3, #-1
BRnp L43
	LDR R3, R6, #0
	ADD R6, R6, #1
	LDR R2, R6, #0
	ADD R6, R6, #1
	CONST R7, #0
;spilling -63
	STR R4, R6, #-1
	ADD R4, R5, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	STR R7, R4, #-15
	LDR R4, R6, #-1
L27_TwentyFortyEight
	CONST R7, #0
;spilling -62
	STR R4, R6, #-1
	ADD R4, R5, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	STR R7, R4, #-14
	LDR R4, R6, #-1
L31_TwentyFortyEight
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-14
	LDR R7, R7, #0
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-15
	LDR R3, R3, #0
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L35_TwentyFortyEight
	JMP L36_TwentyFortyEight
L35_TwentyFortyEight
	CONST R7, #31
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-14
	LDR R3, R3, #0
	MUL R7, R7, R3
;spilling -76
	STR R4, R6, #-1
	ADD R4, R5, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	STR R7, R4, #-12
	LDR R4, R6, #-1
	CONST R7, #31
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-15
	LDR R3, R3, #0
	MUL R7, R7, R3
;spilling -78
	STR R4, R6, #-1
	ADD R4, R5, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	STR R7, R4, #-14
	LDR R4, R6, #-1
	CONST R7, #31
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-15
	LDR R3, R3, #0
	MUL R7, R7, R3
	ADD R7, R7, #10
;spilling -77
	STR R4, R6, #-1
	ADD R4, R5, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	STR R7, R4, #-13
	LDR R4, R6, #-1
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-14
	LDR R7, R7, #0
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-15
	LDR R3, R3, #0
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR log
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	ADD R7, R7, #-1
;spilling -75
	STR R4, R6, #-1
	ADD R4, R5, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	STR R7, R4, #-11
	LDR R4, R6, #-1
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-11
	LDR R7, R7, #0
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-10
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-14
	LDR R7, R7, #0
	ADD R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-12
	LDR R7, R7, #0
	ADD R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	STR R7, R5, #-1
	JMP L40_TwentyFortyEight
L37_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-11
	LDR R3, R3, #0
	SLL R2, R3, #2
	ADD R1, R5, #-16
	ADD R1, R1, #-16
	ADD R1, R1, #-13
	ADD R2, R2, R1
	ADD R2, R7, R2
	LDR R2, R2, #0
	ADD R6, R6, #-1
	STR R2, R6, #0
	CONST R2, #255
	HICONST R2, #255
	ADD R6, R6, #-1
	STR R2, R6, #0
	ADD R2, R5, #-16
	ADD R2, R2, #-16
	ADD R2, R2, #-16
	ADD R2, R2, #-16
	ADD R2, R2, #-13
	LDR R2, R2, #0
	ADD R6, R6, #-1
	STR R2, R6, #0
	CONST R2, #3
	DIV R3, R3, R2
	SLL R3, R3, #2
	ADD R2, R5, #-16
	ADD R2, R2, #-16
	ADD R2, R2, #-16
	ADD R2, R2, #-13
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-12
	LDR R3, R3, #0
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
L38_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L40_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-11
	LDR R3, R3, #0
	CONST R2, #3
	DIV R3, R3, R2
	CMP R7, R3
	BRnz L37_TwentyFortyEight
L36_TwentyFortyEight
L32_TwentyFortyEight
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-14
	LDR R7, R7, #0
	ADD R7, R7, #1
;spilling -62
	STR R4, R6, #-1
	ADD R4, R5, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	STR R7, R4, #-14
	LDR R4, R6, #-1
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-14
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRn L31_TwentyFortyEight
L28_TwentyFortyEight
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-15
	LDR R7, R7, #0
	ADD R7, R7, #1
;spilling -63
	STR R4, R6, #-1
	ADD R4, R5, #-16
	ADD R4, R4, #-16
	ADD R4, R4, #-16
	STR R7, R4, #-15
	LDR R4, R6, #-1
	ADD R7, R5, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-16
	ADD R7, R7, #-15
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRn L27_TwentyFortyEight
L23_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;redraw;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
redraw
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	JSR lc4_reset_vmem
	ADD R6, R6, #0	;; free space for arguments
	JSR drawTiles
	ADD R6, R6, #0	;; free space for arguments
	JSR lc4_blt_vmem
	ADD R6, R6, #0	;; free space for arguments
L44_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;reset_game_state;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
reset_game_state
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-12	;; allocate stack space for local variables
	;; function body
	CONST R7, #2
	STR R7, R5, #-9
	CONST R7, #2
	STR R7, R5, #-10
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-3
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-4
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-5
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-6
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-7
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-8
	LEA R7, score
	CONST R3, #0
	STR R3, R7, #0
	JMP L47_TwentyFortyEight
L46_TwentyFortyEight
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-3
L47_TwentyFortyEight
	LDR R7, R5, #-3
	LDR R3, R5, #-5
	CMP R7, R3
	BRz L46_TwentyFortyEight
	JMP L50_TwentyFortyEight
L49_TwentyFortyEight
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-4
L50_TwentyFortyEight
	LDR R7, R5, #-4
	LDR R3, R5, #-6
	CMP R7, R3
	BRz L49_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-2
L52_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L56_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
L57_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L56_TwentyFortyEight
L53_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L52_TwentyFortyEight
	LDR R7, R5, #-7
	STR R7, R5, #-11
	CONST R3, #4
	CMP R7, R3
	BRz L62_TwentyFortyEight
	CONST R7, #9
	LDR R3, R5, #-11
	CMP R3, R7
	BRnp L60_TwentyFortyEight
L62_TwentyFortyEight
	CONST R7, #4
	STR R7, R5, #-9
L60_TwentyFortyEight
	LDR R7, R5, #-8
	STR R7, R5, #-12
	CONST R3, #7
	CMP R7, R3
	BRz L65_TwentyFortyEight
	CONST R7, #12
	LDR R3, R5, #-12
	CMP R3, R7
	BRnp L63_TwentyFortyEight
L65_TwentyFortyEight
	CONST R7, #4
	STR R7, R5, #-10
L63_TwentyFortyEight
	LDR R7, R5, #-4
	LDR R3, R5, #-3
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R3, R5, #-9
	STR R3, R7, #0
	LDR R7, R5, #-6
	LDR R3, R5, #-5
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R3, R5, #-10
	STR R3, R7, #0
	JSR drawTiles
	ADD R6, R6, #0	;; free space for arguments
L45_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;swap;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
swap
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-3	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
L67_TwentyFortyEight
	LDR R7, R5, #-1
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	LDR R3, R7, #0
	STR R3, R5, #-2
	LDR R3, R7, #3
	STR R3, R7, #0
	LDR R7, R5, #-1
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	LDR R3, R5, #-2
	STR R3, R7, #3
	LDR R7, R5, #-1
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	ADD R3, R7, #1
	LDR R2, R3, #0
	STR R2, R5, #-3
	LDR R7, R7, #2
	STR R7, R3, #0
	LDR R7, R5, #-1
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	LDR R3, R5, #-3
	STR R3, R7, #2
L68_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L67_TwentyFortyEight
L66_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;mergeTiles;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
mergeTiles
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-6	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-6
	STR R7, R5, #-1
L72_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R7, R3
	LDR R2, R5, #3
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
L73_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L72_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L76_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L80_TwentyFortyEight
	LDR R7, R5, #-1
	CONST R3, #3
	CMP R7, R3
	BRzp L82_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #1
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R2, R5, #-5
	ADD R7, R7, R2
	LDR R7, R7, #0
	CMP R3, R7
	BRnp L84_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R7, R7, R3
	LDR R3, R7, #0
	SLL R3, R3, #1
	STR R3, R7, #0
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #1
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	JMP L85_TwentyFortyEight
L84_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #1
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L86_TwentyFortyEight
	LDR R7, R5, #-1
	CONST R3, #2
	CMP R7, R3
	BRzp L88_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #2
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R2, R5, #-5
	ADD R7, R7, R2
	LDR R7, R7, #0
	CMP R3, R7
	BRnp L90_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R7, R7, R3
	LDR R3, R7, #0
	SLL R3, R3, #1
	STR R3, R7, #0
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #2
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	JMP L91_TwentyFortyEight
L90_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L92_TwentyFortyEight
	LDR R7, R5, #-1
	CONST R3, #1
	CMP R7, R3
	BRzp L94_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #3
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R2, R5, #-5
	ADD R7, R7, R2
	LDR R7, R7, #0
	CMP R3, R7
	BRnp L96_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R7, R7, R3
	LDR R3, R7, #0
	SLL R3, R3, #1
	STR R3, R7, #0
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #3
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
L96_TwentyFortyEight
L94_TwentyFortyEight
L92_TwentyFortyEight
L91_TwentyFortyEight
L88_TwentyFortyEight
L86_TwentyFortyEight
L85_TwentyFortyEight
L82_TwentyFortyEight
L80_TwentyFortyEight
L77_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L76_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L98_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L102_TwentyFortyEight
	LDR R7, R5, #-1
	CONST R3, #3
	CMP R7, R3
	BRzp L104_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #1
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L106_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R7, R3
	ADD R2, R5, #-5
	ADD R2, R2, #1
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #1
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	JMP L107_TwentyFortyEight
L106_TwentyFortyEight
	LDR R7, R5, #-1
	CONST R3, #2
	CMP R7, R3
	BRzp L108_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L110_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R7, R3
	ADD R2, R5, #-5
	ADD R2, R2, #2
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #2
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	JMP L111_TwentyFortyEight
L110_TwentyFortyEight
	LDR R7, R5, #-1
	CONST R3, #1
	CMP R7, R3
	BRzp L112_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R7, R3
	ADD R2, R5, #-5
	ADD R2, R2, #3
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
	LDR R7, R5, #-1
	ADD R3, R5, #-5
	ADD R3, R3, #3
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
L112_TwentyFortyEight
L111_TwentyFortyEight
L108_TwentyFortyEight
L107_TwentyFortyEight
L104_TwentyFortyEight
L102_TwentyFortyEight
L99_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L98_TwentyFortyEight
	LDR R7, R5, #-6
	CONST R3, #0
	CMP R7, R3
	BRz L114_TwentyFortyEight
	ADD R7, R5, #-5
	CONST R3, #0
	STR R3, R7, #3
L114_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L116_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #3
	ADD R3, R7, R3
	ADD R2, R5, #-5
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
L117_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L116_TwentyFortyEight
L71_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;checkWinOrLose;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
checkWinOrLose
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-3	;; allocate stack space for local variables
	;; function body
	CONST R7, #1
	STR R7, R5, #-3
	CONST R7, #0
	STR R7, R5, #-2
L121_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L125_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	HICONST R3, #8
	CMP R7, R3
	BRnp L129_TwentyFortyEight
	LEA R7, L131_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L132_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, score
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR printnum
	ADD R6, R6, #1	;; free space for arguments
	JMP L127_TwentyFortyEight
L129_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L133_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-3
	JMP L134_TwentyFortyEight
L133_TwentyFortyEight
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRzp L135_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R1, R3, R2
	ADD R1, R7, R1
	LDR R1, R1, #0
	ADD R2, R2, #4
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CMP R1, R7
	BRnp L137_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-3
L137_TwentyFortyEight
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRzp L139_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R2, R7, R3
	LDR R2, R2, #0
	ADD R7, R7, #1
	ADD R7, R7, R3
	LDR R7, R7, #0
	CMP R2, R7
	BRnp L141_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-3
L141_TwentyFortyEight
L139_TwentyFortyEight
L135_TwentyFortyEight
L134_TwentyFortyEight
L126_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L125_TwentyFortyEight
L127_TwentyFortyEight
L122_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L121_TwentyFortyEight
	LDR R7, R5, #-3
	CONST R3, #0
	CMP R7, R3
	BRz L143_TwentyFortyEight
	LEA R7, L145_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L143_TwentyFortyEight
L120_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;rotateCCW;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
rotateCCW
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	CONST R7, #18
	SUB R6, R6, R7	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-2
L147_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L151_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	ADD R2, R5, #-16
	ADD R2, R2, #-2
	ADD R2, R3, R2
	ADD R2, R7, R2
	LEA R1, tile
	ADD R3, R3, R1
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R2, #0
L152_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L151_TwentyFortyEight
L148_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L147_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-2
L155_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L159_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R2, R3, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R2, R7, R2
	CONST R1, #3
	SUB R3, R1, R3
	SLL R7, R7, #2
	ADD R1, R5, #-16
	ADD R1, R1, #-2
	ADD R7, R7, R1
	ADD R7, R3, R7
	LDR R7, R7, #0
	STR R7, R2, #0
L160_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L159_TwentyFortyEight
L156_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L155_TwentyFortyEight
L146_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;rotateCW;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
rotateCW
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	CONST R7, #18
	SUB R6, R6, R7	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-2
L164_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L168_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	ADD R2, R5, #-16
	ADD R2, R2, #-2
	ADD R2, R3, R2
	ADD R2, R7, R2
	LEA R1, tile
	ADD R3, R3, R1
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R2, #0
L169_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L168_TwentyFortyEight
L165_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L164_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-2
L172_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L176_TwentyFortyEight
	LDR R7, R5, #-2
	LDR R3, R5, #-1
	SLL R2, R3, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R2, R7, R2
	CONST R1, #3
	SUB R7, R1, R7
	SLL R7, R7, #2
	ADD R1, R5, #-16
	ADD R1, R1, #-2
	ADD R7, R7, R1
	ADD R7, R3, R7
	LDR R7, R7, #0
	STR R7, R2, #0
L177_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L176_TwentyFortyEight
L173_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L172_TwentyFortyEight
L163_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;iterateThrough;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
iterateThrough
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-1
L181_TwentyFortyEight
	LDR R7, R5, #-1
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	STR R7, R5, #-2
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR mergeTiles
	ADD R6, R6, #1	;; free space for arguments
L182_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L181_TwentyFortyEight
L180_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;spawnTile;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
spawnTile
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-8	;; allocate stack space for local variables
	;; function body
	CONST R7, #2
	STR R7, R5, #-6
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-7
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-4
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-5
	CONST R7, #0
	STR R7, R5, #-3
	STR R7, R5, #-2
L186_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L190_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LDR R2, R5, #3
	ADD R2, R3, R2
	ADD R2, R7, R2
	LDR R2, R2, #0
	LEA R1, tile
	ADD R3, R3, R1
	ADD R7, R7, R3
	LDR R7, R7, #0
	CMP R2, R7
	BRz L194_TwentyFortyEight
	CONST R7, #1
	STR R7, R5, #-3
L194_TwentyFortyEight
L191_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L190_TwentyFortyEight
L187_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L186_TwentyFortyEight
	LDR R7, R5, #-3
	CONST R3, #0
	CMP R7, R3
	BRz L196_TwentyFortyEight
	LDR R7, R5, #-7
	STR R7, R5, #-8
	CONST R3, #3
	CMP R7, R3
	BRz L200_TwentyFortyEight
	CONST R7, #7
	LDR R3, R5, #-8
	CMP R3, R7
	BRnp L202_TwentyFortyEight
L200_TwentyFortyEight
	CONST R7, #4
	STR R7, R5, #-6
	JMP L202_TwentyFortyEight
L201_TwentyFortyEight
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-4
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #4
	MOD R7, R7, R3
	STR R7, R5, #-5
L202_TwentyFortyEight
	LDR R7, R5, #-5
	LDR R3, R5, #-4
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L201_TwentyFortyEight
	LDR R7, R5, #-5
	LDR R3, R5, #-4
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R3, R5, #-6
	STR R3, R7, #0
	LEA R7, score
	LDR R3, R7, #0
	LDR R2, R5, #-6
	ADD R3, R3, R2
	STR R3, R7, #0
L196_TwentyFortyEight
L185_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;update_game_state;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
update_game_state
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	CONST R7, #18
	SUB R6, R6, R7	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-2
L205_TwentyFortyEight
	CONST R7, #0
	STR R7, R5, #-1
L209_TwentyFortyEight
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	ADD R2, R5, #-16
	ADD R2, R2, #-2
	ADD R2, R3, R2
	ADD R2, R7, R2
	LEA R1, tile
	ADD R3, R3, R1
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R2, #0
L210_TwentyFortyEight
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L209_TwentyFortyEight
L206_TwentyFortyEight
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L205_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #106
	CMP R7, R3
	BRnp L213_TwentyFortyEight
	JSR iterateThrough
	ADD R6, R6, #0	;; free space for arguments
	ADD R7, R5, #-16
	ADD R7, R7, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR spawnTile
	ADD R6, R6, #1	;; free space for arguments
	JSR checkWinOrLose
	ADD R6, R6, #0	;; free space for arguments
	JMP L214_TwentyFortyEight
L213_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #107
	CMP R7, R3
	BRnp L215_TwentyFortyEight
	JSR rotateCW
	ADD R6, R6, #0	;; free space for arguments
	JSR iterateThrough
	ADD R6, R6, #0	;; free space for arguments
	JSR rotateCCW
	ADD R6, R6, #0	;; free space for arguments
	ADD R7, R5, #-16
	ADD R7, R7, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR spawnTile
	ADD R6, R6, #1	;; free space for arguments
	JSR checkWinOrLose
	ADD R6, R6, #0	;; free space for arguments
	JMP L216_TwentyFortyEight
L215_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #108
	CMP R7, R3
	BRnp L217_TwentyFortyEight
	JSR swap
	ADD R6, R6, #0	;; free space for arguments
	JSR iterateThrough
	ADD R6, R6, #0	;; free space for arguments
	JSR swap
	ADD R6, R6, #0	;; free space for arguments
	ADD R7, R5, #-16
	ADD R7, R7, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR spawnTile
	ADD R6, R6, #1	;; free space for arguments
	JSR checkWinOrLose
	ADD R6, R6, #0	;; free space for arguments
	JMP L218_TwentyFortyEight
L217_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #105
	CMP R7, R3
	BRnp L219_TwentyFortyEight
	JSR rotateCCW
	ADD R6, R6, #0	;; free space for arguments
	JSR iterateThrough
	ADD R6, R6, #0	;; free space for arguments
	JSR rotateCW
	ADD R6, R6, #0	;; free space for arguments
	ADD R7, R5, #-16
	ADD R7, R7, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR spawnTile
	ADD R6, R6, #1	;; free space for arguments
	JSR checkWinOrLose
	ADD R6, R6, #0	;; free space for arguments
	JMP L220_TwentyFortyEight
L219_TwentyFortyEight
	LDR R7, R5, #3
	CONST R3, #113
	CMP R7, R3
	BRnp L221_TwentyFortyEight
	JSR reset_game_state
	ADD R6, R6, #0	;; free space for arguments
L221_TwentyFortyEight
L220_TwentyFortyEight
L218_TwentyFortyEight
L216_TwentyFortyEight
L214_TwentyFortyEight
L204_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;main;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
main
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, L224_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L225_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L226_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L227_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L228_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L229_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JSR reset_game_state
	ADD R6, R6, #0	;; free space for arguments
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
	JMP L231_TwentyFortyEight
L230_TwentyFortyEight
	JSR lc4_wait_for_char
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR update_game_state
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, L233_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, score
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR printnum
	ADD R6, R6, #1	;; free space for arguments
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
L231_TwentyFortyEight
	JMP L230_TwentyFortyEight
	CONST R7, #0
L223_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
score 		.BLKW 1
		.DATA
tile 		.BLKW 16
		.DATA
L233_TwentyFortyEight 		.STRINGZ "\nYour score: "
		.DATA
L229_TwentyFortyEight 		.STRINGZ "Press q to reset\n"
		.DATA
L228_TwentyFortyEight 		.STRINGZ "Press l to slide right\n"
		.DATA
L227_TwentyFortyEight 		.STRINGZ "Press j to slide left\n"
		.DATA
L226_TwentyFortyEight 		.STRINGZ "Press k to slide down\n"
		.DATA
L225_TwentyFortyEight 		.STRINGZ "Press i to slide up\n"
		.DATA
L224_TwentyFortyEight 		.STRINGZ "!!! Welcome to 2048 !!!\n"
		.DATA
L145_TwentyFortyEight 		.STRINGZ "\nYOU LOST!\n"
		.DATA
L132_TwentyFortyEight 		.STRINGZ "\nFinal Score:"
		.DATA
L131_TwentyFortyEight 		.STRINGZ "\nYOU WON!\n"
		.DATA
L17_TwentyFortyEight 		.STRINGZ "\n"
		.DATA
L10_TwentyFortyEight 		.STRINGZ "-32768"
		.DATA
L4_TwentyFortyEight 		.STRINGZ "0"
