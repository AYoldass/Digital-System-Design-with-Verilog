`timescale 1ns / 1ps

// B�l�c� mod�l�
module divider(
    input  [7:0] dividend, // b�l�nen
    input  [2:0] divisor, // b�len
    output reg [6:0] quotient // b�l�m
);


// B�lme i�lemi i�in kayarl� virg�l y�ntemini kullan�r�z
// B�l�neni sola kayd�rarak b�lenle kar��la�t�r�r�z
// B�l�nen, b�lenin en az 4 kat� oldu�unda b�l�m� 1 yapar�z
// B�l�nen, b�lenin 4 kat�ndan k���k oldu�unda b�l�m� 0 yapar�z
// B�l�m� hesaplamak i�in 7 bit gereklidir

integer j; // d�ng� de�i�keni

always @(dividend, divisor) begin
    quotient = 7'b0; // b�l�m� s�f�rlar�z
    for (j = 0; j < 7; j = j + 1) begin
        if (dividend >= (divisor << (6-j))) begin // b�l�nen, b�lenin 4 kat�ndan b�y�k veya e�itse
            quotient[j] = 1'b1; // b�l�m�n j. bitini 1 yapar�z
            dividend = dividend - (divisor << (6-j)); // b�l�neni g�ncelleriz
        end
        else begin // b�l�nen, b�lenin 4 kat�ndan k���kse
            quotient[j] = 1'b0; // b�l�m�n j. bitini 0 yapar�z
        end
    end
end

endmodule