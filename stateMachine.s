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
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r2, .L6
	ldr	r3, .L6+4
	strb	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r2, r4
	mov	r3, #100663296
	ldr	ip, .L6+8
	ldr	r0, .L6+12
	strh	ip, [r1]	@ movhi
.L2:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L2
	mov	r2, #83886080
	ldr	r1, .L6+16
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L6+20
	mov	lr, pc
	bx	r4
	ldr	r5, .L6+24
	ldr	r0, .L6+28
	ldr	r4, .L6+32
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L6+36
	mov	lr, pc
	bx	r3
	ldr	r0, .L6+28
	mov	lr, pc
	bx	r5
	ldr	r3, .L6+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L6+44
	ldr	r3, .L6+48
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.word	stopSounds
	.word	1044
	.word	100740096
	.word	startBGPal
	.word	DMANow
	.word	drawFullscreenImage4
	.word	startBGBitmap
	.word	waitForVBlank
	.word	flipPage
	.word	overallSong_length
	.word	overallSong_data
	.word	playSoundA
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
	ldr	r3, .L10
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L10+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
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
	ldr	r2, .L16
.L13:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L13
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldr	r3, .L16+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	ip, .L22
	push	{r4, lr}
	ldr	r0, .L22+4
	strh	ip, [r1]	@ movhi
.L19:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L19
	mov	r2, #83886080
	ldr	r1, .L22+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L22+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L22+16
	ldr	r3, .L22+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L22+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	.global	goToOP1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToOP1, %function
goToOP1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L28
	push	{r4, lr}
	ldr	r0, .L28+4
	strh	ip, [r1]	@ movhi
.L25:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L25
	mov	r2, #83886080
	ldr	r1, .L28+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L28+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L28+16
	ldr	r3, .L28+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+28
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L28+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	1044
	.word	100740096
	.word	opening1Pal
	.word	DMANow
	.word	opening1Bitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LANCHOR0
	.size	goToOP1, .-goToOP1
	.align	2
	.global	goToOP2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToOP2, %function
goToOP2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L34
	push	{r4, lr}
	ldr	r0, .L34+4
	strh	ip, [r1]	@ movhi
.L31:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L31
	mov	r2, #83886080
	ldr	r1, .L34+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L34+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L34+16
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L34+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	1044
	.word	100740096
	.word	opening2Pal
	.word	DMANow
	.word	opening2Bitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LANCHOR0
	.size	goToOP2, .-goToOP2
	.align	2
	.global	goToOP3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToOP3, %function
goToOP3:
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
.L37:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L37
	mov	r2, #83886080
	ldr	r1, .L40+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L40+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L40+16
	ldr	r3, .L40+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L40+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	1044
	.word	100740096
	.word	opening3Pal
	.word	DMANow
	.word	opening3Bitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LANCHOR0
	.size	goToOP3, .-goToOP3
	.align	2
	.global	goToOP4
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToOP4, %function
goToOP4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L46
	push	{r4, lr}
	ldr	r0, .L46+4
	strh	ip, [r1]	@ movhi
