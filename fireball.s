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
	push	{r4, lr}
	mov	lr, #0
	ldr	ip, .L4
	ldr	r4, .L4+4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	str	lr, [ip, #24]
	str	lr, [ip, #52]
	str	lr, [ip, #80]
	str	lr, [ip, #108]
	str	lr, [ip, #136]
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	fireballs
	.word	DMANow
	.word	100728832
	.word	spriteNormalTiles
	.word	83886592
	.word	spriteNormalPal
	.word	hideSprites
	.word	shadowOAM
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
	push	{r4, lr}
	mov	r4, #0
	ldr	r3, .L16
	add	r0, r3, #140
.L10:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L8
	ldr	r1, [r3]
	ldr	r2, [r3, #4]
	ldr	lr, [r3, #16]
	ldr	ip, [r3, #20]
	add	r1, r1, lr
	add	r2, r2, ip
	cmp	r2, #160
	cmpls	r1, #240
	stm	r3, {r1, r2}
	strhi	r4, [r3, #24]
.L8:
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L10
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	fireballs
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
	push	{r4, r5, r6, lr}
	mov	r6, #512
	ldr	r3, .L24
	ldr	r2, .L24+4
	ldr	r5, .L24+8
	ldr	r4, .L24+12
	ldr	lr, .L24+16
	add	r0, r3, #140
.L21:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	ldrne	r1, [r3]
	ldrbne	ip, [r3, #4]	@ zero_extendqisi2
	andne	r1, r1, r5
	orrne	r1, r1, r4
	add	r3, r3, #28
	strhne	lr, [r2, #20]	@ movhi
	strhne	r1, [r2, #18]	@ movhi
	strhne	ip, [r2, #16]	@ movhi
	strheq	r6, [r2, #16]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L21
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	fireballs
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	12809
	.size	drawFireballs, .-drawFireballs
	.comm	fireballs,140,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
