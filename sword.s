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
	ldr	r2, .L10
	ldr	r3, [r2, #20]
	cmp	r3, #0
	bne	.L8
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	sub	r0, r3, r0
	lsl	r0, r0, #23
	sub	r3, r2, r1
	ldr	r1, .L10+4
	ldr	r2, .L10+8
	ldr	ip, .L10+12
	lsr	r0, r0, #23
	and	r3, r3, #255
	orr	r0, r0, r1
	orr	r3, r3, r1
	strh	r0, [r2, #42]	@ movhi
	strh	r3, [r2, #40]	@ movhi
	strh	ip, [r2, #44]	@ movhi
	bx	lr
.L8:
	mov	r2, #512
	ldr	r3, .L10+8
	strh	r2, [r3, #40]	@ movhi
	bx	lr
.L11:
	.align	2
.L10:
	.word	sword
	.word	-32768
	.word	shadowOAM
	.word	771
	.size	drawSword, .-drawSword
	.comm	sword,24,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
