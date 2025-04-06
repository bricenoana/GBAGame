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
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L8
	push	{r4, r5, r6, lr}
	ldr	r0, .L8+4
	strh	ip, [r1]	@ movhi
.L2:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L2
	mov	r3, #83886080
	mov	r1, #0
	ldr	r2, .L8+8
.L3:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	mov	r4, #0	@ movhi
	bne	.L3
	mov	r2, #83886080
	ldr	r1, .L8+12
	mov	r3, #256
	mov	r0, #3
	ldr	r5, .L8+16
	mov	lr, pc
	bx	r5
	ldr	r0, .L8+20
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+36
	strb	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	1044
	.word	100740096
	.word	83886592
	.word	startBGPal
	.word	DMANow
	.word	startBGBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L12+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
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
	mov	r3, #83886080
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L18
.L15:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L15
	ldr	r3, .L18+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L18+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	83886592
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
	ldr	ip, .L24
	push	{r4, lr}
	ldr	r0, .L24+4
	strh	ip, [r1]	@ movhi
.L21:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L21
	mov	r2, #83886080
	ldr	r1, .L24+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L24+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L24+16
	ldr	r3, .L24+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L24+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	ip, .L30
	push	{r4, lr}
	ldr	r0, .L30+4
	strh	ip, [r1]	@ movhi
.L27:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L27
	mov	r2, #83886080
	ldr	r1, .L30+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L30+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L30+16
	ldr	r3, .L30+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L30+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
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
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L40
	push	{r4, lr}
	ldr	r0, .L40+4
	strh	ip, [r1]	@ movhi
.L33:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L33
	mov	r3, #83886080
	mov	r1, #0
	ldr	r2, .L40+8
.L34:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L34
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L40+12
	mov	r0, #3
	ldr	r4, .L40+16
	mov	lr, pc
	bx	r4
	mvn	r1, #32768
	ldr	r3, .L40+20
	ldr	r2, .L40+24
.L35:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L35
	ldr	r3, .L40+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+32
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L40+36
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	1044
	.word	100740096
	.word	83886592
	.word	winScreenPal
	.word	DMANow
	.word	100704256
	.word	100781056
	.word	waitForVBlank
	.word	flipPage
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
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L50
	push	{r4, lr}
	ldr	r0, .L50+4
	strh	ip, [r1]	@ movhi
.L43:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L43
	mov	r3, #83886080
	mov	r1, #0
	ldr	r2, .L50+8
.L44:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L44
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L50+12
	mov	r0, #3
	ldr	r4, .L50+16
	mov	lr, pc
	bx	r4
	mvn	r1, #32768
	ldr	r3, .L50+20
	ldr	r2, .L50+24
.L45:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L45
	ldr	r3, .L50+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+32
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldr	r3, .L50+36
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	1044
	.word	100740096
	.word	83886592
	.word	loseScreenPal
	.word	DMANow
	.word	100704256
	.word	100781056
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L57
	add	r2, r3, #1024
.L54:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L54
	ldr	r4, .L57+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r3, .L61
	ldr	r1, .L61+4
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	mov	r2, #4
	ldr	r3, .L61+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
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
	ldr	r4, .L146
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L63
.L66:
	.word	.L73
	.word	.L72
	.word	.L71
	.word	.L70
	.word	.L69
	.word	.L68
	.word	.L67
	.word	.L65
.L65:
	ldr	r0, .L146+4
.L140:
	ldr	r3, .L146+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
	ldr	r3, .L146+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L85
.L81:
	ldr	r3, .L146+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+24
	mov	lr, pc
	bx	r3
.L63:
	pop	{r4, r5, r6, lr}
	bx	lr
.L70:
	ldr	r5, .L146+12
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L88
	ldr	r2, .L146+16
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L141
.L88:
	tst	r3, #2
	beq	.L89
	ldr	r3, .L146+16
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L142
.L89:
	ldr	r3, .L146+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+32
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L69:
	ldr	r3, .L146+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	ldr	r0, .L146+44
	ldr	r3, .L146+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L63
	ldr	r3, .L146+16
	ldrh	r2, [r3]
	ands	r2, r2, #4
	bne	.L63
	mov	r3, #83886080
	ldr	r1, .L146+48
.L90:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L90
	ldr	r3, .L146+52
	mov	lr, pc
	bx	r3
	mov	r3, #3
	strb	r3, [r4]
	b	.L63
.L67:
	ldr	r0, .L146+56
	b	.L140
.L72:
	ldr	r3, .L146+8
	ldr	r0, .L146+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L80
	ldr	r2, .L146+16
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L85
.L80:
	tst	r3, #1
	beq	.L82
	ldr	r2, .L146+16
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L82
	mov	r3, #83886080
	ldr	r1, .L146+48
.L83:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L83
	ldr	r3, .L146+52
	mov	lr, pc
	bx	r3
	mov	r3, #3
	strb	r3, [r4]
	b	.L81
.L71:
	ldr	r3, .L146+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L87
	ldr	r3, .L146+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L143
.L87:
	ldr	r3, .L146+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+68
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	ldr	r5, .L146+12
	ldr	r3, .L146+8
	ldr	r0, .L146+72
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L74
	ldr	r2, .L146+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L144
.L74:
	tst	r3, #1
	beq	.L75
	ldr	r2, .L146+16
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L75
	mov	r3, #83886080
	ldr	r1, .L146+48
.L76:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L76
	ldr	r3, .L146+52
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldrh	r3, [r5]
	strb	r2, [r4]
.L75:
	tst	r3, #2
	beq	.L77
	ldr	r2, .L146+16
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L145
.L77:
	tst	r3, #4
	beq	.L63
	ldr	r3, .L146+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L63
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L82:
	tst	r3, #4
	beq	.L81
	ldr	r3, .L146+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L81
.L85:
	bl	goToStart
	b	.L81
.L142:
	ldr	r3, .L146+76
	mov	lr, pc
	bx	r3
	mov	r3, #2
	strb	r3, [r4]
	b	.L89
.L144:
	ldr	r3, .L146+76
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldrh	r3, [r5]
	strb	r2, [r4]
	b	.L74
.L143:
	bl	goToPause
	b	.L87
.L145:
	bl	resetSprites
	mov	r2, #32
	ldr	r3, .L146+80
	ldr	r1, .L146+84
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	mov	r2, #4
	ldrh	r3, [r5]
	strb	r2, [r4]
	b	.L77
.L141:
	bl	goToPause
	ldrh	r3, [r5]
	b	.L88
.L147:
	.align	2
.L146:
	.word	.LANCHOR0
	.word	loseScreenBitmap
	.word	drawFullscreenImage4
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.word	updateJungleStage
	.word	drawJungleStage
	.word	updateBossStage
	.word	drawBossStage
	.word	pauseBitmap
	.word	83886592
	.word	initJungleStage
	.word	winScreenBitmap
	.word	INSTRUCTIONSBitmap
	.word	updateCaveStage
	.word	drawCaveStage
	.word	startBGBitmap
	.word	initCaveStage
	.word	player
	.word	initBossStage
	.size	updateStateMachine, .-updateStateMachine
	.comm	shadowOAM,1024,4
	.bss
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 1
state:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
