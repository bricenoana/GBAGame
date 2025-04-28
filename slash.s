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
	.file	"slash.c"
	.text
	.align	2
	.global	initSlashes
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSlashes, %function
initSlashes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L3
	str	r2, [r3, #16]
	str	r2, [r3, #36]
	str	r2, [r3, #56]
	bx	lr
.L4:
	.align	2
.L3:
	.word	slashes
	.size	initSlashes, .-initSlashes
	.align	2
	.global	spawnSlash
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnSlash, %function
spawnSlash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L24
	push	{r4, r5, r6, r7, lr}
	ldr	lr, [ip, #16]
	subs	r4, lr, #0
	movne	r4, #1
	ldr	r6, [ip, #36]
	ldr	r5, [ip, #56]
	cmp	r6, #0
	ldr	r7, .L24+4
	addne	r4, r4, #1
	cmp	r5, #0
	ldr	r7, [r7, #64]
	beq	.L7
	cmp	r7, #0
	add	r4, r4, #1
	beq	.L5
	mov	r7, #3
	cmp	r7, r4
	ble	.L5
.L10:
	cmp	lr, #0
	beq	.L9
	cmp	r6, #0
	beq	.L12
	cmp	r5, #0
	moveq	lr, #2
	beq	.L9
.L5:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L7:
	cmp	r7, #0
	moveq	r7, #1
	bne	.L10
	cmp	r7, r4
	bgt	.L10
	b	.L5
.L12:
	mov	lr, #1
.L9:
	mov	r4, #1
	add	lr, lr, lr, lsl #2
	str	r0, [ip, lr, lsl #2]
	add	ip, ip, lr, lsl #2
	stmib	ip, {r1, r2, r3, r4}
	b	.L5
.L25:
	.align	2
.L24:
	.word	slashes
	.word	player
	.size	spawnSlash, .-spawnSlash
	.align	2
	.global	updateSlashes
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSlashes, %function
updateSlashes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r3, .L36
	add	r0, r3, #60
.L30:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L28
	ldm	r3, {r1, r2, lr}
	ldr	ip, [r3, #12]
	add	r1, r1, lr
	add	r2, r2, ip
	cmp	r2, #160
	cmpls	r1, #240
	stm	r3, {r1, r2}
	strhi	r4, [r3, #16]
.L28:
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L30
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	slashes
	.size	updateSlashes, .-updateSlashes
	.align	2
	.global	drawSlashes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSlashes, %function
drawSlashes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, #512
	ldr	r3, .L44
	ldr	r2, .L44+4
	ldr	r6, .L44+8
	ldr	r5, .L44+12
	add	r4, r3, #24
.L41:
	ldr	ip, [r2, #16]
	cmp	ip, #0
	ldmne	r2, {ip, lr}
	subne	ip, ip, r0
	andne	ip, ip, r6
	subne	lr, lr, r1
	orrne	ip, ip, #16384
	andne	lr, lr, #255
	strhne	r5, [r3, #60]	@ movhi
	strhne	ip, [r3, #58]	@ movhi
	strhne	lr, [r3, #56]	@ movhi
	strheq	r7, [r3, #56]	@ movhi
	add	r3, r3, #8
	cmp	r3, r4
	add	r2, r2, #20
	bne	.L41
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	shadowOAM
	.word	slashes
	.word	511
	.word	646
	.size	drawSlashes, .-drawSlashes
	.comm	slashes,60,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
