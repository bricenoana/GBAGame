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
	mov	r3, #4608
	mov	r6, #67108864
	mov	r4, #0
	ldr	r2, .L6
	ldr	r5, .L6+4
	strh	r3, [r6]	@ movhi
	mov	r0, #3
	mov	r3, #256
	strh	r2, [r6, #10]	@ movhi
	ldr	r1, .L6+8
	mov	r2, #83886080
	mov	lr, pc
	bx	r5
	mov	r3, #5632
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L6+12
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L6+16
	ldr	r1, .L6+20
	mov	lr, pc
	bx	r5
	ldr	r2, .L6+24
	mov	r3, #3584
	strh	r2, [r6, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L6+28
	strh	r4, [r6, #16]	@ movhi
	ldr	r1, .L6+32
	strh	r4, [r6, #18]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r3, #256
	ldr	r1, .L6+36
	mov	r0, #3
	ldr	r2, .L6+40
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r1, .L6+44
.L2:
	lsl	r2, r3, #1
	add	r3, r3, #1
	cmp	r3, #1024
	strh	r4, [r1, r2]	@ movhi
	bne	.L2
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L6+48
	ldr	r1, .L6+52
	mov	lr, pc
	bx	r5
	ldr	r2, .L6+56
	ldr	r1, .L6+60
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L6+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+76
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+84
	mov	lr, pc
	bx	r3
	mov	r1, #1
	mov	r3, #67108864
	ldr	r2, .L6+88
	ldr	ip, .L6+92
	str	r1, [r2]
	ldr	r0, .L6+96
	ldr	r2, .L6+100
	ldr	r1, .L6+104
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r2]
	strh	r4, [r3, #20]	@ movhi
	ldr	r2, .L6+108
	strh	r4, [r3, #22]	@ movhi
	str	r4, [r1, #64]
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L6+112
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	23297
	.word	DMANow
	.word	singleLayerJunglePal
	.word	singleLayerJungleTiles
	.word	100718592
	.word	singleLayerMapMap
	.word	2568
	.word	100696064
	.word	textTilesTiles
	.word	textTilesPal
	.word	83886112
	.word	100683776
	.word	100728832
	.word	spriteNormalTiles
	.word	83886592
	.word	spriteNormalPal
	.word	initPlayer
	.word	initTemple
	.word	initAlert
	.word	initNPC
	.word	initBoxes
	.word	boxInactive
	.word	collisionEnabled
	.word	textState
	.word	vOff
	.word	hOff
	.word	player
	.word	hideSprites
	.word	shadowOAM
	.size	initJungleStage, .-initJungleStage
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"JUAN: HI THERE!\000"
	.align	2
.LC1:
	.ascii	"I SAW AN ALEBRIJE FLY BY...\000"
	.align	2
.LC2:
	.ascii	"THAT COULD ONLY MEAN TROUBLE\000"
	.align	2
.LC3:
	.ascii	"TAKE THIS SHIELD WITH YOU\000"
	.align	2
.LC4:
	.ascii	"USE IT TO PROTECT YOURSELF\000"
	.align	2
.LC5:
	.ascii	"!YOU HAVE RECEIVED A SHIELD!\000"
	.text
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
	ldr	r6, .L45
	ldr	r5, .L45+4
	sub	sp, sp, #16
	ldr	r3, .L45+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+12
	ldr	r1, [r6]
	ldr	r0, [r5]
	ldr	r3, .L45+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+20
	ldr	r1, [r6]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #64]
	cmp	r3, #0
	bne	.L40
	ldr	r3, .L45+24
	ldrh	r3, [r3]
	tst	r3, #768
	ldm	r4, {r0, r1}
	beq	.L41
.L10:
	ldr	r5, .L45+28
	ldr	r3, [r5]
	cmp	r3, #0
	moveq	r2, #67108864
	ldrheq	r3, [r2]
	orreq	r3, r3, #256
	strheq	r3, [r2]	@ movhi
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r6, .L45+32
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L14
	ldr	r3, .L45+36
	ldr	r3, [r3, #20]
	cmp	r3, #1
	beq	.L42
.L14:
	ldr	r3, [r5]
	cmp	r3, #0
	bgt	.L43
.L16:
	ldr	r3, .L45+40
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L8
	ldr	r3, .L45+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L44
.L8:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	subs	r2, r0, #165
	rsbmi	r2, r0, #165
	subs	r3, r1, #15
	rsbmi	r3, r1, #15
	cmp	r2, #15
	cmple	r3, #15
	bgt	.L10
	mov	r2, #1
	mov	r0, #9
	ldr	r3, .L45+44
	str	r2, [r4, #64]
	mov	lr, pc
	bx	r3
.L40:
	ldm	r4, {r0, r1}
	b	.L10
.L43:
	ldr	r3, .L45+48
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r6, .L45+52
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	subs	r6, r0, #0
	bne	.L16
	mov	r2, #67108864
	ldr	r3, .L45+56
	ldrh	r1, [r2]
	and	r3, r3, r1
	strh	r3, [r2]	@ movhi
	ldr	r3, .L45+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+64
	mov	lr, pc
	bx	r3
	str	r6, [r5]
	b	.L16
.L42:
	ldr	r3, .L45+48
	ldr	r3, [r3, #28]
	cmp	r3, #1
	bne	.L14
	ldr	r3, .L45+68
	mov	lr, pc
	bx	r3
	b	.L14
.L44:
	ldr	r3, .L45+48
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r4, {r0, r1, r2, r3}
	ldr	r4, .L45+52
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L8
	ldr	r4, .L45+64
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+72
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L21
.L23:
	.word	.L28
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L24
	.word	.L22
.L22:
	ldr	r3, .L45+76
	ldr	r1, .L45+80
	ldr	r0, .L45+84
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r3, r3, #1
.L29:
	str	r3, [r5]
	b	.L8
.L24:
	ldr	r3, .L45+76
	ldr	r1, .L45+80
	ldr	r0, .L45+88
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r3, r3, #1
	b	.L29
.L25:
	ldr	r3, .L45+76
	ldr	r1, .L45+80
	ldr	r0, .L45+92
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r3, r3, #1
	b	.L29
.L26:
	ldr	r3, .L45+76
	ldr	r1, .L45+80
	ldr	r0, .L45+96
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r3, r3, #1
	b	.L29
.L27:
	ldr	r3, .L45+76
	ldr	r1, .L45+80
	ldr	r0, .L45+100
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r3, r3, #1
	b	.L29
.L28:
	ldr	r3, .L45+76
	ldr	r1, .L45+80
	ldr	r0, .L45+104
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r3, r3, #1
	b	.L29
.L21:
	mov	r2, #67108864
	ldr	r3, .L45+56
	ldrh	r1, [r2]
	and	r3, r3, r1
	strh	r3, [r2]	@ movhi
	ldr	r3, .L45+60
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	b	.L29
.L46:
	.align	2
.L45:
	.word	vOff
	.word	hOff
	.word	updatePlayer
	.word	player
	.word	updateNPC
	.word	updateJungleAlert
	.word	buttons
	.word	textState
	.word	checkTempleCollision
	.word	sword
	.word	oldButtons
	.word	playAnalogSound
	.word	npc
	.word	collision
	.word	65279
	.word	boxInactive
	.word	eraseText
	.word	goToBossStage
	.word	boxActive
	.word	textToTile
	.word	513
	.word	.LC5
	.word	.LC4
	.word	.LC3
	.word	.LC2
	.word	.LC1
	.word	.LC0
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
	ldr	r3, .L60
	ldm	r3, {r2, r3}
	push	{r4, r5, r6, lr}
	sub	r2, r2, #120
	ldr	r4, .L60+4
	cmp	r2, #0
	str	r2, [r4]
	movlt	r2, #0
	ldr	r5, .L60+8
	sub	r3, r3, #80
	str	r3, [r5]
	strlt	r2, [r4]
	blt	.L49
	cmp	r2, #272
	movgt	r1, #272
	movgt	r2, r1
	lslle	r2, r2, #16
	strgt	r1, [r4]
	lsrle	r2, r2, #16
.L49:
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r5]
	blt	.L52
	cmp	r3, #352
	movgt	r1, #352
	movgt	r3, r1
	lslle	r3, r3, #16
	strgt	r1, [r5]
	lsrle	r3, r3, #16
.L52:
	mov	r6, #67108864
	ldr	r1, .L60+12
	strh	r2, [r6, #20]	@ movhi
	strh	r3, [r6, #22]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L60+16
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L60+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+24
	ldr	r1, [r5]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #256
	bne	.L59
.L54:
	ldr	r3, .L60+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L60+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L60+36
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	ldr	r3, .L60+40
	mov	lr, pc
	bx	r3
	b	.L54
.L61:
	.align	2
.L60:
	.word	player
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	drawPlayer
	.word	drawNPC
	.word	drawAlert
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	drawBoxes
	.size	drawJungleStage, .-drawJungleStage
	.comm	textState,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
