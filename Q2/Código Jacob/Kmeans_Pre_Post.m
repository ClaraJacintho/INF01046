function[I_re] = Kmeans_Pre_Post(I1, L, K)
%% Cria os vetores de dimensionalidade sqrt(L)^2 da imagem de entrada
% L deve ser quadrado (L=4 => 2x2, 16 => 4x4, 64...)
% K é o tamanho do dicionário, aumentando K maior o tempo de processamento
%--------------------------------------------------
% Rearranja os pixels da imagem em um array
% armazenando na célula "s" do array de células
s = cell(1, floor(numel(I1)/L));
I1_rows = size(I1, 1);
for j=1 : length(s)
	for i=1 : sqrt(L)
		s{j} = [s{j}, I1((i+floor((j-1)*sqrt(L)/I1_rows)*sqrt(L)-1)*I1_rows+1+rem(j-1, I1_rows/sqrt(L))*sqrt(L) : (i+floor((j-1)*sqrt(L)/I1_rows)*sqrt(L)-1)*I1_rows+(rem(j-1, I1_rows/sqrt(L))+1)*sqrt(L))];
	end
end
%--------------------------------------------------
% Chama o algoritmo do 'kmeans_clustering' com os parâmetros fornecidos
[codebook, ClusterNum] = kmeans_algoritmo(s, L, K);
%--------------------------------------------------
% Reconstroi a imagem com os vetores do dicionário (centróides dos K clusters)
s_re = cell(1, length(s));
for i=1 : length(s_re)
	s_re{i} = codebook{ClusterNum(i)};
end
I_re = zeros(size(I1));
for j=1 : length(s_re)
	for i=1 : sqrt(L)
		I_re( (i+floor((j-1)*sqrt(L)/I1_rows)*sqrt(L)-1)*I1_rows+1+rem(j-1, I1_rows/sqrt(L))*sqrt(L) : (i+floor((j-1)*sqrt(L)/I1_rows)*sqrt(L)-1)*I1_rows+(rem(j-1, I1_rows/sqrt(L))+1)*sqrt(L) ) = s_re{j}( 1+(i-1)*sqrt(L) : i*sqrt(L) );
	end
end
