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
	ldr	ip, .L21
	push	{r4, lr}
	ldr	r0, .L21+4
	strh	ip, [r1]	@ movhi
.L18:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L18
	mov	r2, #83886080
	ldr	r1, .L21+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L21+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L21+16
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L21+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
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
	ldr	ip, .L27
	push	{r4, lr}
	ldr	r0, .L27+4
	strh	ip, [r1]	@ movhi
.L24:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L24
	mov	r2, #83886080
	ldr	r1, .L27+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L27+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L27+16
	ldr	r3, .L27+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L27+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
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
	mov	r2, #4
	ldr	r3, .L30
	strb	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
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
	mov	r2, #5
	ldr	r3, .L33
	strb	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
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
	ldr	r4, .L80
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L36
.L39:
	.word	.L44
	.word	.L43
	.word	.L42
	.word	.L41
	.word	.L40
	.word	.L38
.L43:
	ldr	r0, .L80+4
	ldr	r3, .L80+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+20
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L48
	ldr	r2, .L80+24
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L50
.L48:
	tst	r3, #1
	beq	.L49
	ldr	r2, .L80+24
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L49
.L52:
	ldr	r3, .L80+28
	mov	lr, pc
	bx	r3
	mov	r3, #2
	strb	r3, [r4]
.L36:
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	pop	{r4, r5, r6, lr}
	b	loseState
.L44:
	ldr	r5, .L80+20
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L45
	ldr	r2, .L80+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L78
.L45:
	tst	r3, #4
	beq	.L36
	ldr	r3, .L80+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L36
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L41:
	ldr	r0, .L80+32
	ldr	r3, .L80+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L36
	ldr	r3, .L80+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L36
	b	.L52
.L42:
	ldr	r3, .L80+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L51
	ldr	r3, .L80+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L79
.L51:
	ldr	r3, .L80+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	pop	{r4, r5, r6, lr}
	b	winState
.L49:
	tst	r3, #4
	beq	.L36
	ldr	r3, .L80+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L36
.L50:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L79:
	bl	goToPause
	b	.L51
.L78:
	ldr	r3, .L80+28
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldrh	r3, [r5]
	strb	r2, [r4]
	b	.L45
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.word	INSTRUCTIONSBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	initJungleStage
	.word	pauseBitmap
	.word	updateJungleStage
	.word	drawJungleStage
	.size	updateStateMachine, .-updateStateMachine
	.comm	shadowOAM,1024,4
	.bss
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 1
state:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
