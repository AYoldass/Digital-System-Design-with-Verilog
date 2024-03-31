`timescale 1ns / 1ps
/* 
Bu devre, kar��la�t�rmalar ve ko�ullu atamalar kullanarak, �� girdi aras�ndaki en b�y�k 
iki say�n�n toplam�n� do�rudan hesaplar. Bu, bir kombinasyonel mant�k devresidir, 
yani bir d�ng� i�ermez ve her anl�k (combinational) giri� de�i�ikli�i ile an�nda sonu� �retir. 
*/

module find_sum_combinational(
    input [1:0] A,
    input [1:0] B,
    input [1:0] C,
    output [2:0] sum
);

wire [1:0] larger1, larger2;

// Determine the largest number
assign larger1 = (A > B && A > C) ? A : (B > C) ? B : C;
//�lk olarak, �� girdi (A, B, C) aras�ndan en b�y�k olan�n� (larger1) bulmak i�in ��l� bir 
//kar��la�t�rma yap�l�r. Bu kar��la�t�rma, A'n�n B ve C'den b�y�k oldu�unu, 
//B'nin C'den b�y�k oldu�unu ve C'nin B ve A'dan b�y�k oldu�unu kontrol eder.
assign larger2 = (A < B && A > C) ? A : (B < C && B > A) ? B : C;
//�kinci olarak, ikinci b�y�k say�y� (larger2) bulmak i�in benzer bir mant�ksal i�lem yap�l�r. 
//�lk b�y�k say�n�n hangi girdi oldu�una ba�l� olarak, di�er iki giri� aras�nda bir kar��la�t�rma yap�l�r


// Calculate the sum of the two largest numbers
assign sum = larger1 + larger2;

endmodule

