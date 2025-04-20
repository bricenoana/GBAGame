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
	.file	"text.c"
	.text
	.align	2
	.global	drawText
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawText, %function
drawText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	bxeq	lr
	ldr	ip, .L9
	sub	r1, r1, r0
.L3:
	add	r2, r1, r0
	orr	r3, r3, #4096
	lsl	r2, r2, #1
	strh	r3, [ip, r2]	@ movhi
	ldrb	r3, [r0, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	bx	lr
.L10:
	.align	2
.L9:
	.word	100726784
	.size	drawText, .-drawText
	.align	2
	.global	eraseText
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseText, %function
eraseText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r0, #4096
	ldr	r1, .L15
.L12:
	lsl	r2, r3, #1
	add	r3, r3, #1
	cmp	r3, #1024
	strh	r0, [r1, r2]	@ movhi
	bne	.L12
	bx	lr
.L16:
	.align	2
.L15:
	.word	100726784
	.size	eraseText, .-eraseText
	.ident	"GCC: (devkitARM release 53) 9.1.0"
