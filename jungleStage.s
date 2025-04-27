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
	mov	r3, #67108864
	ldr	r0, .L6+80
	ldr	r1, .L6+84
	ldr	r2, .L6+88
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	strh	r4, [r3, #20]	@ movhi
	ldr	r2, .L6+92
	strh	r4, [r3, #22]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L6+96
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
	.word	textState
	.word	vOff
	.word	hOff
	.word	hideSprites
	.word	shadowOAM
	.size	initJungleStage, .-initJungleStage
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"NPC: HI THERE!\000"
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
	ldr	r5, .L31
	ldr	r4, .L31+4
	sub	sp, sp, #16
	ldr	r3, .L31+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L31+12
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L31+16
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	cmp	r3, #0
	moveq	r2, #67108864
	ldrheq	r3, [r2]
	ldr	r4, .L31+24
	orreq	r3, r3, #256
	strheq	r3, [r2]	@ movhi
	ldr	r5, .L31+28
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L29
.L10:
	ldr	r3, .L31+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L8
	ldr	r3, .L31+36
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L30
.L8:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	ldr	r3, .L31+40
	mov	lr, pc
	bx	r3
	b	.L10
.L30:
	ldr	r3, .L31+44
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r4, {r0, r1, r2, r3}
	ldr	r4, .L31+48
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L8
	ldr	r4, .L31+52
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L14
.L16:
	.word	.L20
	.word	.L19
	.word	.L18
	.word	.L17
	.word	.L15
.L15:
	ldr	r3, .L31+56
	ldr	r1, .L31+60
	ldr	r0, .L31+64
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	add	r3, r3, #1
.L21:
	str	r3, [r6]
	b	.L8
.L17:
	ldr	r3, .L31+56
	ldr	r1, .L31+60
	ldr	r0, .L31+68
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	add	r3, r3, #1
	b	.L21
.L18:
	ldr	r3, .L31+56
	ldr	r1, .L31+60
	ldr	r0, .L31+72
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	add	r3, r3, #1
	b	.L21
.L19:
	ldr	r3, .L31+56
	ldr	r1, .L31+60
	ldr	r0, .L31+76
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	add	r3, r3, #1
	b	.L21
.L20:
	ldr	r3, .L31+56
	ldr	r1, .L31+60
	ldr	r0, .L31+80
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	add	r3, r3, #1
	b	.L21
.L14:
	mov	r2, #67108864
	ldr	r3, .L31+84
	ldrh	r1, [r2]
	and	r3, r3, r1
	strh	r3, [r2]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r3, #0
	b	.L21
.L32:
	.align	2
.L31:
	.word	vOff
	.word	hOff
	.word	updatePlayer
	.word	textState
	.word	updateNPC
	.word	updateJungleAlert
	.word	player
	.word	checkTempleCollision
	.word	oldButtons
	.word	buttons
	.word	goToBossStage
	.word	npc
	.word	collision
	.word	eraseText
	.word	textToTile
	.word	449
	.word	.LC4
	.word	.LC3
	.word	.LC2
	.word	.LC1
	.word	.LC0
	.word	65279
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
	ldr	r3, .L41
	ldm	r3, {r2, r3}
	push	{r4, r5, r6, lr}
	sub	r2, r2, #120
	ldr	r4, .L41+4
	cmp	r2, #0
	str	r2, [r4]
	movlt	r2, #0
	ldr	r5, .L41+8
	sub	r3, r3, #80
	str	r3, [r5]
	strlt	r2, [r4]
	blt	.L35
	cmp	r2, #272
	movgt	r1, #272
	movgt	r2, r1
	lslle	r2, r2, #16
	strgt	r1, [r4]
	lsrle	r2, r2, #16
.L35:
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r5]
	blt	.L38
	cmp	r3, #352
	movgt	r1, #352
	movgt	r3, r1
	lslle	r3, r3, #16
	strgt	r1, [r5]
	lsrle	r3, r3, #16
.L38:
	mov	r1, #67108864
	strh	r2, [r1, #20]	@ movhi
	ldr	r2, .L41+12
	strh	r3, [r1, #22]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L41+16
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L41+20
	mov	lr, pc
	bx	r3
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L41+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L41+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L41+36
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	.align	2
.L41:
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
	.size	drawJungleStage, .-drawJungleStage
	.comm	textState,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
