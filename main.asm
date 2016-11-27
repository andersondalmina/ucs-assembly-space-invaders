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
	
	SHOT		db 0Fh
				db 0Fh
				db 0Fh
				db 0Fh
				db 0Fh

	PLAYER_SHOT1 dw 0h
	PLAYER_SHOT2 dw 0h
	SHOTS_COUNT db 0
	
	PLAYER_X dw 152
	PLAYER_Y dw 189
	SPACE_WIDTH equ 15
	SPACE_HEIGHT equ 10
	
	ALIENS_X dw 60
	ALIENS_Y dw 0
	ALIENS_DIRECTION DB 0
	
	;keys ASCII code
    KEY_LEFT equ 4B00h
    KEY_RIGHT equ 4D00h
	KEY_SPACE equ 3920h
	KEY_ESC equ 011Bh
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
	
	;Draw player and aliens spaceships
	BUILDMAP proc
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		
		;draw the player spaceship
		mov SI, offset PLAYER_SHIP
		mov AX, PLAYER_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, PLAYER_X
		call DRAW_SPACESHIP
		
		;draw the alien6 frote (line with 10 aliens)
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN6:
		mov SI, offset ALIEN_6
		mov AX, 20
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		loop DRAWALIEN6
		
		;draw the alien5 frote (line with 10 aliens)
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN5:
		mov SI, offset ALIEN_5
		mov AX, 35
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		loop DRAWALIEN5
	
		;draw the alien4 frote (line with 10 aliens)
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN4:
		mov SI, offset ALIEN_4
		mov AX, 50
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		loop DRAWALIEN4
		
		;draw the alien3 frote (line with 10 aliens)
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN3:
		mov SI, offset ALIEN_3
		mov AX, 65
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		loop DRAWALIEN3
		
		;draw the alien2 frote (line with 10 aliens)
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN2:
		mov SI, offset ALIEN_2
		mov AX, 80
		add AX, ALIENS_Y
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, BX
		add BX, 20
		call DRAW_SPACESHIP
		loop DRAWALIEN2
		
		;draw the alien1 frote (line with 10 aliens)
		mov CX, 10
		mov BX, ALIENS_X
	DRAWALIEN1:
		mov SI, offset ALIEN_1
		mov AX, 95
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
		
		;get keyboard buffer
		mov AH, 01h
		int 16h
		
		jz CHECK_KEY_FORA ;check if have something in buffer
		
		cmp AX, KEY_LEFT
		je CALL_MOVE_LEFT
		
		cmp AX, KEY_RIGHT
		je CALL_MOVE_RIGHT
			
		cmp AX, KEY_SPACE
		je CALL_SHOT
		
		cmp AX, KEY_ESC
		je CALL_END_GAME
		
		jmp CHECK_KEY_CONTINUE
		
	CALL_MOVE_LEFT:
		dec PLAYER_X
		jmp CHECK_KEY_CONTINUE
		
	CALL_MOVE_RIGHT:
		inc PLAYER_X
		jmp CHECK_KEY_CONTINUE
	
	CALL_SHOT:
		cmp SHOTS_COUNT, 2 ;check if has 2 shots at screen
		je CHECK_KEY_CONTINUE
	
		call PLAYER_SHOT
		inc SHOTS_COUNT
		
		jmp CHECK_KEY_CONTINUE
		
	CALL_END_GAME:
		call END_GAME;
	
	CHECK_KEY_CONTINUE:
		mov AH, 00h
		int 16h
		
	CHECK_KEY_FORA:
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
		call CLEAR_SCREEN
		jmp FIM
		
		RIGHT:
		mov ALIENS_DIRECTION, 1
		add ALIENS_Y, 15
		call CLEAR_SCREEN
		
		FIM:
		cmp ALIENS_DIRECTION, 1
		jz VAI_R
		
		dec ALIENS_X
		jmp CAIFORA
		
		VAI_R: inc ALIENS_X
		
		CAIFORA:
		ret
	endp
	
	; Print shot
	; Registers Params:
	;   SI: shot model
	;	DI: starter point (x * y)
	DRAW_SHOT proc
		push CX
		push DI
		
		mov CX, 5 ;number of lines
	
	DRAW_SHOT_NEXTLINE:
		push CX ;store the number of lines
		
		mov CX, 1 ;set CX the number of bits to draw
		rep movsb 
		
		POP CX ;get the number of lines stored

		add DI, 320-1 ;go to next line
		loop DRAW_SHOT_NEXTLINE
		
		pop DI
		pop CX
		
		ret
	endp
	
	PLAYER_SHOT proc
		;print the player shot
		mov SI, offset SHOT
		mov AX, PLAYER_Y
		sub AX, 5
		mov DI, AX
		shl AX, 8
		shl DI, 6
		add DI, AX
		add DI, PLAYER_X
		add DI, 7
		
		mov PLAYER_SHOT1, DI
		call DRAW_SHOT
		
		ret
	endp
	
	MOVE_PLAYER_SHOTS proc
		cmp SHOTS_COUNT, 0
		je MOVE_PLAYER_SHOTS_FIM
	
		mov SI, offset SHOT
		sub PLAYER_SHOT1, 320
		mov DI, PLAYER_SHOT1
		
		call DRAW_SHOT
		
		cmp DI, 0
		ja MOVE_PLAYER_SHOTS_FIM
	
		dec SHOTS_COUNT
		mov PLAYER_SHOT1, 0
		
	MOVE_PLAYER_SHOTS_FIM:
		ret
	endp
	
	;Clear the screen on top of aliens
	CLEAR_SCREEN proc
		push AX
		push CX
		push DI
		
		;pass the Y position to CX and multiply for 320
		mov AX, 5
		add AX, ALIENS_Y
		mov CX, AX
		shl AX, 8
		shl CX, 6
		add CX, AX
		
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
		nop
		loop DELAYLOOP
		
		pop CX
		ret
	endp
	
	;Exit the game
	END_GAME proc
		;return to text mode
		xor ah, ah
		mov al, 3
		int 10h
	
		;end program
		mov al, 0h
		mov ah, 4Ch
		int 21h	
		
		ret
	endp
	
	;Start the game
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
		
		mov BX, 0
	;Game main loop
	GAMELOOP:
		call DELAY
		
		call CHECK_KEY
		
		cmp BX, 10
		jne CONTINUE
		mov BX, 0
		call MOVE_ALIENS
		
	CONTINUE:
		inc BX
			
		call MOVE_PLAYER_SHOTS
		call BUILDMAP
		
		jmp GAMELOOP
end START