org 0000h
	mov P1, #0ffh;
	start:clr p3.0;rly
	mov P0,#00h;
	mov P2,#00h;
	setb p1.0;full==1
	setb p1.1;mid==1
	setb p1.2;empty==1
	setb p1.3;t2==1
	acall lcd;
	jnb p1.3, main;t2==0
	clr p0.3;if t2!=0
	mov A,#01h;
	acall command;
	mov A,#80h;
	acall command;
	acall display;tank is empty
	mov A,#0ch;
	acall command;
	acall display6;fill tank
	
	main:setb p0.3;
	jnb p1.2,next;
	mov A,#01h;
	acall command;
	mov A,#80h;
	acall command;
	acall display;tank is empty
	mov A,#0ch;
	acall command;
	acall display1;motor is on
	
	
	
	
	next:jnb p1.1,next1;
	setb p0.3;
	mov A,#01h;
	acall command;
	mov A,#80h;
	acall command;
	acall display2;tank is filling
	mov A,#0ch;
	acall command;
	acall display1;motor is on
	
	
	next1:jnb p1.0,next2;
	setb p0.3;
	mov A,#01h;
	acall command;
	mov A,#80h;
	acall command;
	acall display3;tank is mid
	mov A,#0ch;
	acall command;
	acall display1;motor is on
	
	
	next2:clr p0.3;
	mov A,#01h;
	acall command;
	mov A,#80h;
	acall command;
	acall display4;fill tank
	mov A,#0ch;
	acall command;
	acall display5;motor is off
	
	display:mov dptr,#table1;tank is empty
	again:clr A;
	movc A,@A+dptr;
	jz skip;
	mov p2,a;
	acall data1;
	inc dptr;
	sjmp again;
	skip:mov A,#0ch;
	acall command;
	
	
	display1:mov dptr,#table2;motor is on
	again1:clr A;
	movc A,@A+dptr;
	jz skip1;
	mov p2,a;
	acall data1;
	inc dptr;
	sjmp again1;
	skip1:mov A,#0ch;
	acall command;
	
	
	display2:mov dptr,#table3;tank is filling
	again2:clr A;
	movc A,@A+dptr;
	jz skip2;
	mov p2,a;
	acall data1;
	inc dptr;
	sjmp again2;
	skip2:mov A,#0ch;
	acall command;
	
	display3:mov dptr,#table4;tank is mid
	again3:clr A;
	movc A,@A+dptr;
	jz skip3;
	mov p2,a;
	acall data1;
	inc dptr;
	sjmp again3;
	skip3:mov A,#0ch;
	acall command;
	
	display4:mov dptr,#table5;tank is full
	again4:clr A;
	movc A,@A+dptr;
	jz skip4;
	mov p2,a;
	acall data1;
	inc dptr;
	sjmp again4;
	skip4:mov A,#0ch;
	acall command;
	
	display5:mov dptr,#table6;motor is off
	again5:clr A;
	movc A,@A+dptr;
	jz skip5;
	mov p2,a;
	acall data1;
	inc dptr;
	sjmp again5;
	skip5:mov A,#0ch;
	acall command;
	
	display6:mov dptr,#table7;fill tank
	again6:clr A;
	movc A,@A+dptr;
	jz skip6;
	mov p2,a;
	acall data1;
	inc dptr;
	sjmp again6;
	skip6:mov A,#0ch;
	acall command;
	
	lcd:mov A, #38h;
	acall command;
	mov A,#0eh;
	acall command;
	mov A,#01h;
	acall command;
	mov A,#06h;
	acall command;
	
	command:acall busy;
	clr p0.0;rs
	setb p0.1;rw
	mov P2,A;
	setb p0.2;en
	nop;
	clr p0.2;
	ret;
	
	busy:setb p2.7;busy flag
	clr p0.0;rs
	setb p0.1;rw
	wait:clr p0.2;en
	nop;
	setb p0.2;
	jb p2.7,wait;
	ret;
	
	data1:acall busy;
	setb p0.0;rs
	clr p0.1;rw
	mov p2,A;
	setb p0.2;en
	nop;
	clr p0.2;
	ret;
	
	
org 0100h;
	table1: db 'tank is empty',0;
	table2:	db 'motor is on',0;
	table3: db 'tank is filling',0;
	table4:	db 'tank is mid',0;
	table5: db 'tank is full',0;
	table6: db 'motor is off',0;
	table7: db 'fill tank',0;		
	
end;
