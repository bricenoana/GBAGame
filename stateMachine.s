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
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L8+40
	ldr	r3, .L8+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+48
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
	.word	overallSong_length
	.word	overallSong_data
	.word	playSoundA
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
	mov	r2, #6
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
	mov	r2, #7
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
	mov	r2, #2
	ldr	r3, .L30+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
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
	ldr	ip, .L36
	push	{r4, lr}
	ldr	r0, .L36+4
	strh	ip, [r1]	@ movhi
.L33:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L33
	mov	r2, #83886080
	ldr	r1, .L36+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L36+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L36+16
	ldr	r3, .L36+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L36+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
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
	ldr	ip, .L42
	push	{r4, lr}
	ldr	r0, .L42+4
	strh	ip, [r1]	@ movhi
.L39:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L39
	mov	r2, #83886080
	ldr	r1, .L42+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L42+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L42+16
	ldr	r3, .L42+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L42+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
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
	ldr	ip, .L48
	push	{r4, lr}
	ldr	r0, .L48+4
	strh	ip, [r1]	@ movhi
.L45:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L45
	mov	r2, #83886080
	ldr	r1, .L48+8
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L48+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L48+16
	ldr	r3, .L48+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L48+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r4, .L54
	ldr	r0, .L54+4
	ldrb	ip, [r4]	@ zero_extendqisi2
	strb	ip, [r4, #1]
	strh	r0, [r1]	@ movhi
	ldr	r0, .L54+8
.L51:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L51
	mov	r2, #83886080
	ldr	r1, .L54+12
	mov	r3, #256
	mov	r0, #3
	ldr	r5, .L54+16
	mov	lr, pc
	bx	r5
	ldr	r0, .L54+20
	ldr	r3, .L54+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+32
	mov	lr, pc
	bx	r3
	mov	r3, #9
	strb	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
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
	ldr	ip, .L64
	push	{r4, lr}
	ldr	r0, .L64+4
	strh	ip, [r1]	@ movhi
.L57:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L57
	mov	r3, #83886080
	mov	r1, #0
	ldr	r2, .L64+8
.L58:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L58
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L64+12
	mov	r0, #3
	ldr	r4, .L64+16
	mov	lr, pc
	bx	r4
	mvn	r1, #32768
	ldr	r3, .L64+20
	ldr	r2, .L64+24
.L59:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L59
	ldr	r3, .L64+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L64+40
	ldr	r3, .L64+44
	mov	lr, pc
	bx	r3
	mov	r2, #10
	ldr	r3, .L64+48
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
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
	ldr	ip, .L74
	push	{r4, lr}
	ldr	r0, .L74+4
	strh	ip, [r1]	@ movhi
.L67:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #40960
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L67
	mov	r3, #83886080
	mov	r1, #0
	ldr	r2, .L74+8
.L68:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L68
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L74+12
	mov	r0, #3
	ldr	r4, .L74+16
	mov	lr, pc
	bx	r4
	mvn	r1, #32768
	ldr	r3, .L74+20
	ldr	r2, .L74+24
.L69:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L69
	ldr	r3, .L74+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L74+40
	ldr	r3, .L74+44
	mov	lr, pc
	bx	r3
	mov	r2, #11
	ldr	r3, .L74+48
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L75:
	.align	2
.L74:
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
	ldr	r3, .L81
	add	r2, r3, #1024
.L78:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L78
	ldr	r4, .L81+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L81
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
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
	ldr	r3, .L85
	ldr	r1, .L85+4
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L85+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L85+16
	ldr	r3, .L85+20
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L85+24
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L86:
	.align	2
.L85:
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
	ldr	r4, .L185
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #11
	ldrls	pc, [pc, r3, asl #2]
	b	.L87
.L90:
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L89
.L89:
	ldr	r0, .L185+4
.L182:
	ldr	r3, .L185+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L110
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L183
.L110:
	ldr	r3, .L185+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+24
	mov	lr, pc
	bx	r3
.L87:
	pop	{r4, r5, r6, lr}
	bx	lr
.L101:
	ldr	r5, .L185+12
	ldr	r3, .L185+8
	ldr	r0, .L185+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L102
	ldr	r2, .L185+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L102
	bl	goToInstructions
	ldrh	r3, [r5]
.L102:
	tst	r3, #1
	beq	.L103
	ldr	r2, .L185+16
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L103
	mov	r3, #83886080
	ldr	r1, .L185+32
.L104:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L104
	ldr	r3, .L185+36
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldrh	r3, [r5]
	strb	r2, [r4]
.L103:
	tst	r3, #2
	beq	.L105
	ldr	r2, .L185+16
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L105
	bl	goToBossStage
	ldrh	r3, [r5]
.L105:
	tst	r3, #4
	beq	.L87
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L87
	ldr	r3, .L185+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
	b	.L87
.L100:
	ldr	r5, .L185+12
	ldr	r3, .L185+8
	ldr	r0, .L185+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L108
	ldr	r2, .L185+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L108
	bl	goToOP1
	ldrh	r3, [r5]
.L108:
	tst	r3, #4
	beq	.L110
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L110
.L112:
	ldr	r3, .L185+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
	b	.L110
.L99:
	ldr	r3, .L185+8
	ldr	r0, .L185+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L110
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L110
	bl	goToOP2
	b	.L110
.L98:
	ldr	r3, .L185+8
	ldr	r0, .L185+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L110
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L110
	bl	goToOP3
	b	.L110
.L97:
	ldr	r3, .L185+8
	ldr	r0, .L185+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L110
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L110
	bl	goToOP4
	b	.L110
.L96:
	ldr	r3, .L185+8
	ldr	r0, .L185+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L110
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L110
	b	.L112
.L95:
	ldr	r3, .L185+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L113
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L113:
	ldr	r3, .L185+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+68
	mov	lr, pc
	bx	r3
	b	.L87
.L94:
	ldr	r5, .L185+12
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L114
	ldr	r2, .L185+16
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L114
	bl	goToPause
	ldrh	r3, [r5]
.L114:
	tst	r3, #2
	beq	.L115
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L115
	ldr	r3, .L185+40
	mov	lr, pc
	bx	r3
	mov	r3, #6
	strb	r3, [r4]
.L115:
	ldr	r3, .L185+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+76
	mov	lr, pc
	bx	r3
	b	.L87
.L92:
	ldr	r0, .L185+80
	ldr	r3, .L185+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L87
	ldr	r3, .L185+16
	ldrh	r2, [r3]
	ands	r2, r2, #4
	bne	.L87
	ldrb	r5, [r4, #1]	@ zero_extendqisi2
	cmp	r5, #7
	beq	.L122
	cmp	r5, #8
	beq	.L117
	cmp	r5, #6
	movne	r3, #83886080
	ldrne	r1, .L185+32
	beq	.L184
.L118:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L118
.L119:
	ldr	r3, .L185+36
	mov	lr, pc
	bx	r3
	mov	r3, #7
	strb	r3, [r4]
	b	.L87
.L93:
	ldr	r3, .L185+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L120
	ldr	r3, .L185+16
	ldrh	r3, [r3]
	tst	r3, #4
	bleq	goToPause
.L120:
	ldr	r3, .L185+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+88
	mov	lr, pc
	bx	r3
	b	.L87
.L91:
	ldr	r0, .L185+92
	b	.L182
.L183:
	bl	goToStart
	b	.L110
.L184:
	ldr	r3, .L185+40
	mov	lr, pc
	bx	r3
	strb	r5, [r4]
	b	.L87
.L117:
	pop	{r4, r5, r6, lr}
	b	goToBossStage
.L122:
	mov	r3, #83886080
	ldr	r1, .L185+32
.L116:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L116
	b	.L119
.L186:
	.align	2
.L185:
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
