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
	.file	"dialogueBoxes.c"
	.text
	.align	2
	.global	initBoxes
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoxes, %function
initBoxes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L6
	mov	r1, #64
	mov	r3, r2
	mov	ip, #1
	push	{r4, r5, r6, r7, lr}
	add	r0, r2, #96
.L2:
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #20]
	add	r3, r3, #24
	cmp	r3, r0
	bne	.L2
	mov	r3, #96
	mov	r7, #0
	mov	r6, #20
	mov	r5, #21
	mov	r4, #128
	mov	lr, #22
	mov	ip, #192
	mov	r0, #23
	str	r7, [r2]
	str	r6, [r2, #16]
	str	r5, [r2, #40]
	str	r4, [r2, #48]
	str	lr, [r2, #64]
	str	r1, [r2, #24]
	str	r3, [r2, #4]
	str	r3, [r2, #28]
	str	r3, [r2, #52]
	str	r3, [r2, #76]
	str	ip, [r2, #72]
	str	r0, [r2, #88]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	dialogueBox
	.size	initBoxes, .-initBoxes
	.align	2
	.global	drawBoxes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxes, %function
drawBoxes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #512
	ldr	r3, .L14
	ldr	r0, .L14+4
	ldr	r6, .L14+8
	ldr	r5, .L14+12
	ldr	r4, .L14+16
	add	lr, r3, #96
.L11:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldr	r2, [r3, #16]
	add	ip, r0, r2, lsl #3
	lsl	r8, r2, #3
	lsleq	r2, r2, #3
	strheq	r7, [r0, r2]	@ movhi
	beq	.L10
	ldr	r1, [r3, #4]
	ldr	r2, [r3]
	add	r1, r1, #20
	and	r2, r2, r6
	and	r1, r1, #255
	orr	r2, r2, r5
	strh	r4, [ip, #4]	@ movhi
	strh	r1, [r0, r8]	@ movhi
	strh	r2, [ip, #2]	@ movhi
.L10:
	add	r3, r3, #24
	cmp	r3, lr
	bne	.L11
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	dialogueBox
	.word	shadowOAM
	.word	511
	.word	-16384
	.word	1333
	.size	drawBoxes, .-drawBoxes
	.align	2
	.global	boxInactive
	.syntax unified
	.arm
	.fpu softvfp
	.type	boxInactive, %function
boxInactive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L17
	str	r2, [r3, #20]
	str	r2, [r3, #44]
	str	r2, [r3, #68]
	str	r2, [r3, #92]
	bx	lr
.L18:
	.align	2
.L17:
	.word	dialogueBox
	.size	boxInactive, .-boxInactive
	.align	2
	.global	boxActive
	.syntax unified
	.arm
	.fpu softvfp
	.type	boxActive, %function
boxActive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L20
	str	r2, [r3, #20]
	str	r2, [r3, #44]
	str	r2, [r3, #68]
	str	r2, [r3, #92]
	bx	lr
.L21:
	.align	2
.L20:
	.word	dialogueBox
	.size	boxActive, .-boxActive
	.comm	dialogueBox,96,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
