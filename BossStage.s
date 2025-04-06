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
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	lr, #200
	mov	ip, #100
	ldr	r1, .L4+36
	ldr	r2, .L4+40
	ldr	r0, .L4+44
	str	lr, [r1]
	str	ip, [r1, #4]
	str	r3, [r0]
	str	r3, [r2]
	str	r3, [r2, #4]
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
	.word	initSlash
	.word	player
	.word	.LANCHOR0
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L37
	sub	sp, sp, #16
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
	movlt	r0, r3
	strlt	r3, [r4]
	cmp	r1, #0
	movlt	r3, #0
	movlt	r1, r3
	strlt	r3, [r4, #4]
	ldr	r3, [r4, #12]
	ldr	r5, .L37+20
	rsb	ip, r3, #160
	cmp	ip, r1
	movlt	r1, ip
	strlt	ip, [r4, #4]
	add	ip, r5, #8
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	ldr	r8, .L37+24
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L12
	ldr	r3, [r4, #44]
	sub	r3, r3, #20
	cmp	r3, #0
	strgt	r3, [r4, #44]
	ble	.L34
.L12:
	ldr	r3, [r5, #24]
	ldr	r6, .L37+28
	cmp	r3, #0
	streq	r3, [r6, #8]
	beq	.L17
	ldr	r3, [r6, #8]
	cmp	r3, #0
	moveq	r3, #30
	streq	r3, [r6, #8]
	bne	.L35
.L17:
	ldr	r3, .L37+32
	ldrh	r3, [r3]
	ldr	r7, .L37+36
	tst	r3, #1
	ldr	r3, [r7, #16]
	beq	.L18
	ldr	r2, .L37+40
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L18
	cmp	r3, #0
	mov	r2, #1
	mov	r1, #20
	movne	r3, #19
	str	r1, [r6, #4]
	str	r2, [r6]
	strne	r3, [r6, #4]
	bne	.L20
	mvn	r0, #1
	mov	r1, #19
	str	r2, [r7, #16]
	str	r3, [r7, #12]
	ldm	r4, {r2, r3}
	stm	r7, {r2, r3}
	str	r0, [r7, #8]
	str	r1, [r6, #4]
.L20:
	mov	r3, #16
	ldmib	r5, {r0, ip, lr}
	ldr	r1, [r5]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	ldm	r7, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L6
	mov	r2, #0
	ldr	r3, [r5, #16]
	sub	r3, r3, #10
	cmp	r3, r2
	str	r3, [r5, #16]
	movle	r3, #1
	str	r2, [r7, #16]
	strle	r2, [r5, #16]
	strle	r3, [r5, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L18:
	ldr	r2, [r6]
	cmp	r2, #0
	bne	.L36
.L21:
	cmp	r3, #0
	bne	.L20
.L6:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L36:
	ldr	r2, [r6, #4]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r6, #4]
	movle	r2, #0
	strle	r2, [r6]
	b	.L21
.L35:
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #8]
	bgt	.L17
	ldr	r3, .L37+44
	mov	lr, pc
	bx	r3
	b	.L17
.L34:
	mov	r2, #0
	ldr	r3, .L37+48
	str	r2, [r4, #44]
	mov	lr, pc
	bx	r3
	b	.L12
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
	mov	r2, #0
	mov	r3, #67108864
	ldr	r1, .L48
	ldr	r1, [r1]
	cmp	r1, r2
	push	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	beq	.L43
	ldr	r2, .L48+4
	ldr	r3, [r2]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r1, #640
	mvn	r3, r3, lsr #17
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	ldr	r2, .L48+8
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L44:
	ldr	r3, .L48+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+16
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r3, .L48+20
	mov	r0, r1
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L48+8
	add	r2, r3, #944
.L45:
	strh	r1, [r3, #80]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L45
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+8
	ldr	r4, .L48+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L43:
	mov	r0, r1
	ldr	r3, .L48+32
	mov	lr, pc
	bx	r3
	b	.L44
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.word	player
	.word	shadowOAM
	.word	drawBoss
	.word	drawFireballs
	.word	drawSlash
	.word	DMANow
	.word	waitForVBlank
	.word	drawPlayer
	.size	drawBossStage, .-drawBossStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	playerSlashActive, %object
	.size	playerSlashActive, 4
playerSlashActive:
	.space	4
	.type	playerSlashTimer, %object
	.size	playerSlashTimer, 4
playerSlashTimer:
	.space	4
	.type	winDelay.4145, %object
	.size	winDelay.4145, 4
winDelay.4145:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
