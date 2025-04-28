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
	.global	updateJungleAlert
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateJungleAlert, %function
updateJungleAlert:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L14
	mov	r6, r1
	add	r1, r4, #8
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #20
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r7, r0
	ldr	r0, .L14+4
	ldr	r5, .L14+8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r5
	subs	r5, r0, #0
	beq	.L6
	mov	r0, #1
	ldr	r2, [r4, #8]
	ldr	r3, [r4]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r2, asr r0
	ldr	r2, .L14+12
	ldrh	r1, [r2]
	tst	r1, #1
	ldr	r1, [r4, #4]
	ldr	r2, .L14+16
	sub	r3, r3, #16
	sub	r1, r1, #15
	sub	r7, r3, r7
	sub	r6, r1, r6
	str	r7, [r2, #8]
	str	r3, [r2]
	str	r6, [r2, #12]
	str	r1, [r2, #4]
	str	r0, [r2, #16]
	beq	.L5
	ldr	r3, .L14+20
	ldrh	r3, [r3]
	ands	r3, r3, r0
	streq	r0, [r4, #28]
	streq	r3, [r2, #16]
.L5:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L6:
	ldr	r4, .L14+24
	ldr	r2, [r4]
	ldr	r3, .L14+16
	cmp	r2, #0
	str	r5, [r3, #16]
	beq	.L5
	ldr	r3, .L14+28
	mov	lr, pc
	bx	r3
	str	r5, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	npc
	.word	player
	.word	collision
	.word	oldButtons
	.word	alert
	.word	buttons
	.word	.LANCHOR0
	.word	eraseText
	.size	updateJungleAlert, .-updateJungleAlert
	.align	2
	.global	updateCaveAlert
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCaveAlert, %function
updateCaveAlert:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L30
	mov	r6, r1
	add	r1, r4, #8
	ldm	r1, {r1, r5}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #20
	str	r5, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r7, r0
	ldr	r0, .L30+4
	ldr	r5, .L30+8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L17
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L28
.L17:
	mov	r5, #0
	ldr	r4, .L30+12
	ldr	r2, [r4]
	ldr	r3, .L30+16
	cmp	r2, r5
	str	r5, [r3, #16]
	bne	.L29
.L16:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L28:
	mov	r0, #1
	ldr	r3, .L30+20
	ldrh	r1, [r3]
	ldr	r2, [r4, #4]
	tst	r1, #1
	ldr	r1, [r4]
	ldr	r3, .L30+16
	sub	r2, r2, #14
	sub	ip, r2, r6
	sub	lr, r1, r7
	stm	r3, {r1, r2, lr}
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	beq	.L16
	ldr	r2, .L30+24
	ldrh	r2, [r2]
	ands	r2, r2, r0
	streq	r0, [r4, #20]
	streq	r2, [r3, #16]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L29:
	ldr	r3, .L30+28
	mov	lr, pc
	bx	r3
	str	r5, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	sword
	.word	player
	.word	collision
	.word	.LANCHOR0
	.word	alert
	.word	oldButtons
	.word	buttons
	.word	eraseText
	.size	updateCaveAlert, .-updateCaveAlert
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
	ldr	r2, .L35
	ldr	r3, [r2, #16]
	cmp	r3, #0
	beq	.L33
	ldr	r3, [r2, #8]
	lsl	r3, r3, #23
	ldrb	r0, [r2, #12]	@ zero_extendqisi2
	ldr	r1, .L35+4
	ldr	r2, .L35+8
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r2, #26]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	bx	lr
.L33:
	mov	r2, #512
	ldr	r3, .L35+8
	strh	r2, [r3, #24]	@ movhi
	bx	lr
.L36:
	.align	2
.L35:
	.word	alert
	.word	5024
	.word	shadowOAM
	.size	drawAlert, .-drawAlert
	.comm	alert,20,4
	.comm	shadowOAM,1024,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	showingDialogue, %object
	.size	showingDialogue, 4
showingDialogue:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
