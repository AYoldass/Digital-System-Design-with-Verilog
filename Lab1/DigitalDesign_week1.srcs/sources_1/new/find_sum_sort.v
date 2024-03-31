`timescale 1ns / 1ps
/*
Bu devre, Bubble Sort algoritmas� kullanarak �� giri� aras�ndaki en b�y�k iki say�y� belirler. 
S�ralama i�lemi, her iki giri� aras�nda kar��la�t�rmalar yaparak ger�ekle�tirilir. 
Bu devre de bir kombinasyonel mant�k devresidir, bu nedenle bir d�ng� i�ermez ve her anl�k giri� de�i�ikli�i ile an�nda sonu� �retir.
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
always @* blo�u, herhangi bir giri� de�i�ti�inde s�ralama mant���n� yeniden hesaplar.
�nce, �� giri� (A, B, C) aras�ndan en b�y�k olan� (sorted[0]) ve di�er iki say�y� s�ralar.
Ard�ndan, if-else yap�s� i�inde ikinci b�y�k say� (sorted[1]) belirlenir ve kalan say� 
(sorted[2]) di�er iki say�n�n biri taraf�ndan b�y�k olan�d�r. 
Bu mant�k, �� giri�in her birini kar��la�t�rarak �al���r.
*/
endmodule
