clc;clear all;close all
opts=detectImportOptions('datarealestate.xlsx');
opts.SelectedVariableNames = (3:8);
training=readmatrix('datarealestate.xlsx',opts); %membaca file
data2 = training(1:50,1:3);
data3 = training(1:50,6);
x = [data2 data3];
k = [0,0,1,0]; %cost atau benefit
w = [3,5,4,1]; %bobot kriteria
%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
wn=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot
 
%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)

for j=1:n,
    if k(j)==0, wn(j)=-1*wn(j);
    end
end
for i=1:m,
    S(i)=prod(x(i,:).^wn);
end
 
V= S/sum(S); %%tahapan ketiga, proses perangkingan

for i=1:m,
    if V(i)==max(V)
        disp("Hasil = "+max(V)+" dengan Nomor rumah ke "+i);
    end
end;
