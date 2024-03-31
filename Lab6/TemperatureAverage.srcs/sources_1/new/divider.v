`timescale 1ns / 1ps

// Bölücü modülü
module divider(
    input  [7:0] dividend, // bölünen
    input  [2:0] divisor, // bölen
    output reg [6:0] quotient // bölüm
);


// Bölme iþlemi için kayarlý virgül yöntemini kullanýrýz
// Bölüneni sola kaydýrarak bölenle karþýlaþtýrýrýz
// Bölünen, bölenin en az 4 katý olduðunda bölümü 1 yaparýz
// Bölünen, bölenin 4 katýndan küçük olduðunda bölümü 0 yaparýz
// Bölümü hesaplamak için 7 bit gereklidir

integer j; // döngü deðiþkeni

always @(dividend, divisor) begin
    quotient = 7'b0; // bölümü sýfýrlarýz
    for (j = 0; j < 7; j = j + 1) begin
        if (dividend >= (divisor << (6-j))) begin // bölünen, bölenin 4 katýndan büyük veya eþitse
            quotient[j] = 1'b1; // bölümün j. bitini 1 yaparýz
            dividend = dividend - (divisor << (6-j)); // bölüneni güncelleriz
        end
        else begin // bölünen, bölenin 4 katýndan küçükse
            quotient[j] = 1'b0; // bölümün j. bitini 0 yaparýz
        end
    end
end

endmodule