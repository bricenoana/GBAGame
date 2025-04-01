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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #140
	mov	r4, #3
	mov	r5, #40
	mov	r2, #0
	mov	r1, #10
	mov	lr, #2
	mov	r7, #16
	mov	r6, #32
	ldr	ip, .L4
	mov	r0, r4
	str	r5, [ip]
	str	r3, [ip, #4]
	str	r2, [ip, #40]
	str	r1, [ip, #32]
	ldr	r5, .L4+4
	mov	r3, #16384
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	str	r4, [ip, #28]
	str	r7, [ip, #8]
	str	r6, [ip, #12]
	str	lr, [ip, #16]
	str	lr, [ip, #20]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	DMANow
	.word	100728832
	.word	spriteNormalTiles
	.word	83886592
	.word	spriteNormalPal
	.word	hideSprites
	.word	shadowOAM
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L22
	ldrh	r3, [r3]
	push	{r4, lr}
	ldr	r4, .L22+4
	tst	r3, #64
	str	r2, [r4, #36]
	bne	.L8
	mov	r0, #1
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #20]
	subs	r2, r2, r1
	str	r0, [r4, #40]
	strpl	r2, [r4, #4]
.L8:
	ands	r0, r3, #128
	bne	.L11
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	ldr	ip, [r4, #20]
	add	r2, r1, r2
	sub	r2, r2, #1
	add	r2, r2, ip
	cmp	r2, #512
	addlt	r1, r1, ip
	str	r0, [r4, #40]
	strlt	r1, [r4, #4]
.L11:
	tst	r3, #32
	bne	.L14
	mov	r0, #2
	ldr	r2, [r4]
	ldr	r1, [r4, #16]
	subs	r2, r2, r1
	str	r0, [r4, #40]
	strpl	r2, [r4]
.L14:
	tst	r3, #16
	bne	.L17
	mov	r0, #3
	ldr	r2, [r4]
	ldr	ip, [r4, #16]
	ldr	r1, [r4, #8]
	add	r2, r2, ip
	add	r1, r2, r1
	cmp	r1, #512
	str	r0, [r4, #40]
	strle	r2, [r4]
.L17:
	and	r3, r3, #240
	cmp	r3, #240
	beq	.L19
	mov	r2, #1
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #32]
	str	r2, [r4, #36]
	bne	.L6
	ldr	r0, [r4, #24]
	ldr	r3, .L22+8
	ldr	r1, [r4, #28]
	add	r0, r0, r2
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #24]
	str	r3, [r4, #32]
.L6:
	pop	{r4, lr}
	bx	lr
.L19:
	mov	r2, #0
	mov	r3, #10
	str	r2, [r4, #24]
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	buttons
	.word	player
	.word	__aeabi_idivmod
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L28
	ldm	ip, {r2, r3}
	sub	r0, r2, r0
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #23
	ldr	r5, .L28+4
	ldr	r4, [ip, #40]
	ldr	lr, .L28+8
	lsr	r0, r0, #23
	orr	r0, r0, r5
	strh	r0, [lr, #2]	@ movhi
	sub	r0, r4, #1
	cmp	r0, #2
	sub	r2, r2, #120
	movhi	r4, #0
	sub	r1, r3, r1
	lslls	r4, r4, #6
	sub	r3, r3, #80
	cmp	r2, #272
	movge	r2, #272
	cmp	r3, #352
	movge	r3, #352
	mov	r0, #67108864
	and	r1, r1, #255
	orr	r1, r1, r5
	strh	r1, [lr]	@ movhi
	ldr	r1, [ip, #24]
	bic	r2, r2, r2, asr #31
	add	r4, r4, r1
	bic	r3, r3, r3, asr #31
	ldr	r1, .L28+12
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	and	r4, r1, r4, lsl #1
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r0, #16]	@ movhi
	strh	r3, [r0, #18]	@ movhi
	strh	r4, [lr, #4]	@ movhi
	ldr	r3, .L28+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L28+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L28+8
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	player
	.word	-32768
	.word	shadowOAM
	.word	1022
	.word	waitForVBlank
	.word	DMANow
	.size	drawPlayer, .-drawPlayer
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
