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
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	ip, #1
	ldr	r0, .L4+32
	ldr	r1, .L4+36
	ldr	r2, .L4+40
	str	ip, [r0]
	str	r3, [r1]
	str	r3, [r2]
	strh	r3, [r5, #16]	@ movhi
	ldr	r2, .L4+44
	strh	r3, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+48
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+52
	mov	lr, pc
	bx	r3
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
	.word	initAlert
	.word	collisionEnabled
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	shadowOAM
	.word	initNPC
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
	push	{r4, r5, r6, lr}
	ldr	r6, .L21
	ldr	r5, .L21+4
	ldr	r3, .L21+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L21+12
	ldr	r1, [r6]
	ldr	r0, [r5]
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldr	r3, .L21+20
	ldr	r0, [r5]
	mov	lr, pc
	bx	r3
	ldr	r6, .L21+24
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L7
	ldr	r3, .L21+28
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L19
.L7:
	ldr	r3, [r4]
	ldr	r2, [r5]
	sub	r3, r3, r2
	cmp	r3, #0
	ble	.L20
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	ldr	r3, .L21+32
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L7
	ldr	r3, .L21+36
	mov	lr, pc
	bx	r3
	b	.L7
.L20:
	ldr	r3, .L21+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	vOff
	.word	hOff
	.word	updatePlayer
	.word	player
	.word	updateNPC
	.word	updateJungleAlert
	.word	checkTempleCollision
	.word	npc
	.word	sword
	.word	goToBossStage
	.word	goToCave
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
	ldr	r3, .L35
	ldm	r3, {r0, r1}
	push	{r4, r5, r6, lr}
	sub	r0, r0, #120
	ldr	r4, .L35+4
	ldr	r5, .L35+8
	sub	r1, r1, #80
	cmp	r0, #0
	str	r0, [r4]
	str	r1, [r5]
	blt	.L33
	cmp	r0, #272
	movgt	r2, #272
	movgt	r3, r2
	lslle	r3, r0, #16
	movgt	r0, r3
	strgt	r2, [r4]
	lsrle	r3, r3, #16
	cmp	r1, #0
	blt	.L34
.L27:
	cmp	r1, #352
	movgt	r2, #352
	movgt	r1, r2
	movgt	ip, r1
	lslle	ip, r1, #16
	strgt	r2, [r5]
	lsrle	ip, ip, #16
.L28:
	mov	r2, #67108864
	strh	r3, [r2, #16]	@ movhi
	strh	ip, [r2, #18]	@ movhi
	ldr	r3, .L35+12
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L35+16
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	ldr	r3, .L35+20
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L35+24
	add	r2, r3, #1000
.L30:
	strh	r1, [r3, #24]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L30
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L35+24
	ldr	r4, .L35+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L35+32
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	mov	r2, #0
	cmp	r1, #0
	mov	r3, r2
	mov	r0, r2
	str	r2, [r4]
	bge	.L27
.L34:
	mov	r2, #0
	mov	r1, r2
	mov	ip, r2
	str	r2, [r5]
	b	.L28
.L36:
	.align	2
.L35:
	.word	player
	.word	hOff
	.word	vOff
	.word	drawPlayer
	.word	drawNPC
	.word	drawAlert
	.word	shadowOAM
	.word	DMANow
	.word	waitForVBlank
	.size	drawJungleStage, .-drawJungleStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
