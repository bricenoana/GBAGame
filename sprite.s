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
	.file	"sprite.c"
	.text
	.align	2
	.global	initSlash
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSlash, %function
initSlash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L3
	str	r2, [r3, #16]
	bx	lr
.L4:
	.align	2
.L3:
	.word	slash
	.size	initSlash, .-initSlash
	.align	2
	.global	updateSlash
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSlash, %function
updateSlash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	ldm	r3, {r1, r2, ip}
	ldr	r0, [r3, #12]
	add	r1, r1, ip
	add	r2, r2, r0
	cmp	r2, #160
	cmpls	r1, #240
	stm	r3, {r1, r2}
	movhi	r2, #0
	strhi	r2, [r3, #16]
	bx	lr
.L13:
	.align	2
.L12:
	.word	slash
	.size	updateSlash, .-updateSlash
	.align	2
	.global	drawSlash
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSlash, %function
drawSlash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L17
	ldr	r3, [r2, #16]
	cmp	r3, #0
	beq	.L15
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	sub	r0, r3, r0
	lsl	r0, r0, #23
	ldr	r3, .L17+4
	sub	r1, r2, r1
	lsr	r0, r0, #23
	ldr	r2, .L17+8
	orr	r0, r0, #16384
	and	r1, r1, #255
	strh	r0, [r3, #58]	@ movhi
	strh	r1, [r3, #56]	@ movhi
	strh	r2, [r3, #60]	@ movhi
	bx	lr
.L15:
	mov	r2, #512
	ldr	r3, .L17+4
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L18:
	.align	2
.L17:
	.word	slash
	.word	shadowOAM
	.word	646
	.size	drawSlash, .-drawSlash
	.comm	slash,20,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
