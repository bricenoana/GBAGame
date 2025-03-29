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
	.file	"jungleStage.c"
	.text
	.align	2
	.global	initJungleStage
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initJungleStage, %function
initJungleStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7040
	push	{r4, r5, r6, lr}
	mov	r0, #3
	ldr	r4, .L4
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, .L4+4
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
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
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	ip, #16
	mov	r1, #1
	mov	r2, #0
	mov	lr, #10
	mov	r0, #100
	mov	r5, #3
	ldr	r3, .L4+44
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	ldr	ip, .L4+48
	str	r1, [r3, #20]
	ldr	r1, .L4+52
	str	lr, [r3, #32]
	str	r0, [r3]
	str	r0, [r3, #4]
	str	r5, [r3, #28]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	ldr	r3, .L4+56
	str	r2, [ip]
	str	r2, [r1]
	mov	lr, pc
	bx	r3
	mov	r0, r5
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	10000
	.word	100728832
	.word	boofBGTiles
	.word	100718592
	.word	boofMapMap
	.word	boofBGPal
	.word	100794368
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	player
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	shadowOAM
	.size	initJungleStage, .-initJungleStage
	.global	__aeabi_idivmod
	.align	2
	.global	updateJungleStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateJungleStage, %function
updateJungleStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L24
	ldrh	r3, [r3]
	push	{r4, r5, r6, lr}
	ldr	r4, .L24+4
	tst	r3, #64
	str	r2, [r4, #36]
	bne	.L7
	mov	r1, #1
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #20]
	sub	r2, r2, r0
	str	r2, [r4, #4]
	str	r1, [r4, #36]
	str	r1, [r4, #40]
.L7:
	ands	r1, r3, #128
	bne	.L8
	mov	r0, #1
	ldr	r2, [r4, #4]
	ldr	ip, [r4, #20]
	add	r2, r2, ip
	str	r1, [r4, #40]
	str	r2, [r4, #4]
	str	r0, [r4, #36]
.L8:
	tst	r3, #32
	ldr	r5, [r4]
	and	r3, r3, #16
	bne	.L9
	mov	r0, #1
	mov	r1, #2
	ldr	r2, [r4, #16]
	cmp	r3, #0
	sub	r3, r5, r2
	movne	r5, r3
	str	r3, [r4]
	str	r0, [r4, #36]
	str	r1, [r4, #40]
	bne	.L11
.L10:
	mov	r2, #1
	mov	r3, #3
	str	r5, [r4]
	str	r2, [r4, #36]
	str	r3, [r4, #40]
.L11:
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #32]
	bne	.L14
	ldr	r0, [r4, #24]
	ldr	r3, .L24+8
	ldr	r1, [r4, #28]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #24]
	str	r3, [r4, #32]
.L14:
	cmp	r5, #0
	movlt	r3, #0
	movlt	r5, r3
	strlt	r3, [r4]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #4]
	rsb	r3, r3, #512
	cmp	r3, r5
	strlt	r3, [r4]
	cmp	r2, #0
	movlt	r3, #0
	movlt	r2, r3
	strlt	r3, [r4, #4]
	ldr	r3, [r4, #12]
	rsb	r3, r3, #512
	cmp	r3, r2
	strlt	r3, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	cmp	r3, #0
	beq	.L23
	ldr	r3, [r4, #36]
	cmp	r3, #0
	moveq	r2, #10
	streq	r3, [r4, #24]
	streq	r2, [r4, #32]
	beq	.L14
	b	.L11
.L23:
	ldr	r3, [r4, #16]
	add	r5, r5, r3
	b	.L10
.L25:
	.align	2
.L24:
	.word	buttons
	.word	player
	.word	__aeabi_idivmod
	.size	updateJungleStage, .-updateJungleStage
	.align	2
	.global	drawJungleStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawJungleStage, %function
drawJungleStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L38
	ldr	r3, [ip]
	ldr	r1, [ip, #4]
	push	{r4, r5, r6, lr}
	sub	r2, r3, #120
	ldr	lr, .L38+4
	ldr	r6, .L38+8
	sub	r0, r1, #80
	cmp	r2, #0
	str	r2, [lr]
	str	r0, [r6]
	blt	.L36
	cmp	r2, #272
	movgt	r4, #272
	subgt	r2, r3, #272
	lslgt	r2, r2, #23
	lslle	r5, r2, #16
	lsrgt	r2, r2, #23
	movgt	r5, r4
	ldrle	r2, .L38+12
	strgt	r4, [lr]
	lsrle	r5, r5, #16
	orrgt	r2, r2, #16384
	cmp	r0, #0
	blt	.L37
.L30:
	cmp	r0, #352
	movgt	r3, #352
	movle	lr, #80
	movgt	r4, r3
	lslle	r4, r0, #16
	subgt	r1, r1, #352
	strgt	r3, [r6]
	lsrle	r4, r4, #16
	andgt	lr, r1, #255
.L31:
	mov	r6, #67108864
	ldr	r0, .L38+16
	mov	r1, #512
	mov	r3, r0
	strh	r5, [r6, #16]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	ldr	r5, [ip, #40]
	ldr	r2, [ip, #24]
	add	ip, r2, r5, lsl #5
	ldr	r2, .L38+20
	strh	r4, [r6, #18]	@ movhi
	and	r2, r2, ip, lsl #1
	strh	lr, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	add	r2, r0, #1016
.L33:
	strh	r1, [r3, #8]!	@ movhi
	cmp	r2, r3
	bne	.L33
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L38+16
	ldr	r4, .L38+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+28
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	mov	r5, #0
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	cmp	r0, #0
	str	r5, [lr]
	orr	r2, r3, #16384
	bge	.L30
.L37:
	mov	r0, #0
	and	lr, r1, #255
	mov	r4, r0
	str	r0, [r6]
	b	.L31
.L39:
	.align	2
.L38:
	.word	player
	.word	hOff
	.word	vOff
	.word	16504
	.word	shadowOAM
	.word	1022
	.word	DMANow
	.word	waitForVBlank
	.size	drawJungleStage, .-drawJungleStage
	.comm	player,44,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
