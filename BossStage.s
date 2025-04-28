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
	push	{r4, r5, r6, lr}
	ldr	r4, .L4
	strh	r3, [r2]	@ movhi
	ldr	r5, .L4+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	ldr	r6, [r4, #64]
	mov	lr, pc
	bx	r5
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	str	r6, [r4, #64]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	ip, #200
	mov	r0, #100
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	str	ip, [r4]
	str	r0, [r4, #4]
	str	r3, [r1]
	str	r3, [r2]
	str	r3, [r2, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	DMANow
	.word	bossBGTilesPal
	.word	bossBGTilesTiles
	.word	100718592
	.word	bossBGTestMap
	.word	initPlayer
	.word	hideSprites
	.word	initBoss
	.word	initFireballs
	.word	initSlashes
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
	ldr	r3, .L48
	sub	sp, sp, #16
	mov	lr, pc
	bx	r3
	ldr	r4, .L48+4
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ble	.L7
	sub	r3, r3, #1
	tst	r3, #1
	movne	r2, #31
	str	r3, [r4, #56]
	ldrheq	r2, [r4, #60]
	ldr	r3, .L48+16
	strh	r2, [r3, #8]	@ movhi
.L7:
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
	ldr	r5, .L48+20
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
	ldr	r7, .L48+24
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L14
	ldr	r3, [r4, #44]
	sub	r3, r3, #20
	cmp	r3, #0
	strgt	r3, [r4, #44]
	ble	.L42
.L14:
	ldr	r3, [r5, #24]
	ldr	r6, .L48+28
	cmp	r3, #0
	streq	r3, [r6, #8]
	beq	.L19
	ldr	r3, [r6, #8]
	cmp	r3, #0
	moveq	r3, #30
	streq	r3, [r6, #8]
	bne	.L43
.L19:
	ldr	r3, .L48+32
	ldrh	r3, [r3]
	ldr	r8, .L48+36
	tst	r3, #1
	ldrh	r2, [r8]
	ldr	r3, [r6]
	beq	.L20
	tst	r2, #1
	beq	.L44
.L20:
	cmp	r3, #0
	bne	.L21
.L22:
	and	r2, r2, #2
	cmp	r2, #0
	moveq	r2, #1
	movne	r2, #0
	ldr	r3, .L48+40
	str	r2, [r3]
	bne	.L45
.L23:
	ldr	r4, .L48+44
	ldr	r8, .L48+48
	add	r6, r4, #60
.L27:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L46
.L25:
	add	r4, r4, #20
	cmp	r6, r4
	bne	.L27
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L46:
	mov	r3, #16
	ldmib	r5, {r0, ip, lr}
	ldr	r1, [r5]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L25
	ldr	r3, [r5, #16]
	mov	r0, #4
	sub	r3, r3, #10
	str	r3, [r5, #16]
	mov	lr, pc
	bx	r8
	mov	r3, #0
	ldr	r2, [r5, #16]
	cmp	r2, r3
	movle	r2, #1
	str	r3, [r4, #16]
	strle	r3, [r5, #16]
	strle	r2, [r5, #24]
	b	.L25
.L44:
	cmp	r3, #0
	beq	.L47
.L21:
	ldr	r3, [r6, #4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #4]
	movle	r3, #0
	strle	r3, [r6]
	b	.L22
.L43:
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #8]
	bgt	.L19
	ldr	r3, .L48+52
	mov	lr, pc
	bx	r3
	b	.L19
.L45:
	ldr	r3, .L48+56
	mov	lr, pc
	bx	r3
	b	.L23
.L42:
	mov	r2, #0
	ldr	r3, .L48+60
	str	r2, [r4, #44]
	mov	lr, pc
	bx	r3
	b	.L14
.L47:
	mov	lr, #1
	mov	ip, #20
	mvn	r2, #1
	ldm	r4, {r0, r1}
	ldr	r4, .L48+64
	str	lr, [r6]
	str	ip, [r6, #4]
	mov	lr, pc
	bx	r4
	ldrh	r2, [r8]
	ldr	r3, [r6]
	b	.L20
.L49:
	.align	2
.L48:
	.word	updateBoss
	.word	player
	.word	updateFireballs
	.word	updateSlashes
	.word	83886592
	.word	boss
	.word	collision
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	playerBlockActive
	.word	slashes
	.word	playAnalogSound
	.word	goToWin
	.word	updatePlayer
	.word	goToLose
	.word	spawnSlash
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
	ldr	r2, .L51
	ldr	r3, [r2]
	sub	r0, r3, r0
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	mvn	r0, r0, lsl #17
	mov	ip, #640
	mvn	r0, r0, lsr #17
	ldr	r3, [r2, #4]
	ldr	r2, .L51+4
	sub	r3, r3, r1
	and	r3, r3, #255
	strh	r0, [r2, #2]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
	.word	player
	.word	shadowOAM
	.size	drawSwordSlash, .-drawSwordSlash
	.align	2
	.global	drawBlockFrame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlockFrame, %function
drawBlockFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #6
	ldr	ip, .L55
	ldr	r3, [ip]
	ldr	r2, [ip, #4]
	sub	r0, r3, r0
	sub	r2, r2, r1
	lsl	r0, r0, #23
	ldr	r1, .L55+4
	ldr	r3, .L55+8
	lsr	r0, r0, #23
	and	r2, r2, #255
	orr	r0, r0, r1
	orr	r2, r2, r1
	strh	lr, [r3, #4]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L56:
	.align	2
.L55:
	.word	player
	.word	-32768
	.word	shadowOAM
	.size	drawBlockFrame, .-drawBlockFrame
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
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r4, #0
	ldr	r2, .L75
	strh	r4, [r3, #16]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r5, #512
	mov	r2, r4
	mov	r3, #222
	mov	r4, #2
	ldr	ip, .L75+4
	ldr	r1, [ip, #44]
	ldr	r0, .L75+8
	add	r1, r1, #19
	smull	r6, lr, r0, r1
	asr	r0, r1, #31
	ldr	r6, .L75+12
	ldr	r1, .L75+16
	rsb	r0, r0, lr, asr #3
.L60:
	cmp	r0, r2
	orr	lr, r3, #16384
	add	r2, r2, #1
	sub	r3, r3, #16
	strhgt	r4, [r1]	@ movhi
	strhgt	lr, [r1, #2]	@ movhi
	strhgt	r6, [r1, #4]	@ movhi
	strhle	r5, [r1]	@ movhi
	lsl	r3, r3, #16
	cmp	r2, #5
	lsr	r3, r3, #16
	add	r1, r1, #8
	bne	.L60
	ldr	r3, .L75+20
	ldr	r3, [r3, #16]
	cmp	r3, #100
	ldrle	r0, .L75+8
	addle	r3, r3, #9
	smullle	r2, r0, r3, r0
	asrle	r3, r3, #31
	rsble	r0, r3, r0, asr #2
	movgt	r0, #10
	mov	r3, #2
	mov	r1, #0
	mov	r6, #512
	mov	r5, #142
	mov	r4, #776
	ldr	r2, .L75+24
.L64:
	cmp	r0, r1
	orr	lr, r3, #16384
	add	r1, r1, #1
	add	r3, r3, #16
	strhgt	r5, [r2]	@ movhi
	strhgt	lr, [r2, #2]	@ movhi
	strhgt	r4, [r2, #4]	@ movhi
	strhle	r6, [r2]	@ movhi
	lsl	r3, r3, #16
	cmp	r1, #10
	lsr	r3, r3, #16
	add	r2, r2, #8
	bne	.L64
	ldr	r3, .L75+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L65
	ldr	r3, .L75+32
	ldr	r1, [r3, #16]
	ldr	r2, [r3, #36]
	ldr	r3, [r3, #56]
	orr	r1, r1, r2
	orrs	r1, r1, r3
	bne	.L74
	mov	r0, r1
	ldr	r3, .L75+36
	mov	lr, pc
	bx	r3
	b	.L68
.L65:
	mov	lr, #6
	ldr	r3, [ip]
	ldr	r0, .L75+40
	ldrb	r1, [ip, #4]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L75+44
	lsr	r3, r3, #23
	orr	r3, r3, r0
	orr	r1, r1, r0
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	lr, [r2, #4]	@ movhi
.L68:
	ldr	r3, .L75+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+52
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r3, .L75+56
	mov	r0, r1
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+60
	mov	lr, pc
	bx	r3
	ldr	r4, .L75+64
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L75+44
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	ldr	r3, [ip]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r1, #640
	mvn	r3, r3, lsr #17
	ldr	r2, .L75+44
	ldrb	r0, [ip, #4]	@ zero_extendqisi2
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	b	.L68
.L76:
	.align	2
.L75:
	.word	hideSprites
	.word	player
	.word	1717986919
	.word	774
	.word	shadowOAM+960
	.word	boss
	.word	shadowOAM+880
	.word	playerBlockActive
	.word	slashes
	.word	drawPlayer
	.word	-32768
	.word	shadowOAM
	.word	drawBoss
	.word	drawFireballs
	.word	drawSlashes
	.word	waitForVBlank
	.word	DMANow
	.size	drawBossStage, .-drawBossStage
	.comm	playerBlockActive,4,4
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
	.type	winDelay.4162, %object
	.size	winDelay.4162, 4
winDelay.4162:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
