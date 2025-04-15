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
	.file	"alert.c"
	.text
	.align	2
	.global	initAlert
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAlert, %function
initAlert:
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
	.word	alert
	.size	initAlert, .-initAlert
	.align	2
	.global	updateAlert
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAlert, %function
updateAlert:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L9
	mov	r5, r1
	add	r1, r4, #8
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #20
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r6, r0
	ldr	r0, .L9+4
	ldr	r7, .L9+8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	subs	r3, r0, #0
	beq	.L6
	mov	r0, #1
	ldr	r2, [r4, #8]
	ldr	r3, [r4]
	ldr	r1, [r4, #4]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r2, asr r0
	sub	r3, r3, #16
	ldr	r2, .L9+12
	sub	r1, r1, #15
	sub	r6, r3, r6
	sub	r5, r1, r5
	str	r6, [r2, #8]
	str	r3, [r2]
	str	r5, [r2, #12]
	str	r1, [r2, #4]
	str	r0, [r2, #16]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L6:
	ldr	r2, .L9+12
	str	r3, [r2, #16]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	npc
	.word	player
	.word	collision
	.word	alert
	.size	updateAlert, .-updateAlert
	.align	2
	.global	drawAlert
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAlert, %function
drawAlert:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L14
	ldr	r3, [r2, #16]
	cmp	r3, #0
	beq	.L12
	ldr	r3, [r2, #8]
	lsl	r3, r3, #23
	ldrb	r0, [r2, #12]	@ zero_extendqisi2
	ldr	r1, .L14+4
	ldr	r2, .L14+8
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r2, #18]	@ movhi
	strh	r0, [r2, #16]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	bx	lr
.L12:
	mov	r2, #512
	ldr	r3, .L14+8
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L15:
	.align	2
.L14:
	.word	alert
	.word	5024
	.word	shadowOAM
	.size	drawAlert, .-drawAlert
	.comm	alert,20,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