.L43:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L43
	mov	r2, #83886080
	ldr	r1, .L46+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L46+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L46+16
	ldr	r3, .L46+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L46+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	1044
	.word	100740096
	.word	opening4Pal
	.word	DMANow
	.word	opening4Bitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LANCHOR0
	.size	goToOP4, .-goToOP4
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L52
	ldr	r0, .L52+4
	ldrb	ip, [r4]	@ zero_extendqisi2
	strb	ip, [r4, #1]
	strh	r0, [r1]	@ movhi
	ldr	r0, .L52+8
.L49:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L49
	mov	r2, #83886080
	ldr	r1, .L52+12
	mov	r3, #256
	mov	r0, #3
	ldr	r5, .L52+16
	mov	lr, pc
	bx	r5
	ldr	r0, .L52+20
	ldr	r3, .L52+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+32
	mov	lr, pc
	bx	r3
	mov	r3, #9
	strb	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.word	1044
	.word	100740096
	.word	pausePal
	.word	DMANow
	.word	pauseBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
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
	mov	r2, #67108864
	mov	r1, #0
	ldr	r0, .L58
	push	{r4, lr}
	ldr	r3, .L58+4
	strh	r0, [r2]	@ movhi
	ldr	r2, .L58+8
.L55:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L55
	ldr	r4, .L58+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L58+16
	mov	lr, pc
	bx	r4
	mov	r3, #19200
	mov	r0, #3
	ldr	r2, .L58+4
	ldr	r1, .L58+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L58+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L58+28
	ldr	r3, .L58+32
	mov	lr, pc
	bx	r3
	mov	r2, #10
	ldr	r3, .L58+36
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	1044
	.word	100704256
	.word	100742656
	.word	DMANow
	.word	winScreenPal
	.word	winScreenBitmap
	.word	winSong_length
	.word	winSong_data
	.word	playSoundA
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
	mov	r2, #67108864
	mov	r1, #0
	ldr	r0, .L64
	push	{r4, lr}
	ldr	r3, .L64+4
	strh	r0, [r2]	@ movhi
	ldr	r2, .L64+8
.L61:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L61
	ldr	r4, .L64+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L64+16
	mov	lr, pc
	bx	r4
	mov	r3, #19200
	mov	r0, #3
	ldr	r2, .L64+4
	ldr	r1, .L64+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L64+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L64+28
	ldr	r3, .L64+32
	mov	lr, pc
	bx	r3
	mov	r2, #11
	ldr	r3, .L64+36
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	1044
	.word	100704256
	.word	100742656
	.word	DMANow
	.word	loseScreenPal
	.word	loseScreenBitmap
	.word	loseSong_length
	.word	loseSong_data
	.word	playSoundA
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
	ldr	r3, .L71
	add	r2, r3, #1024
.L68:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L68
	ldr	r4, .L71+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L71
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L72:
	.align	2
.L71:
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
	ldr	r3, .L75
	ldr	r1, .L75+4
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L75+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L75+16
	ldr	r3, .L75+20
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L75+24
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	player
	.word	stopSounds
	.word	initBossStage
	.word	bossSong_length
	.word	bossSong_data
	.word	playSoundA
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
	ldr	r4, .L162
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #11
	ldrls	pc, [pc, r3, asl #2]
	b	.L77
.L80:
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L83
	.word	.L82
	.word	.L81
	.word	.L79
.L91:
	ldr	r3, .L162+4
	ldr	r0, .L162+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #8
	bleq	goToInstructions
.L93:
	ldr	r3, .L162+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+24
	mov	lr, pc
	bx	r3
.L77:
	pop	{r4, r5, r6, lr}
	bx	lr
.L79:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L109
	mov	r3, #83886080
	mov	r2, #1
	ldrh	r0, [r3, #4]
	ldrh	r1, [r3, #10]
	ldrh	r3, [r3, #28]
	strh	r0, [r4, #24]	@ movhi
	strh	r1, [r4, #26]	@ movhi
	strh	r3, [r4, #28]	@ movhi
	str	r2, [r4, #20]
.L109:
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	cmp	r3, #29
	movgt	r3, #83886080
	movgt	r1, #0
	ldrhgt	r2, [r3, #4]
	ldrhgt	r0, [r3, #28]
	strhgt	r2, [r3, #10]	@ movhi
	strhgt	r0, [r3, #4]	@ movhi
	strhgt	r2, [r3, #28]	@ movhi
	strle	r3, [r4, #32]
	ldr	r0, .L162+28
	ldr	r3, .L162+4
	strgt	r1, [r4, #32]
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L112
	ldr	r2, .L162+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L112
.L113:
	mov	r2, #83886080
	mov	r3, #0
	ldrh	ip, [r4, #24]
	ldrh	r0, [r4, #26]
	ldrh	r1, [r4, #28]
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	str	r3, [r4, #20]
	str	r3, [r4, #32]
	strb	r3, [r4]
	pop	{r4, r5, r6, lr}
	b	goToStart
.L90:
	ldr	r3, .L162+4
	ldr	r0, .L162+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L93
	bl	goToOP1
	b	.L93
.L89:
	ldr	r3, .L162+4
	ldr	r0, .L162+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L93
	bl	goToOP2
	b	.L93
.L88:
	ldr	r3, .L162+4
	ldr	r0, .L162+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L93
	bl	goToOP3
	b	.L93
.L87:
	ldr	r3, .L162+4
	ldr	r0, .L162+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L93
	bl	goToOP4
	b	.L93
.L86:
	ldr	r3, .L162+4
	ldr	r0, .L162+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L93
	ldr	r3, .L162+52
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
	b	.L93
.L85:
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L95
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L95:
	ldr	r3, .L162+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+60
	mov	lr, pc
	bx	r3
	b	.L77
.L84:
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L96
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L96:
	ldr	r3, .L162+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+68
	mov	lr, pc
	bx	r3
	b	.L77
.L82:
	ldr	r0, .L162+72
	ldr	r3, .L162+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L77
	ldr	r3, .L162+16
	ldrh	r2, [r3]
	ands	r2, r2, #4
	bne	.L77
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	cmp	r5, #7
	beq	.L114
	cmp	r5, #8
	beq	.L100
	cmp	r5, #6
	movne	r3, #83886080
	ldrne	r1, .L162+76
	beq	.L161
.L101:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L101
.L102:
	ldr	r3, .L162+80
	mov	lr, pc
	bx	r3
	mov	r3, #7
	strb	r3, [r4]
	b	.L77
.L83:
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L103
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L103:
	ldr	r3, .L162+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+88
	mov	lr, pc
	bx	r3
	b	.L77
.L81:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bne	.L104
	mov	r3, #83886080
	mov	r2, #1
	ldrh	r0, [r3, #20]
	ldrh	r1, [r3, #6]
	ldrh	r3, [r3, #28]
	strh	r0, [r4, #8]	@ movhi
	strh	r1, [r4, #10]	@ movhi
	strh	r3, [r4, #12]	@ movhi
	str	r2, [r4, #4]
.L104:
	ldr	r3, [r4, #16]
	add	r3, r3, #1
	cmp	r3, #29
	movgt	r3, #83886080
	movgt	r2, #0
	ldrhgt	r0, [r3, #20]
	ldrhgt	ip, [r3, #6]
	ldrhgt	r1, [r3, #28]
	strhgt	ip, [r3, #20]	@ movhi
	strhgt	r0, [r3, #28]	@ movhi
	strhgt	r1, [r3, #6]	@ movhi
	strle	r3, [r4, #16]
	ldr	r0, .L162+92
	ldr	r3, .L162+4
	strgt	r2, [r4, #16]
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L107
	ldr	r2, .L162+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L107
.L108:
	mov	r2, #83886080
	mov	r3, #0
	ldrh	ip, [r4, #8]
	ldrh	r0, [r4, #10]
	ldrh	r1, [r4, #12]
	strh	ip, [r2, #20]	@ movhi
	strh	r0, [r2, #6]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	str	r3, [r4, #4]
	str	r3, [r4, #16]
	strb	r3, [r4]
	pop	{r4, r5, r6, lr}
	b	goToStart
.L107:
	tst	r3, #2
	beq	.L77
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L77
	b	.L108
.L112:
	tst	r3, #2
	beq	.L77
	ldr	r3, .L162+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L77
	b	.L113
.L161:
	ldr	r3, .L162+52
	mov	lr, pc
	bx	r3
	strb	r5, [r4]
	b	.L77
.L100:
	pop	{r4, r5, r6, lr}
	b	goToBossStage
.L114:
	mov	r3, #83886080
	ldr	r1, .L162+76
.L99:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L99
	b	.L102
.L163:
	.align	2
.L162:
	.word	.LANCHOR0
	.word	drawFullscreenImage4
	.word	startBGBitmap
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.word	loseScreenBitmap
	.word	INSTRUCTIONSBitmap
	.word	opening1Bitmap
	.word	opening2Bitmap
	.word	opening3Bitmap
	.word	opening4Bitmap
	.word	initCaveStage
	.word	updateCaveStage
	.word	drawCaveStage
	.word	updateJungleStage
	.word	drawJungleStage
	.word	pauseBitmap
	.word	83886592
	.word	initJungleStage
	.word	updateBossStage
	.word	drawBossStage
	.word	winScreenBitmap
	.size	updateStateMachine, .-updateStateMachine
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	shadowOAM,1024,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 1
state:
	.space	1
	.type	prevState, %object
	.size	prevState, 1
prevState:
	.space	1
	.space	2
	.type	initialized.4410, %object
	.size	initialized.4410, 4
initialized.4410:
	.space	4
	.type	col10.4406, %object
	.size	col10.4406, 2
col10.4406:
	.space	2
	.type	col3.4407, %object
	.size	col3.4407, 2
col3.4407:
	.space	2
	.type	col14.4408, %object
	.size	col14.4408, 2
col14.4408:
	.space	2
	.space	2
	.type	paletteCounter.4409, %object
	.size	paletteCounter.4409, 4
paletteCounter.4409:
	.space	4
	.type	initialized.4420, %object
	.size	initialized.4420, 4
initialized.4420:
	.space	4
	.type	col2.4416, %object
	.size	col2.4416, 2
col2.4416:
	.space	2
	.type	col5.4417, %object
	.size	col5.4417, 2
col5.4417:
	.space	2
	.type	col14.4418, %object
	.size	col14.4418, 2
col14.4418:
	.space	2
	.space	2
	.type	paletteCounter.4419, %object
	.size	paletteCounter.4419, 4
paletteCounter.4419:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
