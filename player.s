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
	push	{r4, lr}
	mov	r2, #0
	mov	ip, #16
	mov	r4, #3
	mov	lr, #10
	mov	r0, #100
	mov	r1, #1
	ldr	r3, .L4
	str	r4, [r3, #28]
	str	lr, [r3, #32]
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
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
	ldr	r3, [ip]
	ldr	r2, [ip, #4]
	str	lr, [sp, #-4]!
	sub	r0, r3, r0
	ldr	lr, [ip, #40]
	ldr	ip, [ip, #24]
	sub	r2, r2, r1
	lsl	r0, r0, #23
	ldr	r1, .L28+4
	ldr	r3, .L28+8
	add	ip, ip, lr, lsl #5
	lsr	r0, r0, #23
	orr	r0, r0, #16384
	and	r2, r2, #255
	and	r1, r1, ip, lsl #1
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	player
	.word	1022
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
