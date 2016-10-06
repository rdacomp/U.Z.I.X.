	psect	text
	global	__lngjmprv
	global	_setjmp
	global	_longjmp
; int setjmp (jmp_buf env) ;		/* int jmp_buf[7] */
_setjmp:
	pop	af
	pop	de		; DE = env
	push	de
	push	af

	; don't use stack here!
	defb	0FDh,07Dh	; LD A,IYl	- saves IY
	ld	(de),a
	inc	de
	defb	0FDh,07Ch	; LD A,IYh
	ld	(de),a
	inc	de
	defb	0DDh,07Dh	; LD A,IXl	- saves IX
	ld	(de),a
	inc	de
	defb	0DDh,07Ch	; LD A,IXh
	ld	(de),a
	inc	de
	ld	a,c		;		- saves BC
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
	inc	de
	ld	a,e		;		- saves DE
	ld	(de),a
	inc	de
	ld	a,d
	ld	(de),a
	inc	de
	ld	a,l		;		- saves HL
	ld	(de),a
	inc	de
	ld	a,h
	ld	(de),a
	inc	de
	ld	hl,0
	add	hl,sp		; HL = SP
	inc	hl		; skip return address to after setjmp call
	inc	hl		; (it is saved below)
	ld	a,l		;		- saves SP
	ld	(de),a
	inc	de
	ld	a,h
	ld	(de),a
	inc	de
	pop	hl		; HL = return address after setjmp call
	push	hl
	ld	a,l		;		- saves PC
	ld	(de),a
	inc	de
	ld	a,h
	ld	(de),a
	ld	hl,0
	ret
;
; void longjmp (jmp_buf env, int rv)
_longjmp:
	pop	af
	pop	de	; DE = env
	pop	bc	; BC = rv
	push	bc
	push	de
	push	af
	
	; don't use stack here!
	ld	(__lngjmprv),bc
	ld	hl,12
	add	hl,de
	ld	b,(hl)
	dec	hl
	ld	c,(hl)		; BC = return address after setjmp call
	dec	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a		; HL = saved SP in env
	ld	sp,hl		;		- restores SP
	push	bc		; put return address in stack
	ld	a,(de)
	defb	0FDh,06Fh	; LD IYl,A	- restores IY
	inc	de
	ld	a,(de)
	defb	0FDh,067h	; LD IYh,A
	inc	de
	ld	a,(de)
	defb	0DDh,06Fh	; LD IXl,A	- restores IX
	inc	de
	ld	a,(de)
	defb	0DDh,067h	; LD IXh,A
	inc	de
	ld	a,(de)
	ld	c,a		;		- restores BC
	inc	de
	ld	a,(de)
	ld	b,a
	inc	de
	ld	a,(de)
	;ld	e,a		;		- restores DE
	inc	de
	;ld	a,(de)
	;ld	d,a		; DE is the pointer, it can't be restored.
	inc	de		; anyway, it doesn't matter for lonjmp/setjmp
	;ld	a,(de)
	;ld	l,a		;		- restores HL
	inc	de
	;ld	a,(de)		; HL is the return value, it don't need to be
	;ld	h,a		; restored, because it will be overwritten.
	ld	hl,(__lngjmprv)	; return value
	ld	a,h		; zero?
	or	l					
	ret	nz		; return it if not	
	ld	hl,1
	ret			; else return 1		
