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
	.file	"caveStage.c"
	.text
	.align	2
	.global	initCaveStage
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCaveStage, %function
initCaveStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #4352
	mov	r5, #67108864
	mov	r2, #23296
	ldr	r4, .L4
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #16
	ldr	r0, .L4+24
	ldr	r2, .L4+28
	str	r3, [r0]
	ldr	ip, .L4+32
	ldr	r0, .L4+36
	str	r1, [r2]
	str	r3, [ip]
	str	r3, [r0]
	strh	r3, [r5, #16]	@ movhi
	ldr	r0, .L4+40
	strh	r3, [r5, #18]	@ movhi
	str	r1, [r2, #4]
	mov	lr, pc
	bx	r0
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	backgroundCaveTilesPal
	.word	backgroundCaveTilesTiles
	.word	100718592
	.word	backgroundCaveMapMap
	.word	initPlayer
	.word	collisionEnabled
	.word	player
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	shadowOAM
	.size	initCaveStage, .-initCaveStage
	.align	2
	.global	updateCaveStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCaveStage, %function
updateCaveStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	updatePlayer
	.size	updateCaveStage, .-updateCaveStage
	.align	2
	.global	drawCaveStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCaveStage, %function
drawCaveStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldm	r3, {r0, r1}
	ldr	ip, .L22+4
	sub	r0, r0, #120
	ldr	r2, .L22+8
	sub	r1, r1, #80
	cmp	r0, #0
	push	{r4, lr}
	str	r0, [ip]
	str	r1, [r2]
	blt	.L20
	cmp	r0, #272
	movgt	lr, #272
	movgt	r3, lr
	lslle	r3, r0, #16
	movgt	r0, r3
	strgt	lr, [ip]
	lsrle	r3, r3, #16
	cmp	r1, #0
	blt	.L21
.L14:
	cmp	r1, #352
	movgt	lr, #352
	movgt	r1, lr
	movgt	ip, r1
	lslle	ip, r1, #16
	strgt	lr, [r2]
	lsrle	ip, ip, #16
.L15:
	mov	r2, #67108864
	strh	r3, [r2, #16]	@ movhi
	ldr	r3, .L22+12
	strh	ip, [r2, #18]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L22+16
	add	r2, r3, #1016
.L17:
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L17
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L22+16
	ldr	r4, .L22+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	mov	r0, #0
	cmp	r1, #0
	mov	r3, r0
	str	r0, [ip]
	bge	.L14
.L21:
	mov	ip, #0
	mov	r1, ip
	str	ip, [r2]
	b	.L15
.L23:
	.align	2
.L22:
	.word	player
	.word	hOff
	.word	vOff
	.word	drawPlayer
	.word	shadowOAM
	.word	DMANow
	.word	waitForVBlank
	.size	drawCaveStage, .-drawCaveStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
