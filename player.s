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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #16
	mov	r5, #40
	mov	r4, #100
	mov	lr, #3
	mov	r2, #1
	mov	ip, #0
	mov	r0, #10
	ldr	r3, .L4
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #28]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #40]
	str	r0, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L51
	ldrh	r3, [r3]
	push	{r4, lr}
	ldr	r4, .L51+4
	tst	r3, #64
	str	r2, [r4, #36]
	bne	.L8
	mov	r0, #1
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #20]
	subs	r2, r2, r1
	str	r0, [r4, #40]
	bmi	.L8
	ldr	r1, [r4]
	ldr	r0, .L51+8
	add	r1, r1, r2, lsl #9
	ldrb	ip, [r1, r0]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L46
.L8:
	ands	r1, r3, #128
	bne	.L11
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #12]
	ldr	r0, [r4, #20]
	add	r2, ip, r2
	sub	r2, r2, #1
	add	r2, r2, r0
	cmp	r2, #512
	str	r1, [r4, #40]
	blt	.L47
.L11:
	tst	r3, #32
	bne	.L14
	mov	r0, #2
	ldr	r2, [r4]
	ldr	r1, [r4, #16]
	subs	r2, r2, r1
	str	r0, [r4, #40]
	bmi	.L14
	ldr	r1, [r4, #4]
	ldr	r0, .L51+8
	add	ip, r2, r1, lsl #9
	ldrb	ip, [ip, r0]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L48
.L14:
	tst	r3, #16
	bne	.L17
	mov	r0, #3
	ldr	ip, [r4]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #8]
	add	r1, ip, r1
	add	r2, r1, r2
	cmp	r2, #512
	str	r0, [r4, #40]
	ble	.L49
.L17:
	and	r3, r3, #240
	cmp	r3, #240
	beq	.L19
.L50:
	mov	r2, #1
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #32]
	str	r2, [r4, #36]
	bne	.L6
	ldr	r0, [r4, #24]
	ldr	r3, .L51+12
	ldr	r1, [r4, #28]
	add	r0, r0, r2
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #24]
	str	r3, [r4, #32]
.L6:
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r1, [r4]
	ldr	lr, .L51+8
	add	r2, r1, r2, lsl #9
	ldrb	r1, [r2, lr]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L11
	ldr	r1, [r4, #8]
	sub	lr, lr, #1
	add	r2, r2, r1
	ldrb	r2, [r2, lr]	@ zero_extendqisi2
	cmp	r2, #0
	addne	r2, ip, r0
	strne	r2, [r4, #4]
	b	.L11
.L49:
	ldr	r0, [r4, #4]
	ldr	ip, .L51+8
	sub	r2, r2, #1
	add	lr, r2, r0, lsl #9
	ldrb	lr, [lr, ip]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L17
	ldr	lr, [r4, #12]
	add	r0, r0, lr
	sub	r0, r0, #1
	add	r2, r2, r0, lsl #9
	ldrb	r2, [r2, ip]	@ zero_extendqisi2
	and	r3, r3, #240
	cmp	r2, #0
	strne	r1, [r4]
	cmp	r3, #240
	bne	.L50
.L19:
	mov	r2, #0
	mov	r3, #10
	str	r2, [r4, #24]
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L46:
	ldr	ip, [r4, #8]
	sub	r0, r0, #1
	add	r1, r1, ip
	ldrb	r1, [r1, r0]	@ zero_extendqisi2
	cmp	r1, #0
	strne	r2, [r4, #4]
	b	.L8
.L48:
	ldr	ip, [r4, #12]
	add	r1, r1, ip
	sub	r1, r1, #1
	add	r1, r2, r1, lsl #9
	ldrb	r1, [r1, r0]	@ zero_extendqisi2
	cmp	r1, #0
	strne	r2, [r4]
	b	.L14
.L52:
	.align	2
.L51:
	.word	buttons
	.word	player
	.word	boofCollisionMapBitmap
	.word	__aeabi_idivmod
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L55
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	sub	lr, r3, #120
	sub	ip, r2, #80
	cmp	lr, #272
	movge	lr, #272
	cmp	ip, #352
	movge	ip, #352
	mov	r5, #67108864
	sub	r0, r3, r0
	sub	r2, r2, r1
	ldr	r3, [r4, #40]
	ldr	r1, [r4, #24]
	ldr	r6, .L55+4
	add	r1, r3, r1, lsl #6
	bic	lr, lr, lr, asr #31
	ldr	r3, .L55+8
	bic	ip, ip, ip, asr #31
	lsl	r0, r0, #23
	ldr	r4, .L55+12
	lsl	lr, lr, #16
	and	r2, r2, #255
	lsl	ip, ip, #16
	lsr	r0, r0, #23
	lsr	lr, lr, #16
	orr	r0, r0, r6
	and	r3, r3, r1, lsl #1
	lsr	ip, ip, #16
	orr	r2, r2, r6
	strh	r2, [r4]	@ movhi
	strh	lr, [r5, #16]	@ movhi
	ldr	r2, .L55+16
	strh	ip, [r5, #18]	@ movhi
	strh	r0, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L55+20
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	player
	.word	-32768
	.word	1022
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.size	drawPlayer, .-drawPlayer
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
