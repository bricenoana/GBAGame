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
	.file	"boss.c"
	.text
	.align	2
	.global	initBoss
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoss, %function
initBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #20
	push	{r4, lr}
	mov	lr, #60
	mov	r4, #30
	mov	ip, #0
	mov	r2, #64
	mov	r1, #100
	ldr	r0, .L4
	str	r3, [r0]
	ldr	r3, .L4+4
	str	lr, [r0, #4]
	stm	r3, {r4, lr}
	ldr	lr, .L4+8
	str	ip, [r0, #24]
	ldr	r4, .L4+12
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	str	r1, [r0, #20]
	str	r1, [r0, #16]
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	str	ip, [lr]
	str	ip, [lr, #4]
	str	ip, [lr, #8]
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	boss
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	DMANow
	.word	100728832
	.word	spriteNormalTiles
	.word	83886592
	.word	spriteNormalPal
	.word	hideSprites
	.word	shadowOAM
	.size	initBoss, .-initBoss
	.align	2
	.global	updateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r2, [r3, #16]
	cmp	r2, #0
	push	{r4, lr}
	ble	.L21
	ldr	r2, .L22+4
	ldr	r1, [r2]
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r2]
	ldr	r1, .L22+8
	ble	.L19
.L8:
	ldr	r0, [r2, #4]
	sub	r0, r0, #1
	cmp	r0, #0
	str	r0, [r2, #4]
	ble	.L9
	ldr	lr, [r1, #4]
	ldr	ip, [r1, #8]
.L10:
	ldr	r0, [r3, #4]
	ldr	r2, [r3]
	add	r0, ip, r0
	add	r2, lr, r2
	cmp	r0, #0
	str	r0, [r3, #4]
	str	r2, [r3]
	blt	.L15
	ldr	r4, [r3, #12]
	rsb	r4, r4, #160
	cmp	r0, r4
	bgt	.L15
.L16:
	cmp	r2, #0
	movlt	ip, #0
	movlt	r2, ip
	ldr	r0, [r3, #8]
	rsblt	lr, lr, #0
	rsb	r0, r0, #160
	strlt	lr, [r1, #4]
	strlt	ip, [r3]
	cmp	r2, r0
	ldrgt	r2, [r1, #4]
	rsbgt	r2, r2, #0
	strgt	r0, [r3]
	strgt	r2, [r1, #4]
.L6:
	pop	{r4, lr}
	bx	lr
.L15:
	rsb	ip, ip, #0
	str	ip, [r1, #8]
	b	.L16
.L19:
	ldr	r0, [r1]
	rsbs	r0, r0, #1
	mov	ip, #30
	movcc	r0, #0
	str	ip, [r2]
	str	r0, [r1]
	b	.L8
.L21:
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	ldr	r1, .L22+8
	ldr	r2, .L22+4
	b	.L8
.L9:
	ldr	r0, [r2, #8]
	ldr	ip, .L22+12
	mul	r0, ip, r0
	add	r0, r0, #12288
	add	r0, r0, #57
	lsr	ip, r0, #16
	and	ip, ip, #3
	cmp	ip, #2
	str	r0, [r2, #8]
	beq	.L11
	cmp	ip, #3
	beq	.L12
	cmp	ip, #1
	movne	lr, #1
	mvneq	lr, #0
	mov	ip, #0
	str	lr, [r1, #4]
	str	ip, [r1, #8]
.L14:
	mov	r0, #120
	str	r0, [r2, #4]
	b	.L10
.L11:
	mov	lr, #0
	mov	ip, #1
	str	lr, [r1, #4]
	str	ip, [r1, #8]
	b	.L14
.L12:
	mov	r4, #0
	mvn	r0, #0
	mov	lr, r4
	mov	ip, r0
	str	r4, [r1, #4]
	str	r0, [r1, #8]
	b	.L14
.L23:
	.align	2
.L22:
	.word	boss
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	1103515245
	.size	updateBoss, .-updateBoss
	.align	2
	.global	drawBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoss, %function
drawBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L27
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r0, [r1, #16]
	ldr	r2, .L27+4
	cmp	r0, #0
	strh	r3, [r2, #10]	@ movhi
	ldrne	r3, .L27+8
	ldrne	r3, [r3]
	addne	r3, r3, #1
	lslne	r3, r3, #3
	andne	r3, r3, #1016
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	ldreq	r3, .L27+12
	orrne	r3, r3, #8192
	strh	r1, [r2, #8]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	bx	lr
.L28:
	.align	2
.L27:
	.word	boss
	.word	shadowOAM
	.word	.LANCHOR0
	.word	8216
	.size	drawBoss, .-drawBoss
	.comm	boss,28,4
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	bossFrameDelay, %object
	.size	bossFrameDelay, 4
bossFrameDelay:
	.word	30
	.type	bossMoveTimer, %object
	.size	bossMoveTimer, 4
bossMoveTimer:
	.word	60
	.type	seed, %object
	.size	seed, 4
seed:
	.word	123456789
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bossFrame, %object
	.size	bossFrame, 4
bossFrame:
	.space	4
	.type	bossXVel, %object
	.size	bossXVel, 4
bossXVel:
	.space	4
	.type	bossYVel, %object
	.size	bossYVel, 4
bossYVel:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
