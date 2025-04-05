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
	mov	r2, #6912
	ldr	r4, .L4
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
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
	.word	boofBGPal
	.word	10000
	.word	boofBGTiles
	.word	100718592
	.word	boofMapMap
	.word	initPlayer
	.word	hOff
	.word	vOff
	.word	hideSprites
	.word	shadowOAM
	.size	initCaveStage, .-initCaveStage
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
