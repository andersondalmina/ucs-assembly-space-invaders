;Autor: Ânderson Zorrer Dalmina
;Space Invaders Game

.model small

.stack 4000H

.data
	; spaceships
	; 150 bytes (15x10)
	PLAYER_SHIP db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0AH, 00h, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 00h, 00h
				db 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 00h
				db 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 00h
				db 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 00h
	
	ALIEN_1 	db 00h, 00h, 00h, 00h, 00h, 00h, 09H, 09H, 09H, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 09H, 09H, 09H, 09H, 09H, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 00h, 00h, 00h
				db 00h, 00h, 09H, 09H, 09H, 00h, 09H, 09H, 09H, 00h, 09H, 09H, 09H, 00h, 00h
				db 00h, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 00h
				db 00h, 00h, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 09H, 00h, 00h
				db 00h, 00h, 00h, 09H, 00h, 09H, 00h, 00h, 00h, 09H, 00h, 09H, 00h, 00h, 00h
				db 00h, 00h, 09H, 00h, 09H, 00h, 00h, 00h, 00h, 00h, 09H, 00h, 09H, 00h, 00h
				db 00h, 09H, 00h, 09H, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09H, 00h, 09H, 00h
	
	ALIEN_2 	db 00h, 00h, 00h, 00h, 0EH, 00h, 00h, 00h, 00h, 00h, 0EH, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 0EH, 00h, 00h, 00h, 0EH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 00h, 0EH, 00h, 0EH, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 00h, 00h, 00h
				db 00h, 00h, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 00h, 00h
				db 00h, 0EH, 0EH, 0EH, 00h, 00h, 0EH, 0EH, 0EH, 00h, 00h, 0EH, 0EH, 0EH, 00h
				db 00h, 00h, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 00h, 00h
				db 00h, 00h, 00h, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 0EH, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 0EH, 00h, 0EH, 00h, 0EH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 0EH, 00h, 00h, 00h, 00h, 00h, 0EH, 00h, 00h, 00h, 00h
	
	ALIEN_3 	db 00h, 00h, 00h, 00h, 00h, 0DH, 00h, 00h, 00h, 0DH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 00h, 0DH, 00h, 0DH, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 00h, 00h
				db 00h, 0DH, 0DH, 0DH, 00h, 00h, 0DH, 0DH, 0DH, 00h, 00h, 0DH, 0DH, 0DH, 00h
				db 00h, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 00h
				db 00h, 00h, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 00h, 00h
				db 00h, 00h, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 0DH, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 0DH, 00h, 0DH, 00h, 0DH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 0DH, 00h, 0DH, 00h, 0DH, 00h, 0DH, 00h, 00h, 00h, 00h
				db 00h, 00h, 0DH, 0DH, 00h, 00h, 00h, 0DH, 00h, 00h, 00h, 0DH, 0DH, 00h, 00h
	
	ALIEN_4 	db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 0BH, 00h, 00h, 00h, 0BH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 00h, 0BH, 00h, 0BH, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 00h, 00h, 00h
				db 00h, 00h, 0BH, 0BH, 0BH, 00h, 0BH, 0BH, 0BH, 00h, 0BH, 0BH, 0BH, 00h, 00h
				db 00h, 0BH, 00h, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 00h, 0BH, 00h
				db 00h, 0BH, 00h, 00h, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 0BH, 00h, 00h, 0BH, 00h
				db 00h, 00h, 00h, 00h, 00h, 0BH, 00h, 00h, 00h, 0BH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 0BH, 0BH, 00h, 00h, 00h, 00h, 00h, 0BH, 0BH, 00h, 00h, 00h
				
	ALIEN_5 	db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 00h, 0CH, 0CH, 0CH, 0CH, 0CH, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 00h, 00h, 00h
				db 00h, 00h, 0CH, 0CH, 00h, 0CH, 0CH, 0CH, 0CH, 0CH, 00h, 0CH, 0CH, 00h, 00h
				db 00h, 00h, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 0CH, 00h, 00h
				db 00h, 00h, 00h, 0CH, 00h, 0CH, 0CH, 0CH, 0CH, 0CH, 00h, 0CH, 00h, 00h, 00h
				db 00h, 00h, 0CH, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0CH, 00h, 00h
				db 00h, 00h, 00h, 0CH, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0CH, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 0CH, 00h, 00h, 00h, 00h, 00h, 0CH, 00h, 00h, 00h, 00h
	
	ALIEN_6 	db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 0AH, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0AH, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 0AH, 00h, 00h, 00h, 00h, 00h, 0AH, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 00h, 0AH, 00h, 00h, 00h, 00h, 00h, 0AH, 00h, 00h, 00h, 00h
				db 00h, 00h, 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 00h, 00h, 00h
				db 00h, 00h, 0AH, 0AH, 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 00h, 0AH, 0AH, 00h, 00h
				db 00h, 0AH, 00h, 0AH, 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 00h, 0AH, 00h, 0AH, 00h
				db 00h, 0AH, 00h, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 0AH, 00h, 0AH, 00h
				db 00h, 0AH, 00h, 0AH, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0AH, 00h, 0AH, 00h
				db 00h, 0AH, 00h, 00h, 0AH, 0AH, 0AH, 00h, 0AH, 0AH, 0AH, 00h, 00h, 0AH, 00h
	
	PLAYER_X dw 152
	PLAYER_Y dw 189
	SPACE_WIDTH equ 15
	SPACE_HEIGHT equ 10
	
	ALIENS_X dw 60
	ALIENS_Y dw 0
	ALIENS_DIRECTION DB 0
	
    ARROW_LEFT equ 4Bh
    ARROW_RIGHT equ 4Dh
