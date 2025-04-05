	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"stateMachine.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L4
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+4
	ldr	r4, .L4+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+12
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+28
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1044
	.word	startBGPal
	.word	DMANow
	.word	startBGBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L11+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
	.set	loseState,winState
	.align	2
	.global	goToCave
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToCave, %function
goToCave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L15+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	initCaveStage
	.word	.LANCHOR0
	.size	goToCave, .-goToCave
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L19+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	initJungleStage
	.word	.LANCHOR0
	.size	goToGame, .-goToGame
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L25
	push	{r4, lr}
	ldr	r0, .L25+4
	strh	ip, [r1]	@ movhi
.L22:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L22
	mov	r2, #83886080
	ldr	r1, .L25+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L25+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L25+16
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L25+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	1044
	.word	100740096
	.word	INSTRUCTIONSPal
	.word	DMANow
	.word	INSTRUCTIONSBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LANCHOR0
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L31
	push	{r4, lr}
	ldr	r0, .L31+4
	strh	ip, [r1]	@ movhi
.L28:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L28
	mov	r2, #83886080
	ldr	r1, .L31+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L31+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L31+16
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L31+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	1044
	.word	100740096
	.word	pausePal
	.word	DMANow
	.word	pauseBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LANCHOR0
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #6
	ldr	r3, .L34
	strb	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #7
	ldr	r3, .L37
	strb	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.size	goToLose, .-goToLose
	.align	2
	.global	initStateMachine
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStateMachine, %function
initStateMachine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goToStart
	.size	initStateMachine, .-initStateMachine
	.align	2
	.global	resetSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetSprites, %function
resetSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #512
	push	{r4, lr}
	ldr	r3, .L44
	add	r2, r3, #1024
.L41:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L41
	ldr	r4, .L44+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L44
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	shadowOAM
	.word	DMANow
	.size	resetSprites, .-resetSprites
	.align	2
	.global	goToBossStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBossStage, %function
goToBossStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	resetSprites
	mov	r2, #32
	ldr	r3, .L48
	ldr	r1, .L48+4
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	mov	r2, #4
	ldr	r3, .L48+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	player
	.word	initBossStage
	.word	.LANCHOR0
	.size	goToBossStage, .-goToBossStage
	.align	2
	.global	updateStateMachine
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStateMachine, %function
updateStateMachine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L108
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L50
.L53:
	.word	.L60
	.word	.L59
	.word	.L58
	.word	.L57
	.word	.L56
	.word	.L55
	.word	.L54
	.word	.L52
.L55:
	ldr	r0, .L108+4
	ldr	r3, .L108+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L50
	ldr	r3, .L108+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L50
	ldr	r3, .L108+28
	mov	lr, pc
	bx	r3
	mov	r3, #3
	strb	r3, [r4]
.L50:
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	pop	{r4, r5, r6, lr}
	b	loseState
.L60:
	ldr	r5, .L108+20
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L61
	ldr	r2, .L108+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L103
.L61:
	tst	r3, #1
	beq	.L62
	ldr	r2, .L108+24
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L104
.L62:
	tst	r3, #4
	beq	.L50
	ldr	r3, .L108+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L50
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L59:
	ldr	r3, .L108+8
	ldr	r0, .L108+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+20
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L65
	ldr	r2, .L108+24
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L68
.L65:
	tst	r3, #1
	beq	.L67
	ldr	r2, .L108+24
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L67
	ldr	r3, .L108+28
	mov	lr, pc
	bx	r3
	mov	r3, #3
	strb	r3, [r4]
.L66:
	ldr	r3, .L108+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L58:
	ldr	r3, .L108+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L69
	ldr	r3, .L108+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L105
.L69:
	ldr	r3, .L108+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	ldr	r5, .L108+20
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L70
	ldr	r2, .L108+24
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L106
.L70:
	tst	r3, #2
	beq	.L71
	ldr	r3, .L108+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L107
.L71:
	ldr	r3, .L108+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+48
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	ldr	r3, .L108+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+56
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	pop	{r4, r5, r6, lr}
	b	winState
.L67:
	tst	r3, #4
	beq	.L66
	ldr	r3, .L108+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L66
.L68:
	bl	goToStart
	b	.L66
.L105:
	bl	goToPause
	b	.L69
.L103:
	ldr	r3, .L108+60
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldrh	r3, [r5]
	strb	r2, [r4]
	b	.L61
.L104:
	ldr	r3, .L108+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldrh	r3, [r5]
	strb	r2, [r4]
	b	.L62
.L107:
	ldr	r3, .L108+60
	mov	lr, pc
	bx	r3
	mov	r3, #2
	strb	r3, [r4]
	b	.L71
.L106:
	bl	goToPause
	ldrh	r3, [r5]
	b	.L70
.L109:
	.align	2
.L108:
	.word	.LANCHOR0
	.word	pauseBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	initJungleStage
	.word	INSTRUCTIONSBitmap
	.word	updateCaveStage
	.word	drawCaveStage
	.word	updateJungleStage
	.word	drawJungleStage
	.word	updateBossStage
	.word	drawBossStage
	.word	initCaveStage
	.size	updateStateMachine, .-updateStateMachine
	.comm	shadowOAM,1024,4
	.bss
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 1
state:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
