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
	.file	"BossStage.c"
	.text
	.align	2
	.global	initBossStage
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBossStage, %function
initBossStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #6912
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
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
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	ip, #16
	mov	r0, #0
	mov	r4, #120
	mov	lr, #80
	mov	r1, #32
	mov	r2, #100
	ldr	r3, .L4+24
	str	ip, [r3]
	str	ip, [r3, #4]
	ldr	r3, .L4+28
	str	r0, [r3]
	ldr	r3, .L4+32
	stm	r3, {r4, lr}
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	singleLayerJunglePal
	.word	singleLayerJungleTiles
	.word	100718592
	.word	bossBGTestMap
	.word	initPlayer
	.word	player
	.word	collisionEnabled
	.word	boss
	.size	initBossStage, .-initBossStage
	.align	2
	.global	updateBossStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBossStage, %function
updateBossStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	ldr	r1, [r3]
	cmp	r1, #0
	movlt	r2, #0
	movlt	r1, r2
	strlt	r2, [r3]
	ldr	r2, [r3, #8]
	rsb	r2, r2, #240
	cmp	r2, r1
	ldr	r1, [r3, #4]
	strlt	r2, [r3]
	cmp	r1, #0
	movlt	r2, #0
	movlt	r1, r2
	strlt	r2, [r3, #4]
	ldr	r2, [r3, #12]
	rsb	r2, r2, #160
	cmp	r2, r1
	strlt	r2, [r3, #4]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	updatePlayer
	.word	player
	.size	updateBossStage, .-updateBossStage
	.align	2
	.global	drawBossStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBossStage, %function
drawBossStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r3, #67108864
	push	{r4, lr}
	mov	r0, r1
	strh	r1, [r3, #16]	@ movhi
	ldr	r2, .L18
	strh	r1, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, #512
	ldr	r3, .L18+4
	add	r2, r3, #1016
.L15:
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L15
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L18+4
	ldr	r4, .L18+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	drawPlayer
	.word	shadowOAM
	.word	DMANow
	.word	waitForVBlank
	.size	drawBossStage, .-drawBossStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	boss,28,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
