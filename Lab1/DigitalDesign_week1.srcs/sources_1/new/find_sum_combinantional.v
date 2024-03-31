`timescale 1ns / 1ps
/* 
Bu devre, karþýlaþtýrmalar ve koþullu atamalar kullanarak, üç girdi arasýndaki en büyük 
iki sayýnýn toplamýný doðrudan hesaplar. Bu, bir kombinasyonel mantýk devresidir, 
yani bir döngü içermez ve her anlýk (combinational) giriþ deðiþikliði ile anýnda sonuç üretir. 
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
//Ýlk olarak, üç girdi (A, B, C) arasýndan en büyük olanýný (larger1) bulmak için üçlü bir 
//karþýlaþtýrma yapýlýr. Bu karþýlaþtýrma, A'nýn B ve C'den büyük olduðunu, 
//B'nin C'den büyük olduðunu ve C'nin B ve A'dan büyük olduðunu kontrol eder.
assign larger2 = (A < B && A > C) ? A : (B < C && B > A) ? B : C;
//Ýkinci olarak, ikinci büyük sayýyý (larger2) bulmak için benzer bir mantýksal iþlem yapýlýr. 
//Ýlk büyük sayýnýn hangi girdi olduðuna baðlý olarak, diðer iki giriþ arasýnda bir karþýlaþtýrma yapýlýr


// Calculate the sum of the two largest numbers
assign sum = larger1 + larger2;

endmodule

