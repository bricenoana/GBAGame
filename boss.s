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
	ldr	r1, .L9
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r0, [r1, #16]
	ldr	r2, .L9+4
	cmp	r0, #0
	strh	r3, [r2, #10]	@ movhi
	ldrne	r3, .L9+8
	ldrne	r3, [r3]
	addne	r3, r3, #1
	lslne	r3, r3, #3
	andne	r3, r3, #1016
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	ldreq	r3, .L9+12
	orrne	r3, r3, #8192
	strh	r1, [r2, #8]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	bx	lr
.L10:
	.align	2
.L9:
	.word	boss
	.word	shadowOAM
	.word	.LANCHOR0
	.word	8216
	.size	drawBoss, .-drawBoss
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.align	2
	.global	fireBossFireball
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBossFireball, %function
fireBossFireball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L23
	mov	r5, #0
	mov	r3, r6
	sub	sp, sp, #12
.L17:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L22
	add	r5, r5, #1
	cmp	r5, #5
	add	r3, r3, #28
	bne	.L17
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L22:
	mov	r0, #1
	ldr	r3, .L23+4
	ldr	r1, [r3, #12]
	ldr	r2, [r3, #4]
	ldr	ip, .L23+8
	add	r1, r1, r1, lsr #31
	ldr	r8, [ip, #4]
	add	r1, r2, r1, asr #1
	sub	r2, r1, #8
	sub	r8, r8, r2
	mul	fp, r8, r8
	ldr	r1, [r3, #8]
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	ldr	r9, [ip]
	add	r3, r3, r1, asr r0
	sub	r3, r3, #8
	sub	r9, r9, r3
	mla	fp, r9, r9, fp
	rsb	r1, r5, r5, lsl #3
	add	r4, fp, r0
	add	ip, r6, r1, lsl #2
	cmp	fp, r4, asr r0
	str	r2, [ip, #4]
	str	r0, [ip, #24]
	str	r3, [r6, r1, lsl #2]
	asr	r4, r4, r0
	lsl	r10, r5, #3
	ble	.L18
	ldr	r7, .L23+12
.L14:
	mov	r1, r4
	mov	r0, fp
	mov	lr, pc
	bx	r7
	mov	r1, r4
	add	r4, r0, r4
	cmp	r1, r4, asr #1
	asr	r4, r4, #1
	bgt	.L14
.L13:
	cmp	r1, #0
	moveq	r1, #1
	lsl	r0, r9, #2
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r7
	sub	r5, r10, r5
	add	r6, r6, r5, lsl #2
	str	r0, [r6, #16]
	ldr	r1, [sp, #4]
	lsl	r0, r8, #2
	mov	lr, pc
	bx	r7
	str	r0, [r6, #20]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L18:
	mov	r1, fp
	ldr	r7, .L23+12
	b	.L13
.L24:
	.align	2
.L23:
	.word	fireballs
	.word	boss
	.word	player
	.word	__aeabi_idiv
	.size	fireBossFireball, .-fireBossFireball
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L44
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L42
	ldr	r5, .L44+4
	ldr	r3, [r5]
	sub	r3, r3, #1
	cmp	r3, #0
	ldr	r6, .L44+8
	str	r3, [r5]
	ble	.L40
.L28:
	ldr	r3, [r5, #8]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r5, #8]
	ble	.L43
.L29:
	ldr	r3, [r5, #4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r5, #4]
	ble	.L30
	ldmib	r6, {r0, r1}
.L31:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r2, r1, r2
	add	r3, r0, r3
	cmp	r2, #0
	str	r2, [r4, #4]
	str	r3, [r4]
	blt	.L36
	ldr	ip, [r4, #12]
	rsb	ip, ip, #160
	cmp	r2, ip
	ble	.L37
.L36:
	rsb	r1, r1, #0
	str	r1, [r6, #8]
.L37:
	cmp	r3, #0
	movlt	r1, #0
	movlt	r3, r1
	ldr	r2, [r4, #8]
	rsblt	r0, r0, #0
	strlt	r0, [r6, #4]
	rsb	r2, r2, #160
	strlt	r1, [r4]
	cmp	r2, r3
	ldrlt	r3, [r6, #4]
	rsblt	r3, r3, #0
	strlt	r2, [r4]
	strlt	r3, [r6, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L30:
	ldr	r3, [r5, #12]
	ldr	r2, .L44+12
	mul	r3, r2, r3
	add	r3, r3, #12288
	add	r3, r3, #57
	lsr	r2, r3, #16
	and	r2, r2, #3
	cmp	r2, #2
	str	r3, [r5, #12]
	beq	.L32
	cmp	r2, #3
	beq	.L33
	cmp	r2, #1
	movne	r0, #1
	mvneq	r0, #0
	mov	r1, #0
	stmib	r6, {r0, r1}
.L35:
	mov	r3, #120
	str	r3, [r5, #4]
	b	.L31
.L40:
	ldr	r3, [r6]
	rsbs	r3, r3, #1
	mov	r2, #30
	movcc	r3, #0
	str	r2, [r5]
	str	r3, [r6]
	b	.L28
.L42:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r4, #16]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	bl	fireBossFireball
	mov	r3, #90
	str	r3, [r5, #8]
	b	.L29
.L33:
	mov	r2, #0
	mvn	r3, #0
	mov	r0, r2
	mov	r1, r3
	stmib	r6, {r2, r3}
	b	.L35
.L32:
	mov	r0, #0
	mov	r1, #1
	stmib	r6, {r0, r1}
	b	.L35
.L45:
	.align	2
.L44:
	.word	boss
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	1103515245
	.size	updateBoss, .-updateBoss
	.align	2
	.global	isqrt
	.syntax unified
	.arm
	.fpu softvfp
	.type	isqrt, %function
isqrt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r1, r0, #1
	add	r1, r1, r1, lsr #31
	cmp	r0, r1, asr #1
	push	{r4, r5, r6, lr}
	mov	r5, r0
	ble	.L49
	ldr	r6, .L52
	asr	r4, r1, #1
.L48:
	mov	r1, r4
	mov	r0, r5
	mov	lr, pc
	bx	r6
	add	r1, r0, r4
	add	r1, r1, r1, lsr #31
	cmp	r4, r1, asr #1
	mov	r3, r4
	asr	r4, r1, #1
	bgt	.L48
	mov	r0, r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	mov	r3, r0
	pop	{r4, r5, r6, lr}
	mov	r0, r3
	bx	lr
.L53:
	.align	2
.L52:
	.word	__aeabi_idiv
	.size	isqrt, .-isqrt
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
	.type	fireballTimer.4125, %object
	.size	fireballTimer.4125, 4
fireballTimer.4125:
	.word	90
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
