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
	str	lr, [sp, #-4]!
	mov	ip, #110
	mov	lr, #400
	mov	r0, #32
	mov	r1, #64
	mov	r2, #1
	ldr	r3, .L4
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	sword
	.size	initSword, .-initSword
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	ldr	ip, .L8
	ldr	r3, [ip]
	ldr	r2, [ip, #4]
	sub	r0, r3, r0
	sub	r2, r2, r1
	lsl	r0, r0, #23
	ldr	r1, .L8+4
	ldr	r3, .L8+8
	ldr	ip, .L8+12
	lsr	r0, r0, #23
	and	r2, r2, #255
	orr	r0, r0, r1
	orr	r2, r2, r1
	strh	r0, [r3, #26]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	strh	ip, [r3, #28]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	sword
	.word	-32768
	.word	shadowOAM
	.word	771
	.size	drawSword, .-drawSword
	.comm	sword,20,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