.code
	; Set video mode 320x200 256 colors
	VIDEO_MODE proc
		push AX
		push ES
		
		mov AH, 0
		mov AL, 13h
		int 10h
		
		pop AX
		pop ES
		
		ret
	endp
	
	; Print char (DEBUG)
	; Registers Params:
	; 	DL: char
	ESC_CHAR proc 
		push AX
		mov AH, 2
		int 21h
		pop AX
		
		ret
	endp
	
	; Print spaceship
	; Registers Params:
	;   SI: offset spaceship model
	; 	DI: starter point (x * y)
	DRAW_SPACESHIP proc
		push CX
		push DI
		
		mov CX, SPACE_HEIGHT ;number of lines
	
	NEXTLINE:
		push CX ;store the number of lines
		
		mov CX, SPACE_WIDTH ;set CX the number of bits to draw
		rep movsb 
		
		POP CX ;get the number of lines stored

		add DI, 320-SPACE_WIDTH ;go to next line
		loop NEXTLINE
		
		pop DI
		pop CX
		
		ret
	endp
	
	BUILDMAP proc
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		
		;print the player spaceship
		mov SI, offset PLAYER_SHIP
		mov AX, PLAYER_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, PLAYER_X
		call DRAW_SPACESHIP
		
		;print the alien6 frote
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN6:
		mov SI, offset ALIEN_6
		mov AX, 5
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		
		loop DRAWALIEN6
		
		;print the alien5 frote
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN5:
		mov SI, offset ALIEN_5
		mov AX, 20
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		
		loop DRAWALIEN5
	
		;print the alien4 frote
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN4:
		mov SI, offset ALIEN_4
		mov AX, 35
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		
		loop DRAWALIEN4
		
		;print the alien3 frote
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN3:
		mov SI, offset ALIEN_3
		mov AX, 50
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		
		loop DRAWALIEN3
		
		;print the alien2 frote
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN2:
		mov SI, offset ALIEN_2
		mov AX, 65
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		
		loop DRAWALIEN2
		
		;print the alien1 frote
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN1:
		mov SI, offset ALIEN_1
		mov AX, 80
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		
		loop DRAWALIEN1
		
		pop SI
		pop DI
		pop DX
		pop CX
		pop BX
		pop AX
		
		ret
	endp
	
	;get key press
	CHECK_KEY proc
		push AX
		push DX
		
		mov AH, 01h
		int 16h
		
		cmp AH, ARROW_LEFT
		je CALL_MOVE_LEFT
		
		cmp AH, ARROW_RIGHT
		je CALL_MOVE_RIGHT
		jne FORA
		
	CALL_MOVE_LEFT:
		dec PLAYER_X
		mov AH, 00h
		int 16h
		jmp FORA
		
	CALL_MOVE_RIGHT:
		inc PLAYER_X
		mov AH, 00h
		int 16h
		
	FORA:
		
		pop DX
		pop AX
	
		ret
	endp
	
	MOVE_ALIENS proc
		cmp ALIENS_X, 120
		jz LEFT
		
		cmp ALIENS_X, 0
		jz RIGHT
		jmp FIM
		
		LEFT:
		mov ALIENS_DIRECTION, 0
		add ALIENS_Y, 15
		jmp FIM
		
		RIGHT:
		mov ALIENS_DIRECTION, 1
		add ALIENS_Y, 15
		
		FIM:
		cmp ALIENS_DIRECTION, 1
		jz VAI_R
		
		dec ALIENS_X
		jmp CAIFORA
		
		VAI_R: inc ALIENS_X
		
		CAIFORA:
		ret
	endp
	
	CLEAR_SCREEN proc
		push AX
		push CX
		push DI
		
		mov CX, 64000
		xor AX, AX
		xor DI, DI
		rep stosw
		
		pop DI
		pop CX
		pop AX
		
		ret
	endp

	DELAY proc
		push CX
		
		mov CX, 64000
		DELAYLOOP:
		loop DELAYLOOP
		
		pop CX
		ret
	endp
	
	START:
		;init data segment
		mov AX, @DATA
		mov DS, AX
		mov ES, AX
		
		;set video mode
		call VIDEO_MODE
		
		;set extra segment
		mov AX, 0A000h
		mov ES, AX
	

	GAMELOOP:
		call DELAY

		call CLEAR_SCREEN
		
		call BUILDMAP
		
		call CHECK_KEY
		
		call MOVE_ALIENS
		
		jmp GAMELOOP
		
		;return to text mode
		xor ah, ah
		mov al, 3
		int 10h
	
		;end program
		mov al, 0h
		mov ah, 4Ch
		int 21h	
end START