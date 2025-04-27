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
	mov	r6, #512
	ldr	r3, .L14
	ldr	r1, .L14+4
	ldr	r5, .L14+8
	ldr	r4, .L14+12
	ldr	lr, .L14+16
	add	ip, r3, #96
.L11:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldr	r2, [r3, #16]
	add	r0, r1, r2, lsl #3
	lsl	r7, r2, #3
	lsleq	r2, r2, #3
	strheq	r6, [r1, r2]	@ movhi
	beq	.L10
	ldr	r2, [r3, #4]
	ldr	r8, [r3]
	add	r2, r2, #20
	and	r2, r2, #255
	and	r8, r8, r5
	orr	r2, r2, #16384
	orr	r8, r8, r4
	strh	lr, [r0, #4]	@ movhi
	strh	r2, [r1, r7]	@ movhi
	strh	r8, [r0, #2]	@ movhi
.L10:
	add	r3, r3, #24
	cmp	r3, ip
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
	.comm	dialogueBox,96,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
