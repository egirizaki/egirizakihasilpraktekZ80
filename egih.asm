L2 	.DB 0AH  ;data byte 1
	.DB 0BH  ;data byte 4
	.DB 0CH  ;data byte 7
	.DB 3DH  ;data byte 2
	.DB 1EH  ;data byte 8
L1 	LD D,05H ;load counter register D
	LD BC,L2 ;load pointer register pair BC
L3 	LD A,(BC) ;get the data byte
	OUT (02H),A ;send it to port 02H
	INC BC ;increment pointer BC
	DEC D  ;decrement counter D
L5	LD A,(BC) ;get the data byte
	OUT (03H),A ;send it to port 03H
	INC BC ;increment pointer BC
	DEC D  ;decrement counter D
	JP NZ,L3 ;loop until all data bytes are sent
L4 	JP L5 ;loop forever
	HALT
	.END