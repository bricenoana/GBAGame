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
	str	r2, [r3, #76]
	str	r2, [r3, #96]
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
	push	{r4, r5, lr}
	ldr	r5, .L12
	mov	ip, #0
	mov	lr, r5
.L8:
	ldr	r4, [lr, #16]
	cmp	r4, #0
	beq	.L11
	add	ip, ip, #1
	cmp	ip, #5
	add	lr, lr, #20
	bne	.L8
	pop	{r4, r5, lr}
	bx	lr
.L11:
	mov	lr, #1
	add	ip, ip, ip, lsl #2
	str	r0, [r5, ip, lsl #2]
	add	ip, r5, ip, lsl #2
	stmib	ip, {r1, r2, r3, lr}
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	slashes
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
	ldr	r3, .L24
	add	r0, r3, #100
.L18:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L16
	ldm	r3, {r1, r2, lr}
	ldr	ip, [r3, #12]
	add	r1, r1, lr
	add	r2, r2, ip
	cmp	r2, #160
	cmpls	r1, #240
	stm	r3, {r1, r2}
	strhi	r4, [r3, #16]
.L16:
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L18
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r3, .L32
	ldr	r2, .L32+4
	ldr	r6, .L32+8
	ldr	r5, .L32+12
	add	r4, r3, #100
.L29:
	ldr	ip, [r3, #16]
	cmp	ip, #0
	ldmne	r3, {ip, lr}
	subne	ip, ip, r0
	andne	ip, ip, r6
	subne	lr, lr, r1
	orrne	ip, ip, #16384
	andne	lr, lr, #255
	add	r3, r3, #20
	strhne	r5, [r2, #60]	@ movhi
	strhne	ip, [r2, #58]	@ movhi
	strhne	lr, [r2, #56]	@ movhi
	strheq	r7, [r2, #56]	@ movhi
	cmp	r3, r4
	add	r2, r2, #8
	bne	.L29
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	slashes
	.word	shadowOAM
	.word	511
	.word	646
	.size	drawSlashes, .-drawSlashes
	.comm	slashes,100,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
