`timescale 1ns / 1ps
/*
Bu devre, Bubble Sort algoritmasý kullanarak üç giriþ arasýndaki en büyük iki sayýyý belirler. 
Sýralama iþlemi, her iki giriþ arasýnda karþýlaþtýrmalar yaparak gerçekleþtirilir. 
Bu devre de bir kombinasyonel mantýk devresidir, bu nedenle bir döngü içermez ve her anlýk giriþ deðiþikliði ile anýnda sonuç üretir.
*/
module find_sum_sort(
    input [1:0] A,
    input [1:0] B,
    input [1:0] C,
    output [2:0] sum
);

reg [1:0] sorted[2:0];

// Sorting logic (Bubble Sort)
always @* begin
    // Determine the largest number
    if (A > B && A > C) begin
        sorted[0] = A;
        if (B > C) begin
            sorted[1] = B;
            sorted[2] = C;
        end
        else begin
            sorted[1] = C;
            sorted[2] = B;
        end
    end
    else if (B > A && B > C) begin
        sorted[0] = B;
        if (A > C) begin
            sorted[1] = A;
            sorted[2] = C;
        end
        else begin
            sorted[1] = C;
            sorted[2] = A;
        end
    end
    else begin
        sorted[0] = C;
        if (A > B) begin
            sorted[1] = A;
            sorted[2] = B;
        end
        else begin
            sorted[1] = B;
            sorted[2] = A;
        end
    end
end

// Calculate the sum of the two largest numbers
assign sum = sorted[0] + sorted[1];
/*
always @* bloðu, herhangi bir giriþ deðiþtiðinde sýralama mantýðýný yeniden hesaplar.
Önce, üç giriþ (A, B, C) arasýndan en büyük olaný (sorted[0]) ve diðer iki sayýyý sýralar.
Ardýndan, if-else yapýsý içinde ikinci büyük sayý (sorted[1]) belirlenir ve kalan sayý 
(sorted[2]) diðer iki sayýnýn biri tarafýndan büyük olanýdýr. 
Bu mantýk, üç giriþin her birini karþýlaþtýrarak çalýþýr.
*/
endmodule
