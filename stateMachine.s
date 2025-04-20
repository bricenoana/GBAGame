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
	ldr	ip, .L6
	push	{r4, r5, r6, lr}
	ldr	r0, .L6+4
	strh	ip, [r1]	@ movhi
.L2:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	mov	r4, #0	@ movhi
	strh	r2, [r1]	@ movhi
	bne	.L2
	mov	r2, #83886080
	ldr	r1, .L6+8
	mov	r3, #256
	mov	r0, #3
	ldr	r5, .L6+12
	mov	lr, pc
	bx	r5
	ldr	r0, .L6+16
	ldr	r3, .L6+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L6+28
	ldr	r3, .L6+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+44
	strb	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
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
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L62
	push	{r4, lr}
	ldr	r0, .L62+4
	strh	ip, [r1]	@ movhi
.L55:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L55
	mov	r3, #83886080
	mov	r1, #0
	ldr	r2, .L62+8
.L56:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L56
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L62+12
	mov	r0, #3
	ldr	r4, .L62+16
	mov	lr, pc
	bx	r4
	mvn	r1, #32768
	ldr	r3, .L62+20
	ldr	r2, .L62+24
.L57:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L57
	ldr	r3, .L62+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L62+40
	ldr	r3, .L62+44
	mov	lr, pc
	bx	r3
	mov	r2, #10
	ldr	r3, .L62+48
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	1044
	.word	100740096
	.word	83886592
	.word	winScreenPal
	.word	DMANow
	.word	100704256
	.word	100781056
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r0, .L77
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strh	r0, [r2]	@ movhi
	ldr	r3, .L77+4
	ldr	r2, .L77+8
