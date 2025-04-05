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
	.file	"jungleStage.c"
	.text
	.align	2
	.global	initJungleStage
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initJungleStage, %function
initJungleStage:
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
	mov	r3, #5632
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+28
	ldr	r2, .L4+32
	str	r3, [r1]
	str	r3, [r2]
	strh	r3, [r5, #16]	@ movhi
	ldr	r2, .L4+36
	strh	r3, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	singleLayerJunglePal
	.word	singleLayerJungleTiles
	.word	100718592
	.word	singleLayerMapMap
	.word	initPlayer
	.word	initTemple
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	shadowOAM
	.size	initJungleStage, .-initJungleStage
	.align	2
	.global	updateJungleStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateJungleStage, %function
updateJungleStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r0, .L13+4
	ldr	r4, .L13+8
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L12
	pop	{r4, lr}
	bx	lr
.L12:
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	updatePlayer
	.word	player
	.word	checkTempleCollision
	.word	goToBossStage
	.size	updateJungleStage, .-updateJungleStage
	.align	2
	.global	drawJungleStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawJungleStage, %function
drawJungleStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	ldm	r3, {r0, r1}
	ldr	ip, .L27+4
	sub	r0, r0, #120
	ldr	r2, .L27+8
	sub	r1, r1, #80
	cmp	r0, #0
	push	{r4, lr}
	str	r0, [ip]
	str	r1, [r2]
	blt	.L25
	cmp	r0, #272
	movgt	lr, #272
	movgt	r3, lr
	lslle	r3, r0, #16
	movgt	r0, r3
	strgt	lr, [ip]
	lsrle	r3, r3, #16
	cmp	r1, #0
	blt	.L26
.L19:
	cmp	r1, #352
	movgt	lr, #352
	movgt	r1, lr
	movgt	ip, r1
	lslle	ip, r1, #16
	strgt	lr, [r2]
	lsrle	ip, ip, #16
.L20:
	mov	r2, #67108864
	strh	r3, [r2, #16]	@ movhi
	ldr	r3, .L27+12
	strh	ip, [r2, #18]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L27+16
	add	r2, r3, #1016
.L22:
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L22
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L27+16
	ldr	r4, .L27+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	mov	r0, #0
	cmp	r1, #0
	mov	r3, r0
	str	r0, [ip]
	bge	.L19
.L26:
	mov	ip, #0
	mov	r1, ip
	str	ip, [r2]
	b	.L20
.L28:
	.align	2
.L27:
	.word	player
	.word	hOff
	.word	vOff
	.word	drawPlayer
	.word	shadowOAM
	.word	DMANow
	.word	waitForVBlank
	.size	drawJungleStage, .-drawJungleStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
