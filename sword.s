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
	.file	"sword.c"
	.text
	.align	2
	.global	initSword
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSword, %function
initSword:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #50
	mov	r4, #3
	mov	r2, #110
	mov	r1, #15
	mov	lr, #0
	ldr	ip, .L4
	mov	r0, r4
	str	r3, [ip]
	str	r2, [ip, #4]
	str	r1, [ip, #16]
	ldr	r5, .L4+4
	mov	r3, #16384
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	str	r4, [ip, #12]
	str	lr, [ip, #8]
	str	lr, [ip, #20]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #256
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	sword
	.word	DMANow
	.word	100728832
	.word	swordSpriteTiles
	.word	83886592
	.word	swordSpritePal
	.size	initSword, .-initSword
	.global	__aeabi_idivmod
	.align	2
	.global	updateSword
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSword, %function
updateSword:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L11
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L6
	ldr	r3, [r4, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #16]
	bne	.L6
	ldr	r0, [r4, #8]
	ldr	r3, .L11+4
	ldr	r1, [r4, #12]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #15
	str	r1, [r4, #8]
	str	r3, [r4, #16]
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	sword
	.word	__aeabi_idivmod
	.size	updateSword, .-updateSword
	.align	2
	.global	drawSword
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSword, %function
drawSword:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L15
	ldr	r3, [ip]
	ldr	r2, [ip, #4]
	sub	r0, r3, r0
	ldr	r3, [ip, #8]
	str	lr, [sp, #-4]!
	sub	r2, r2, r1
	ldr	lr, .L15+4
	ldr	r1, .L15+8
	lsl	r0, r0, #23
	add	ip, r3, #256
	lsr	r0, r0, #23
	ldr	r3, .L15+12
	and	r2, r2, #255
	orr	r2, r2, lr
	orr	r0, r0, lr
	and	r1, r1, ip, lsl #1
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	strh	r0, [r3, #18]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	sword
	.word	-32768
	.word	1022
	.word	shadowOAM
	.size	drawSword, .-drawSword
	.comm	sword,24,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
