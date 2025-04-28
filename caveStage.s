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
	mov	r3, #5632
	mov	r5, #67108864
	mov	r2, #23040
	ldr	r4, .L4
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+20
	mov	r3, #256
	strh	r2, [r5, #12]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+52
	ldr	r1, .L4+56
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+68
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r0, .L4+72
	ldr	r1, .L4+76
	ldr	r2, .L4+80
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	strh	r3, [r5, #20]	@ movhi
	ldr	r2, .L4+84
	strh	r3, [r5, #22]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+88
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	foregroundCaveTilesPal
	.word	foregroundCaveTilesTiles
	.word	100716544
	.word	foregroundCaveMapMap
	.word	23300
	.word	backgroundCaveTilesPal
	.word	100679680
	.word	backgroundCaveTilesTiles
	.word	100718592
	.word	backgroundCaveMapMap
	.word	100728832
	.word	spriteNormalTiles
	.word	83886592
	.word	spriteNormalPal
	.word	initPlayer
	.word	initSword
	.word	initAlert
	.word	collisionEnabled
	.word	vOff
	.word	hOff
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
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L17+8
	ldr	r3, .L17+12
	ldr	r1, [r2]
	ldr	r0, [r3]
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	mov	r1, #110
	ldr	r3, .L17+20
	ldr	r2, [r3, #8]
	ldr	r0, [r3]
	rsb	r2, r2, #512
	cmp	r0, r2
	str	r1, [r3, #4]
	blt	.L7
	ldr	r3, .L17+24
	ldr	r3, [r3, #20]
	cmp	r3, #1
	beq	.L16
.L7:
	ldr	r3, .L17+28
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L6
	ldr	r3, .L17+32
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L6
	ldr	r2, .L17+36
	ldr	r1, [r2, #16]
	cmp	r1, #0
	movne	r0, #1
	ldrne	r1, .L17+24
	strne	r3, [r2, #16]
	strne	r0, [r1, #20]
.L6:
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r3, .L17+40
	mov	lr, pc
	bx	r3
	b	.L7
.L18:
	.align	2
.L17:
	.word	updatePlayer
	.word	updateSword
	.word	vOff
	.word	hOff
	.word	updateCaveAlert
	.word	player
	.word	sword
	.word	oldButtons
	.word	buttons
	.word	alert
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
	ldr	r3, .L28
	ldr	r3, [r3]
	subs	r3, r3, #120
	push	{r4, r5, r6, lr}
	bmi	.L25
	cmp	r3, #272
	ble	.L26
	mov	r3, #272
	mov	r1, #136
	mov	r0, r3
	ldr	r4, .L28+4
	str	r3, [r4]
.L21:
	mov	r3, #67108864
	mov	r2, #0
	ldr	r5, .L28+8
	str	r2, [r5]
	strh	r0, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	ldr	r0, .L28+12
	strh	r1, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	mov	lr, pc
	bx	r0
	ldr	r3, .L28+16
	ldr	r1, [r5]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+20
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L27
.L23:
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L28+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L28+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L28+36
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	mov	r3, #0
	ldr	r4, .L28+4
	mov	r1, r3
	mov	r0, r3
	str	r3, [r4]
	b	.L21
.L27:
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L28+40
	mov	lr, pc
	bx	r3
	b	.L23
.L26:
	ldr	r4, .L28+4
	asr	r1, r3, #1
	lsl	r1, r1, #16
	lsl	r0, r3, #16
	str	r3, [r4]
	lsr	r1, r1, #16
	lsr	r0, r0, #16
	b	.L21
.L29:
	.align	2
.L28:
	.word	player
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	drawPlayer
	.word	sword
	.word	drawAlert
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	drawSword
	.size	drawCaveStage, .-drawCaveStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
