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
	.file	"fireball.c"
	.text
	.align	2
	.global	initFireballs
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFireballs, %function
initFireballs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L3
	str	r2, [r3, #24]
	str	r2, [r3, #52]
	str	r2, [r3, #80]
	str	r2, [r3, #108]
	str	r2, [r3, #136]
	bx	lr
.L4:
	.align	2
.L3:
	.word	fireballs
	.size	initFireballs, .-initFireballs
	.align	2
	.global	updateFireballs
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFireballs, %function
updateFireballs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L25
	mov	lr, #0
	mov	r3, r4
	sub	sp, sp, #20
	add	r5, r4, #140
.L9:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L7
	ldr	r1, [r3]
	ldr	r2, [r3, #4]
	ldr	ip, [r3, #16]
	ldr	r0, [r3, #20]
	add	r1, r1, ip
	add	r2, r2, r0
	cmp	r2, #160
	cmpls	r1, #240
	stm	r3, {r1, r2}
	strhi	lr, [r3, #24]
.L7:
	add	r3, r3, #28
	cmp	r3, r5
	bne	.L9
	mov	r7, #16
	mov	r10, #0
	ldr	r6, .L25+4
	ldr	r8, .L25+8
	ldr	r9, .L25+12
	ldr	fp, .L25+16
.L14:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L24
.L11:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L14
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L24:
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	stmib	sp, {r2, r7}
	str	r3, [sp]
	str	r7, [sp, #12]
	ldm	r6, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L11
	ldr	r2, [r9]
	cmp	r2, #0
	str	r10, [r4, #24]
	bne	.L11
	ldr	r3, [r6, #44]
	sub	r3, r3, #20
	cmp	r3, #0
	strgt	r3, [r6, #44]
	bgt	.L11
	str	r2, [r6, #44]
	mov	lr, pc
	bx	fp
	b	.L11
.L26:
	.align	2
.L25:
	.word	fireballs
	.word	player
	.word	collision
	.word	playerBlockActive
	.word	goToLose
	.size	updateFireballs, .-updateFireballs
	.align	2
	.global	drawFireballs
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFireballs, %function
drawFireballs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #512
	ldr	r3, .L33
	ldr	r2, .L33+4
	ldr	r4, .L33+8
	ldr	lr, .L33+12
	add	r0, r3, #140
.L30:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	ldrne	r1, [r3]
	ldrbne	ip, [r3, #4]	@ zero_extendqisi2
	andne	r1, r1, r4
	orrne	r1, r1, #16384
	add	r3, r3, #28
	strhne	lr, [r2, #20]	@ movhi
	strhne	r1, [r2, #18]	@ movhi
	strhne	ip, [r2, #16]	@ movhi
	strheq	r5, [r2, #16]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L30
	pop	{r4, r5, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	fireballs
	.word	shadowOAM
	.word	511
	.word	8750
	.size	drawFireballs, .-drawFireballs
	.comm	fireballs,140,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
