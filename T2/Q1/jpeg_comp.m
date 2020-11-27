function I_out = jpeg_comp(I_in, qual)
% JPEG_COMP aplica o algoritmo compressão baseline JPEG 
% a uma imagem, que consiste em uma transformada do cosseno,
% quantização e o processo reverso
%
% I_in   -- uma imagem MxN
% qual   -- inteiro - a qualidade da compressão, quanto mais alta, menos 
%           comprimida é a imagem
%
% retorna uma imagem MxN uint8

I = double(I_in);

% centraliza os valores da imagem
I = I - 128;

% aplica a transformada do cosseno em blocos de tamanho 8
dct_matrix = blockproc(I,[8, 8],@(block_struct)dct2(block_struct.data));


original_quant_matrix =[16 11 10 16 24 40 51 61       
              12 12 14 19 26 58 60 55
              14 13 16 24 40 57 69 56
              14 17 22 29 51 87 80 62
              18 22 37 56 68 109 103 77
              24 35 55 64 81 104 113 92
              49 64 78 87 103 121 120 101
              72 92 95 98 112 100 103 99];

% modifica a matriz de quantização de acordo com a qualidade desejada 
if (qual < 50)
    S = 5000/qual;
else
    S = 200 - 2*qual;
end

quant_matrix = floor((S*original_quant_matrix + 50) / 100);
quant_matrix(quant_matrix == 0) = 1;

% quantização dos quocientes dct
cod_matrix = blockproc(dct_matrix, [8, 8], @(block_struct) round((block_struct.data)./quant_matrix));

% desquantização dos quocientes
dequant_matrix = blockproc(cod_matrix, [8, 8], @(block_struct) quant_matrix .* block_struct.data);

% transformada inversa do cosseno
idct_matrix =  blockproc(dequant_matrix,[8, 8],@(block_struct)idct2(block_struct.data));

%transforma resultado em imagem
I_out = mat2gray(idct_matrix);


