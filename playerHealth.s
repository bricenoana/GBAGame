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
	.file	"playerHealth.c"
	.text
	.align	2
	.global	initHearts
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHearts, %function
initHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #230
	mov	r0, #2
	mov	r1, #1
	ldr	r3, .L6
.L2:
	str	r2, [r3]
	sub	r2, r2, #10
	cmp	r2, #180
	stmib	r3, {r0, r1}
	add	r3, r3, #12
	bne	.L2
	bx	lr
.L7:
	.align	2
.L6:
	.word	hearts
	.size	initHearts, .-initHearts
	.comm	hearts,60,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
