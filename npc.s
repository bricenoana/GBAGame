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
	.file	"npc.c"
	.text
	.align	2
	.global	initNPC
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initNPC, %function
initNPC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #140
	mov	lr, #240
	mov	r0, #32
	mov	r1, #64
	mov	r2, #1
	ldr	r3, .L4
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	npc
	.size	initNPC, .-initNPC
	.align	2
	.global	updateNPC
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNPC, %function
updateNPC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L7
	ldr	ip, [r3]
	ldr	r2, [r3, #4]
	sub	ip, ip, r0
	sub	r2, r2, r1
	str	ip, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L8:
	.align	2
.L7:
	.word	npc
	.size	updateNPC, .-updateNPC
	.align	2
	.global	drawNPC
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNPC, %function
drawNPC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L14
	ldr	r3, [r2, #24]
	cmp	r3, #0
	bxeq	lr
	mov	ip, #4864
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	sub	r0, r3, r0
	lsl	r0, r0, #23
	sub	r3, r2, r1
	ldr	r1, .L14+4
	ldr	r2, .L14+8
	lsr	r0, r0, #23
	and	r3, r3, #255
	orr	r0, r0, r1
	orr	r3, r3, r1
	strh	r0, [r2, #34]	@ movhi
	strh	r3, [r2, #32]	@ movhi
	strh	ip, [r2, #36]	@ movhi
	bx	lr
.L15:
	.align	2
.L14:
	.word	npc
	.word	-32768
	.word	shadowOAM
	.size	drawNPC, .-drawNPC
	.comm	npc,32,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
