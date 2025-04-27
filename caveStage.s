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
	.file	"caveStage.c"
	.text
	.align	2
	.global	initCaveStage
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCaveStage, %function
initCaveStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #5888
	mov	r5, #67108864
	mov	r2, #23040
	ldr	r1, .L4
	ldr	r4, .L4+4
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	strh	r1, [r5, #10]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	r0, #3
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+52
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	ip, #10
	mov	r0, #110
	ldr	r2, .L4+56
	ldr	r1, .L4+60
	str	ip, [r2]
	str	r3, [r1]
	ldr	ip, .L4+64
	ldr	r1, .L4+68
	str	r3, [ip]
	str	r3, [r1]
	strh	r3, [r5, #16]	@ movhi
	ldr	r1, .L4+72
	strh	r3, [r5, #18]	@ movhi
	str	r0, [r2, #4]
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+76
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	23300
	.word	DMANow
	.word	foregroundCaveTilesPal
	.word	foregroundCaveTilesTiles
	.word	100718592
	.word	foregroundCaveMapMap
	.word	backgroundCaveTilesPal
	.word	100679680
	.word	backgroundCaveTilesTiles
	.word	100716544
	.word	backgroundCaveMapMap
	.word	initPlayer
	.word	initSword
	.word	initAlert
	.word	player
	.word	collisionEnabled
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	shadowOAM
	.size	initCaveStage, .-initCaveStage
	.align	2
	.global	updateCaveStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCaveStage, %function
updateCaveStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L10
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L10+8
	ldr	r3, .L10+12
	ldr	r1, [r2]
	ldr	r0, [r3]
	ldr	r3, .L10+16
	mov	lr, pc
	bx	r3
	mov	r1, #110
	ldr	r3, .L10+20
	ldr	r2, [r3, #8]
	ldr	r0, [r3]
	rsb	r2, r2, #512
	cmp	r0, r2
	str	r1, [r3, #4]
	bge	.L9
	pop	{r4, lr}
	bx	lr
.L9:
	ldr	r3, .L10+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	updatePlayer
	.word	updateSword
	.word	vOff
	.word	hOff
	.word	updateCaveAlert
	.word	player
	.word	goToGame
	.size	updateCaveStage, .-updateCaveStage
	.align	2
	.global	drawCaveStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCaveStage, %function
drawCaveStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	push	{r4, r5, r6, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	ldr	r0, [r3]
	subs	r0, r0, #120
	bmi	.L17
	cmp	r0, #272
	ble	.L18
	mov	r3, #272
	mov	r2, #136
	mov	ip, r3
	mov	r0, r3
	ldr	r4, .L19+8
	str	r3, [r4]
.L14:
	mov	r3, #67108864
	mov	r1, #0
	ldr	r5, .L19+12
	str	r1, [r5]
	strh	ip, [r3, #16]	@ movhi
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	ldr	r2, .L19+16
	strh	r1, [r3, #22]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L19+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L19+28
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L19+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	mov	r3, #0
	ldr	r4, .L19+8
	mov	r2, r3
	mov	ip, r3
	mov	r0, r3
	str	r3, [r4]
	b	.L14
.L18:
	ldr	r4, .L19+8
	asr	r2, r0, #1
	lsl	r2, r2, #16
	lsl	ip, r0, #16
	str	r0, [r4]
	lsr	r2, r2, #16
	lsr	ip, ip, #16
	b	.L14
.L20:
	.align	2
.L19:
	.word	hideSprites
	.word	player
	.word	hOff
	.word	vOff
	.word	drawPlayer
	.word	drawSword
	.word	drawAlert
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.size	drawCaveStage, .-drawCaveStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
