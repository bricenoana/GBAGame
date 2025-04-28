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
	push	{r4, lr}
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
	ldr	r0, .L6+24
	ldr	r3, .L6+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L6+36
	ldr	r3, .L6+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+48
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
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
	.word	startBGBitmap
	.word	drawFullscreenImage4
	.word	overallSong_length
	.word	overallSong_data
	.word	playSoundA
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r0, .L67
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strh	r0, [r2]	@ movhi
	ldr	r3, .L67+4
	ldr	r2, .L67+8
.L55:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L55
	mov	r6, #83886080
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L67+12
	ldr	r4, .L67+16
	mov	lr, pc
	bx	r4
	mov	r3, #19200
	mov	r0, #3
	ldr	r2, .L67+4
	ldr	r1, .L67+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L67+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L67+28
	ldr	r3, .L67+32
	mov	lr, pc
	bx	r3
	ldr	r10, .L67+36
	ldrh	r9, [r6, #20]
	ldrh	r8, [r6, #6]
	ldrh	r7, [r6, #28]
	ldr	fp, .L67+40
	ldr	r5, .L67+44
.L56:
	ldrh	r3, [r10]
	tst	r3, #2
	beq	.L61
	ldrh	r3, [fp]
	tst	r3, #2
	beq	.L66
.L61:
	mov	r4, #30
.L57:
	mov	lr, pc
	bx	r5
	subs	r4, r4, #1
	bne	.L57
	mov	r4, #30
	strh	r8, [r6, #20]	@ movhi
	strh	r7, [r6, #6]	@ movhi
	strh	r9, [r6, #28]	@ movhi
.L58:
	mov	lr, pc
	bx	r5
	subs	r4, r4, #1
	bne	.L58
	strh	r9, [r6, #20]	@ movhi
	strh	r8, [r6, #6]	@ movhi
	strh	r7, [r6, #28]	@ movhi
	b	.L56
.L66:
	mov	r2, #10
	ldr	r3, .L67+48
	strb	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	1044
	.word	100704256
	.word	100742656
	.word	winScreenPal
	.word	DMANow
	.word	winScreenBitmap
	.word	winSong_length
	.word	winSong_data
	.word	playSoundA
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
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
	ldr	r0, .L82
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strh	r0, [r2]	@ movhi
	ldr	r3, .L82+4
	ldr	r2, .L82+8
.L70:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L70
	mov	r6, #83886080
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L82+12
	ldr	r4, .L82+16
	mov	lr, pc
	bx	r4
	mov	r3, #19200
	mov	r0, #3
	ldr	r2, .L82+4
	ldr	r1, .L82+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L82+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L82+28
	ldr	r3, .L82+32
	mov	lr, pc
	bx	r3
	ldr	r10, .L82+36
	ldrh	r9, [r6, #4]
	ldrh	r8, [r6, #10]
	ldrh	r7, [r6, #28]
	ldr	fp, .L82+40
	ldr	r5, .L82+44
.L71:
	ldrh	r3, [r10]
	tst	r3, #2
	beq	.L76
	ldrh	r3, [fp]
	tst	r3, #2
	beq	.L81
.L76:
	mov	r4, #30
.L72:
	mov	lr, pc
	bx	r5
	subs	r4, r4, #1
	bne	.L72
	mov	r4, #30
	strh	r7, [r6, #4]	@ movhi
	strh	r9, [r6, #10]	@ movhi
	strh	r8, [r6, #28]	@ movhi
.L73:
	mov	lr, pc
	bx	r5
	subs	r4, r4, #1
	bne	.L73
	strh	r9, [r6, #4]	@ movhi
	strh	r8, [r6, #10]	@ movhi
	strh	r7, [r6, #28]	@ movhi
	b	.L71
.L81:
	mov	r2, #11
	ldr	r3, .L82+48
	strb	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	1044
	.word	100704256
	.word	100742656
	.word	loseScreenPal
	.word	DMANow
	.word	loseScreenBitmap
	.word	loseSong_length
	.word	loseSong_data
	.word	playSoundA
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
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
	ldr	r3, .L89
	add	r2, r3, #1024
.L86:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L86
	ldr	r4, .L89+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L89
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L90:
	.align	2
.L89:
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
	ldr	r3, .L93
	ldr	r1, .L93+4
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L93+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L93+16
	ldr	r3, .L93+20
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L93+24
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L94:
	.align	2
.L93:
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
	ldr	r4, .L192
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #11
	ldrls	pc, [pc, r3, asl #2]
	b	.L95
.L98:
	.word	.L109
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L105
	.word	.L104
	.word	.L103
	.word	.L102
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L97
.L109:
	ldr	r5, .L192+4
	ldr	r3, .L192+8
	ldr	r0, .L192+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L110
	ldr	r2, .L192+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L110
	bl	goToInstructions
	ldrh	r3, [r5]
.L110:
	tst	r3, #1
	beq	.L111
	ldr	r2, .L192+16
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L111
	mov	r3, #83886080
	ldr	r1, .L192+20
.L112:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L112
	ldr	r3, .L192+24
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldrh	r3, [r5]
	strb	r2, [r4]
.L111:
	tst	r3, #2
	beq	.L113
	ldr	r2, .L192+16
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L113
	bl	goToBossStage
	ldrh	r3, [r5]
.L113:
	tst	r3, #4
	beq	.L95
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L95
	ldr	r3, .L192+28
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
.L95:
	pop	{r4, r5, r6, lr}
	bx	lr
.L97:
	ldr	r0, .L192+32
.L190:
	ldr	r3, .L192+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+40
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	cmp	r3, #180
	str	r3, [r4, #4]
	bgt	.L129
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L95
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L95
.L129:
	mov	r3, #0
	str	r3, [r4, #4]
	strb	r3, [r4]
	pop	{r4, r5, r6, lr}
	b	goToStart
.L108:
	ldr	r5, .L192+4
	ldr	r3, .L192+8
	ldr	r0, .L192+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L116
	ldr	r2, .L192+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L116
	bl	goToOP1
	ldrh	r3, [r5]
.L116:
	tst	r3, #4
	beq	.L118
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L118
.L120:
	ldr	r3, .L192+28
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
.L118:
	ldr	r3, .L192+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L107:
	ldr	r3, .L192+8
	ldr	r0, .L192+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L118
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L118
	bl	goToOP2
	b	.L118
.L106:
	ldr	r3, .L192+8
	ldr	r0, .L192+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L118
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L118
	bl	goToOP3
	b	.L118
.L102:
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L122
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L122:
	ldr	r3, .L192+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+60
	mov	lr, pc
	bx	r3
	b	.L95
.L101:
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L127
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L127:
	ldr	r3, .L192+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+68
	mov	lr, pc
	bx	r3
	b	.L95
.L104:
	ldr	r3, .L192+8
	ldr	r0, .L192+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L118
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L118
	b	.L120
.L100:
	ldr	r0, .L192+76
	ldr	r3, .L192+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L95
	ldr	r3, .L192+16
	ldrh	r2, [r3]
	ands	r2, r2, #4
	bne	.L95
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	cmp	r5, #7
	beq	.L130
	cmp	r5, #8
	beq	.L124
	cmp	r5, #6
	movne	r3, #83886080
	ldrne	r1, .L192+20
	beq	.L191
.L125:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L125
.L126:
	ldr	r3, .L192+24
	mov	lr, pc
	bx	r3
	mov	r3, #7
	strb	r3, [r4]
	b	.L95
.L99:
	ldr	r0, .L192+80
	b	.L190
.L105:
	ldr	r3, .L192+8
	ldr	r0, .L192+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L118
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L118
	bl	goToOP4
	b	.L118
.L103:
	ldr	r3, .L192+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L121
	ldr	r3, .L192+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L121:
	ldr	r3, .L192+88
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+92
	mov	lr, pc
	bx	r3
	b	.L95
.L191:
	ldr	r3, .L192+28
	mov	lr, pc
	bx	r3
	strb	r5, [r4]
	b	.L95
.L124:
	pop	{r4, r5, r6, lr}
	b	goToBossStage
.L130:
	mov	r3, #83886080
	ldr	r1, .L192+20
.L123:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L123
	b	.L126
.L193:
	.align	2
.L192:
	.word	.LANCHOR0
	.word	oldButtons
	.word	drawFullscreenImage4
	.word	startBGBitmap
	.word	buttons
	.word	83886592
	.word	initJungleStage
	.word	initCaveStage
	.word	loseScreenBitmap
	.word	waitForVBlank
	.word	flipPage
	.word	INSTRUCTIONSBitmap
	.word	opening1Bitmap
	.word	opening2Bitmap
	.word	updateJungleStage
	.word	drawJungleStage
	.word	updateBossStage
	.word	drawBossStage
	.word	opening4Bitmap
	.word	pauseBitmap
	.word	winScreenBitmap
	.word	opening3Bitmap
	.word	updateCaveStage
	.word	drawCaveStage
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
	.type	winLoseTimer, %object
	.size	winLoseTimer, 4
winLoseTimer:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
