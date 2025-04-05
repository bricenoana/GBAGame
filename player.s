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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #140
	mov	r4, #3
	mov	r5, #40
	mov	r2, #0
	mov	r1, #10
	mov	lr, #1
	mov	r7, #16
	mov	r6, #32
	ldr	ip, .L4
	mov	r0, r4
	str	r5, [ip]
	str	r3, [ip, #4]
	str	r2, [ip, #40]
	str	r1, [ip, #32]
	ldr	r5, .L4+4
	mov	r3, #16384
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	str	r4, [ip, #28]
	str	r7, [ip, #8]
	str	r6, [ip, #12]
	str	lr, [ip, #16]
	str	lr, [ip, #20]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	DMANow
	.word	100728832
	.word	spriteNormalTiles
	.word	83886592
	.word	spriteNormalPal
	.word	hideSprites
	.word	shadowOAM
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
	ldr	r3, .L65
	ldrh	r3, [r3]
	push	{r4, lr}
	ldr	r4, .L65+4
	tst	r3, #64
	str	r2, [r4, #36]
	bne	.L8
	mov	r0, #1
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #20]
	subs	r2, r2, r1
	str	r0, [r4, #40]
	bmi	.L8
	ldr	r1, .L65+8
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L10
	ldr	r1, [r4]
	ldr	r0, .L65+12
	add	r1, r1, r2, lsl #9
	ldrb	ip, [r1, r0]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L8
	ldr	ip, [r4, #8]
	sub	r0, r0, #1
	add	r1, r1, ip
	ldrb	r1, [r1, r0]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L10
.L8:
	ands	r1, r3, #128
	bne	.L12
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #12]
	ldr	ip, [r4, #20]
	add	r2, r0, r2
	ldr	lr, .L65+16
	sub	r2, r2, #1
	add	r2, r2, ip
	cmp	r2, lr
	str	r1, [r4, #40]
	ble	.L62
.L12:
	tst	r3, #32
	bne	.L16
	mov	r0, #2
	ldr	r1, [r4]
	ldr	r2, [r4, #16]
	subs	r2, r1, r2
	str	r0, [r4, #40]
	bmi	.L16
	ldr	r1, .L65+8
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L18
	ldr	r1, [r4, #4]
	ldr	r0, .L65+12
	add	ip, r2, r1, lsl #9
	ldrb	ip, [ip, r0]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L16
	ldr	ip, [r4, #12]
	add	r1, r1, ip
	sub	r1, r1, #1
	add	r1, r2, r1, lsl #9
	ldrb	r1, [r1, r0]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L18
.L16:
	tst	r3, #16
	bne	.L20
	mov	r0, #3
	ldr	ip, [r4]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #8]
	add	r1, ip, r1
	add	r2, r1, r2
	cmp	r2, #512
	str	r0, [r4, #40]
	ble	.L63
.L20:
	and	r3, r3, #240
	cmp	r3, #240
	beq	.L23
.L64:
	mov	r2, #1
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #32]
	str	r2, [r4, #36]
	bne	.L6
	ldr	r0, [r4, #24]
	ldr	r3, .L65+20
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
.L62:
	ldr	r1, .L65+8
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L14
	ldr	r1, [r4]
	ldr	lr, .L65+12
	add	r2, r1, r2, lsl #9
	ldrb	r1, [r2, lr]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L12
	ldr	r1, [r4, #8]
	sub	lr, lr, #1
	add	r2, r2, r1
	ldrb	r2, [r2, lr]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L12
.L14:
	add	r2, r0, ip
	str	r2, [r4, #4]
	b	.L12
.L63:
	ldr	r0, .L65+8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L22
	ldr	r0, [r4, #4]
	ldr	ip, .L65+12
	sub	r2, r2, #1
	add	lr, r2, r0, lsl #9
	ldrb	lr, [lr, ip]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L20
	ldr	lr, [r4, #12]
	add	r0, r0, lr
	sub	r0, r0, #1
	add	r2, r2, r0, lsl #9
	ldrb	r2, [r2, ip]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L20
.L22:
	and	r3, r3, #240
	cmp	r3, #240
	str	r1, [r4]
	bne	.L64
.L23:
	mov	r2, #0
	mov	r3, #10
	str	r2, [r4, #24]
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L10:
	str	r2, [r4, #4]
	b	.L8
.L18:
	str	r2, [r4]
	b	.L16
.L66:
	.align	2
.L65:
	.word	buttons
	.word	player
	.word	.LANCHOR0
	.word	collisionMapBitmap
	.word	273
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
	ldr	ip, .L71
	ldr	r3, [ip]
	ldr	r2, [ip, #4]
	sub	r0, r3, r0
	str	lr, [sp, #-4]!
	ldr	r3, [ip, #40]
	ldr	lr, .L71+4
	sub	r2, r2, r1
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	and	r2, r2, #255
	orr	r0, r0, lr
	orr	r2, r2, lr
	sub	lr, r3, #1
	cmp	lr, #2
	movhi	r3, #0
	ldr	r1, .L71+8
	strh	r0, [r1, #2]	@ movhi
	ldr	r0, [ip, #24]
	strh	r2, [r1]	@ movhi
	lslls	r3, r3, #6
	ldr	r2, .L71+12
	add	r3, r3, r0
	and	r3, r2, r3, lsl #1
	strh	r3, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L72:
	.align	2
.L71:
	.word	player
	.word	-32768
	.word	shadowOAM
	.word	1022
	.size	drawPlayer, .-drawPlayer
	.global	collisionEnabled
	.comm	player,44,4
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionEnabled, %object
	.size	collisionEnabled, 4
collisionEnabled:
	.word	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
