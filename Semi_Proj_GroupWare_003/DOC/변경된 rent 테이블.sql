CREATE TABLE Rent (
	rent_num NUMBER CONSTRAINT Rent_num_pk PRIMARY KEY, /* �����ȣ */
	rent_reason VARCHAR2(300), /* ������� */
	rent_start VARCHAR2(50) NOT NULL, /* �����۽ð� */
	rent_end VARCHAR2(50) NOT NULL, /* �������ð� */
	room_num NUMBER, /* �ü���ȣ */
	mem_code VARCHAR2(50), /* ��� */
  CONSTRAINT FK_Room_TO_Rent FOREIGN KEY (room_num ) REFERENCES Room (room_num),
  CONSTRAINT FK_Member_TO_Rent FOREIGN KEY (mem_code) REFERENCES Member (mem_code)
);

create SEQUENCE Rent_seq
increment by 1
start with 1;

insert into rent values(rent_seq.nextVal,'ȯ�溸ȣ ������Ʈ','2015-10-23T13:00'
,'2015-10-30T13:00',1,'151008100853');

select * from rent;