.L65:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L65
	mov	r6, #83886080
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L77+12
	ldr	r4, .L77+16
	mov	lr, pc
	bx	r4
	mov	r3, #19200
	mov	r0, #3
	ldr	r2, .L77+4
	ldr	r1, .L77+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L77+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L77+28
	ldr	r3, .L77+32
	mov	lr, pc
	bx	r3
	ldr	r10, .L77+36
	ldrh	r9, [r6, #4]
	ldrh	r8, [r6, #10]
	ldrh	r7, [r6, #28]
	ldr	fp, .L77+40
	ldr	r5, .L77+44
.L66:
	ldrh	r3, [r10]
	tst	r3, #2
	beq	.L71
	ldrh	r3, [fp]
	tst	r3, #2
	beq	.L76
.L71:
	mov	r4, #30
.L67:
	mov	lr, pc
	bx	r5
	subs	r4, r4, #1
	bne	.L67
	mov	r4, #30
	strh	r7, [r6, #4]	@ movhi
	strh	r9, [r6, #10]	@ movhi
	strh	r8, [r6, #28]	@ movhi
.L68:
	mov	lr, pc
	bx	r5
	subs	r4, r4, #1
	bne	.L68
	strh	r9, [r6, #4]	@ movhi
	strh	r8, [r6, #10]	@ movhi
	strh	r7, [r6, #28]	@ movhi
	b	.L66
.L76:
	mov	r2, #11
	ldr	r3, .L77+48
	strb	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L78:
	.align	2
.L77:
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
	ldr	r3, .L84
	add	r2, r3, #1024
.L81:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L81
	ldr	r4, .L84+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L84
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
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
	ldr	r3, .L88
	ldr	r1, .L88+4
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L88+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L88+16
	ldr	r3, .L88+20
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L88+24
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L89:
	.align	2
.L88:
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
	ldr	r4, .L188
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #11
	ldrls	pc, [pc, r3, asl #2]
	b	.L90
.L93:
	.word	.L104
	.word	.L103
	.word	.L102
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L92
.L92:
	ldr	r0, .L188+4
.L185:
	ldr	r3, .L188+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L113
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L186
.L113:
	ldr	r3, .L188+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+24
	mov	lr, pc
	bx	r3
.L90:
	pop	{r4, r5, r6, lr}
	bx	lr
.L104:
	ldr	r5, .L188+12
	ldr	r3, .L188+8
	ldr	r0, .L188+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L105
	ldr	r2, .L188+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L105
	bl	goToInstructions
	ldrh	r3, [r5]
.L105:
	tst	r3, #1
	beq	.L106
	ldr	r2, .L188+16
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L106
	mov	r3, #83886080
	ldr	r1, .L188+32
.L107:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L107
	ldr	r3, .L188+36
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldrh	r3, [r5]
	strb	r2, [r4]
.L106:
	tst	r3, #2
	beq	.L108
	ldr	r2, .L188+16
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L108
	bl	goToBossStage
	ldrh	r3, [r5]
.L108:
	tst	r3, #4
	beq	.L90
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L90
	ldr	r3, .L188+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
	b	.L90
.L103:
	ldr	r5, .L188+12
	ldr	r3, .L188+8
	ldr	r0, .L188+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L111
	ldr	r2, .L188+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L111
	bl	goToOP1
	ldrh	r3, [r5]
.L111:
	tst	r3, #4
	beq	.L113
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L113
.L115:
	ldr	r3, .L188+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
	b	.L113
.L102:
	ldr	r3, .L188+8
	ldr	r0, .L188+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L113
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L113
	bl	goToOP2
	b	.L113
.L101:
	ldr	r3, .L188+8
	ldr	r0, .L188+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L113
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L113
	bl	goToOP3
	b	.L113
.L100:
	ldr	r3, .L188+8
	ldr	r0, .L188+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L113
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L113
	bl	goToOP4
	b	.L113
.L99:
	ldr	r3, .L188+8
	ldr	r0, .L188+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L113
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L113
	b	.L115
.L98:
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L116
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L116:
	ldr	r3, .L188+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+68
	mov	lr, pc
	bx	r3
	b	.L90
.L97:
	ldr	r5, .L188+12
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L117
	ldr	r2, .L188+16
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L117
	bl	goToPause
	ldrh	r3, [r5]
.L117:
	tst	r3, #2
	beq	.L118
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L118
	ldr	r3, .L188+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
.L118:
	ldr	r3, .L188+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+76
	mov	lr, pc
	bx	r3
	b	.L90
.L95:
	ldr	r0, .L188+80
	ldr	r3, .L188+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L90
	ldr	r3, .L188+16
	ldrh	r2, [r3]
	ands	r2, r2, #4
	bne	.L90
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	cmp	r5, #7
	beq	.L125
	cmp	r5, #8
	beq	.L120
	cmp	r5, #6
	movne	r3, #83886080
	ldrne	r1, .L188+32
	beq	.L187
.L121:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L121
.L122:
	ldr	r3, .L188+36
	mov	lr, pc
	bx	r3
	mov	r3, #7
	strb	r3, [r4]
	b	.L90
.L96:
	ldr	r3, .L188+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L123
	ldr	r3, .L188+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L123:
	ldr	r3, .L188+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+88
	mov	lr, pc
	bx	r3
	b	.L90
.L94:
	ldr	r0, .L188+92
	b	.L185
.L186:
	bl	goToStart
	b	.L113
.L187:
	ldr	r3, .L188+40
	mov	lr, pc
	bx	r3
	strb	r5, [r4]
	b	.L90
.L120:
	pop	{r4, r5, r6, lr}
	b	goToBossStage
.L125:
	mov	r3, #83886080
	ldr	r1, .L188+32
.L119:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L119
	b	.L122
.L189:
	.align	2
.L188:
	.word	.LANCHOR0
	.word	loseScreenBitmap
	.word	drawFullscreenImage4
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.word	startBGBitmap
	.word	83886592
	.word	initJungleStage
	.word	initCaveStage
	.word	INSTRUCTIONSBitmap
	.word	opening1Bitmap
	.word	opening2Bitmap
	.word	opening3Bitmap
	.word	opening4Bitmap
	.word	updateCaveStage
	.word	drawCaveStage
	.word	updateJungleStage
	.word	drawJungleStage
	.word	pauseBitmap
	.word	updateBossStage
	.word	drawBossStage
	.word	winScreenBitmap
	.size	updateStateMachine, .-updateStateMachine
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	shadowOAM,1024,4
	.bss
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 1
state:
	.space	1
	.type	prevState, %object
	.size	prevState, 1
prevState:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
