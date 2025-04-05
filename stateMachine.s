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
	mov	r2, #3
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
	mov	r2, #5
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
	mov	r2, #6
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
	mov	r2, #7
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
	ldr	r3, .L40
	add	r2, r3, #1024
.L37:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L37
	ldr	r4, .L40+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L40
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
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
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L44+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
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
	ldr	r4, .L89
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L46
.L49:
	.word	.L55
	.word	.L54
	.word	.L46
	.word	.L53
	.word	.L52
	.word	.L51
	.word	.L50
	.word	.L48
.L51:
	ldr	r0, .L89+4
	ldr	r3, .L89+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L46
	ldr	r3, .L89+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L46
	ldr	r3, .L89+28
	mov	lr, pc
	bx	r3
	mov	r3, #3
	strb	r3, [r4]
.L46:
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	pop	{r4, r5, r6, lr}
	b	loseState
.L55:
	ldr	r5, .L89+20
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L56
	ldr	r2, .L89+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L86
.L56:
	tst	r3, #4
	beq	.L46
	ldr	r3, .L89+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L46
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L54:
	ldr	r3, .L89+8
	ldr	r0, .L89+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+20
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L59
	ldr	r2, .L89+24
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L62
.L59:
	tst	r3, #1
	beq	.L61
	ldr	r2, .L89+24
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L87
.L61:
	tst	r3, #4
	beq	.L60
	ldr	r3, .L89+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L60
.L62:
	bl	goToStart
.L60:
	ldr	r3, .L89+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	ldr	r3, .L89+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L63
	ldr	r3, .L89+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L88
.L63:
	ldr	r3, .L89+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	ldr	r3, .L89+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+48
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	pop	{r4, r5, r6, lr}
	b	winState
.L86:
	ldr	r3, .L89+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldrh	r3, [r5]
	strb	r2, [r4]
	b	.L56
.L88:
	bl	goToPause
	b	.L63
.L87:
	ldr	r3, .L89+28
	mov	lr, pc
	bx	r3
	mov	r3, #3
	strb	r3, [r4]
	b	.L60
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
	.word	pauseBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	initJungleStage
	.word	INSTRUCTIONSBitmap
	.word	updateJungleStage
	.word	drawJungleStage
	.word	updateBossStage
	.word	drawBossStage
	.size	updateStateMachine, .-updateStateMachine
	.comm	shadowOAM,1024,4
	.bss
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 1
state:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
