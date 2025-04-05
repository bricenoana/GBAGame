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
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	lr, #120
	mov	r1, #32
	mov	r2, #100
	mov	ip, #80
	mov	r0, #0
	ldr	r3, .L4+20
	str	lr, [r3]
	str	ip, [r3, #4]
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
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L11+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bxne	lr
	ldr	r1, .L11+8
	ldr	r2, [r1, #16]
	subs	r2, r2, #10
	movpl	r3, r2
	str	r3, [r1, #16]
	bx	lr
.L12:
	.align	2
.L11:
	.word	oldButtons
	.word	buttons
	.word	boss
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
	push	{r4, lr}
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	mov	lr, #0
	ldr	r2, .L15+4
	ldr	r3, [r2]
	ldr	ip, .L15+8
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r1, .L15+12
	lsr	r3, r3, #23
	orr	r2, r3, ip
	orr	r0, r0, ip
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	lr, [r1, #4]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L15+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L15+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	resetSprites
	.word	boss
	.word	-32768
	.word	shadowOAM
	.word	DMANow
	.word	waitForVBlank
	.size	drawBossStage, .-drawBossStage
	.comm	boss,28,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
