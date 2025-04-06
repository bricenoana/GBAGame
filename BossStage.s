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
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	ip, #200
	mov	r0, #100
	mov	r1, #0
	ldr	r3, .L4+32
	ldr	r2, .L4+36
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r2]
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
	.word	initBoss
	.word	initFireballs
	.word	player
	.word	collisionEnabled
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
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L37
	sub	sp, sp, #20
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L37+8
	ldr	r3, .L37+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+16
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	cmp	r0, #0
	movlt	r3, #0
	movlt	r0, r3
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #4]
	strlt	r3, [r4]
	rsb	r3, r2, #240
	cmp	r3, r0
	strlt	r3, [r4]
	movlt	r0, r3
	cmp	r1, #0
	movlt	r3, #0
	movlt	r1, r3
	strlt	r3, [r4, #4]
	ldr	r3, [r4, #12]
	ldr	r5, .L37+20
	rsb	ip, r3, #160
	cmp	ip, r1
	strlt	ip, [r4, #4]
	movlt	r1, ip
	add	ip, r5, #8
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	ldr	r7, .L37+24
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L12
	ldr	r3, [r4, #44]
	sub	r3, r3, #20
	cmp	r3, #0
	strgt	r3, [r4, #44]
	ble	.L33
.L12:
	ldr	r3, [r5, #24]
	ldr	r2, .L37+28
	cmp	r3, #0
	streq	r3, [r2]
	beq	.L17
	ldr	r3, [r2]
	cmp	r3, #0
	moveq	r3, #30
	streq	r3, [r2]
	bne	.L34
.L17:
	ldr	r3, .L37+32
	ldrh	r3, [r3]
	ldr	r6, .L37+36
	tst	r3, #1
	ldr	r3, [r6, #16]
	beq	.L18
	ldr	r2, .L37+40
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L35
.L18:
	cmp	r3, #0
	bne	.L32
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L35:
	cmp	r3, #0
	beq	.L36
.L32:
	ldm	r6, {r0, r1}
.L24:
	mov	r3, #16
	ldr	ip, [r5, #8]
	ldr	r4, [r5, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	mov	r2, r3
	stm	sp, {ip, lr}
	str	r4, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L6
	mov	r2, #0
	ldr	r3, [r5, #16]
	sub	r3, r3, #10
	cmp	r3, r2
	str	r3, [r5, #16]
	movle	r3, #1
	str	r2, [r6, #16]
	strle	r2, [r5, #16]
	strle	r3, [r5, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L34:
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	bgt	.L17
	ldr	r3, .L37+44
	mov	lr, pc
	bx	r3
	b	.L17
.L33:
	mov	r2, #0
	ldr	r3, .L37+48
	str	r2, [r4, #44]
	mov	lr, pc
	bx	r3
	b	.L12
.L36:
	mov	r1, #1
	mvn	r2, #1
	str	r1, [r6, #16]
	ldm	r4, {r0, r1}
	str	r3, [r6, #12]
	stm	r6, {r0, r1, r2}
	b	.L24
.L38:
	.align	2
.L37:
	.word	updatePlayer
	.word	updateBoss
	.word	player
	.word	updateFireballs
	.word	updateSlash
	.word	boss
	.word	collision
	.word	.LANCHOR0
	.word	oldButtons
	.word	slash
	.word	buttons
	.word	goToWin
	.word	goToLose
	.size	updateBossStage, .-updateBossStage
	.align	2
	.global	drawSwordSlash
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSwordSlash, %function
drawSwordSlash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L40
	ldr	r3, [r2]
	sub	r0, r3, r0
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	mvn	r0, r0, lsl #17
	mov	ip, #640
	mvn	r0, r0, lsr #17
	ldr	r3, [r2, #4]
	ldr	r2, .L40+4
	sub	r3, r3, r1
	and	r3, r3, #255
	strh	r0, [r2, #2]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	bx	lr
.L41:
	.align	2
.L40:
	.word	player
	.word	shadowOAM
	.size	drawSwordSlash, .-drawSwordSlash
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
	mov	r3, #67108864
	mov	r4, #0
	ldr	r2, .L46
	mov	r1, r4
	mov	r0, r4
	strh	r4, [r3, #16]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L46+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+8
	mov	lr, pc
	bx	r3
	mov	r1, r4
	ldr	r3, .L46+12
	mov	r0, r4
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L46+16
	add	r2, r3, #952
.L43:
	strh	r1, [r3, #72]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L43
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L46+16
	ldr	r4, .L46+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	drawPlayer
	.word	drawBoss
	.word	drawFireballs
	.word	drawSlash
	.word	shadowOAM
	.word	DMANow
	.word	waitForVBlank
	.size	drawBossStage, .-drawBossStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	winDelay.4147, %object
	.size	winDelay.4147, 4
winDelay.4147:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
