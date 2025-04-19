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
	mov	r1, #67108864
	mov	r3, #100663296
	mov	r2, #0
	ldr	ip, .L72
	push	{r4, lr}
	ldr	r0, .L72+4
	strh	ip, [r1]	@ movhi
.L65:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L65
	mov	r3, #83886080
	mov	r1, #0
	ldr	r2, .L72+8
.L66:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L66
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L72+12
	mov	r0, #3
	ldr	r4, .L72+16
	mov	lr, pc
	bx	r4
	mvn	r1, #32768
	ldr	r3, .L72+20
	ldr	r2, .L72+24
.L67:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L67
	ldr	r3, .L72+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L72+40
	ldr	r3, .L72+44
	mov	lr, pc
	bx	r3
	mov	r2, #11
	ldr	r3, .L72+48
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	1044
	.word	100740096
	.word	83886592
	.word	loseScreenPal
	.word	DMANow
	.word	100704256
	.word	100781056
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L79
	add	r2, r3, #1024
.L76:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L76
	ldr	r4, .L79+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L79
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
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
	ldr	r3, .L83
	ldr	r1, .L83+4
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L83+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L83+16
	ldr	r3, .L83+20
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L83+24
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L84:
	.align	2
.L83:
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
	ldr	r4, .L183
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #11
	ldrls	pc, [pc, r3, asl #2]
	b	.L85
.L88:
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L87
.L87:
	ldr	r0, .L183+4
.L180:
	ldr	r3, .L183+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L108
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L181
.L108:
	ldr	r3, .L183+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+24
	mov	lr, pc
	bx	r3
.L85:
	pop	{r4, r5, r6, lr}
	bx	lr
.L99:
	ldr	r5, .L183+12
	ldr	r3, .L183+8
	ldr	r0, .L183+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L100
	ldr	r2, .L183+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L100
	bl	goToInstructions
	ldrh	r3, [r5]
.L100:
	tst	r3, #1
	beq	.L101
	ldr	r2, .L183+16
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L101
	mov	r3, #83886080
	ldr	r1, .L183+32
.L102:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L102
	ldr	r3, .L183+36
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldrh	r3, [r5]
	strb	r2, [r4]
.L101:
	tst	r3, #2
	beq	.L103
	ldr	r2, .L183+16
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L103
	bl	goToBossStage
	ldrh	r3, [r5]
.L103:
	tst	r3, #4
	beq	.L85
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L85
	ldr	r3, .L183+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
	b	.L85
.L98:
	ldr	r5, .L183+12
	ldr	r3, .L183+8
	ldr	r0, .L183+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L106
	ldr	r2, .L183+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L106
	bl	goToOP1
	ldrh	r3, [r5]
.L106:
	tst	r3, #4
	beq	.L108
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L108
.L110:
	ldr	r3, .L183+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
	b	.L108
.L97:
	ldr	r3, .L183+8
	ldr	r0, .L183+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L108
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L108
	bl	goToOP2
	b	.L108
.L96:
	ldr	r3, .L183+8
	ldr	r0, .L183+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L108
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L108
	bl	goToOP3
	b	.L108
.L95:
	ldr	r3, .L183+8
	ldr	r0, .L183+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L108
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L108
	bl	goToOP4
	b	.L108
.L94:
	ldr	r3, .L183+8
	ldr	r0, .L183+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L108
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L108
	b	.L110
.L93:
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L111
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L111:
	ldr	r3, .L183+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+68
	mov	lr, pc
	bx	r3
	b	.L85
.L92:
	ldr	r5, .L183+12
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L112
	ldr	r2, .L183+16
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L112
	bl	goToPause
	ldrh	r3, [r5]
.L112:
	tst	r3, #2
	beq	.L113
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L113
	ldr	r3, .L183+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
.L113:
	ldr	r3, .L183+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+76
	mov	lr, pc
	bx	r3
	b	.L85
.L90:
	ldr	r0, .L183+80
	ldr	r3, .L183+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L85
	ldr	r3, .L183+16
	ldrh	r2, [r3]
	ands	r2, r2, #4
	bne	.L85
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	cmp	r5, #7
	beq	.L120
	cmp	r5, #8
	beq	.L115
	cmp	r5, #6
	movne	r3, #83886080
	ldrne	r1, .L183+32
	beq	.L182
.L116:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L116
.L117:
	ldr	r3, .L183+36
	mov	lr, pc
	bx	r3
	mov	r3, #7
	strb	r3, [r4]
	b	.L85
.L91:
	ldr	r3, .L183+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L118
	ldr	r3, .L183+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L118:
	ldr	r3, .L183+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L183+88
	mov	lr, pc
	bx	r3
	b	.L85
.L89:
	ldr	r0, .L183+92
	b	.L180
.L181:
	bl	goToStart
	b	.L108
.L182:
	ldr	r3, .L183+40
	mov	lr, pc
	bx	r3
	strb	r5, [r4]
	b	.L85
.L115:
	pop	{r4, r5, r6, lr}
	b	goToBossStage
.L120:
	mov	r3, #83886080
	ldr	r1, .L183+32
.L114:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L114
	b	.L117
.L184:
	.align	2
.L183:
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
