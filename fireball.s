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
	ldr	r4, .L30
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
	ldr	r6, .L30+4
	ldr	r7, .L30+8
	ldr	r9, .L30+12
	ldr	r8, .L30+16
	ldr	fp, .L30+20
	ldr	r10, .L30+24
.L15:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L28
.L11:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L15
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L28:
	mov	r3, #16
	ldr	r1, [r4, #4]
	ldr	r2, [r4]
	stmib	sp, {r1, r3}
	str	r3, [sp, #12]
	str	r2, [sp]
	ldm	r6, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L11
	mov	r0, #0
	ldrh	r3, [r9]
	tst	r3, #2
	str	r0, [r4, #24]
	bne	.L29
.L13:
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L11
	ldr	r1, [r6, #56]
	cmp	r1, #0
	moveq	r1, #30
	ldr	r2, [r6, #44]
	sub	r3, r2, #20
	str	r3, [r6, #44]
	subeq	r3, r2, #40
	streq	r3, [r6, #44]
	streq	r1, [r6, #56]
	cmp	r3, #0
	bgt	.L11
	mov	r3, #0
	str	r3, [r6, #44]
	mov	lr, pc
	bx	fp
	ldr	r2, [r6, #44]
	cmp	r2, #0
	bgt	.L11
	mov	r3, #0
	str	r3, [r6, #44]
	mov	lr, pc
	bx	fp
	b	.L11
.L29:
	mov	lr, pc
	bx	r10
	b	.L13
.L31:
	.align	2
.L30:
	.word	fireballs
	.word	player
	.word	collision
	.word	buttons
	.word	playerBlockActive
	.word	goToLose
	.word	playAnalogSound
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
	ldr	r3, .L38
	ldr	r2, .L38+4
	ldr	r4, .L38+8
	ldr	lr, .L38+12
	add	r0, r3, #140
.L35:
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
	bne	.L35
	pop	{r4, r5, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	fireballs
	.word	shadowOAM
	.word	511
	.word	8750
	.size	drawFireballs, .-drawFireballs
	.comm	fireballs,140,4
	.comm	NOTES,2,2
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
