%% Algoritmo do agrupamento por kmeans
function[codebook, ClusterNum] = kmeans_algoritmo(s, L, K)
% "s" é a célula com os vetores de entrada
%--------------------------------------------------
% Inicializa os K vetores (células) do dicionário com amostras aleatórias
codebook = cell(1, K);
indx = randsample(length(s), K);
for i=1 : K
	codebook{i} = s{indx(i)}
end
%--------------------------------------------------
% Atribui o número do cluster aos vetores de entrada
% Inicializa os valores de distorção:
% 	1o. elemento e 2o. elemento é o atual
vec_dist = cell(1, length(s));
ClusterNum = zeros(1, length(s));
Distortion = [0 0];
iter = 0;
while(iter<=2 || (Distortion(1)-Distortion(2))/Distortion(2)>0.9)
	iter = iter+1;
	Distortion(1) = Distortion(2);
	Distortion(2) = 0;
	for i=1 : length(s)
		% VEC_DIST é um array de células e cada célula é um vetor
		% cada célula é um array de distâncias dos vetores de entrada
		% aos K vetores do dicionário
		vec_dist{i} = dist(s{i}, reshape(cell2mat(codebook), L, length(codebook)));
		ClusterNum(i) = find(vec_dist{i} == min(vec_dist{i}), 1);
		Distortion(2) = Distortion(2) + min(vec_dist{i});
	end
	Distortion(2) = Distortion(2)/length(s);
	% Atualiza o dicionário substituindo cada vetor pela média do
	% conjunto de vetores de entrada correspondente
	for i=1 : K
		temp = reshape(cell2mat(s), L, length(s));
		codebook{i} = mean(temp(:, ClusterNum==i),2)';
	end
end
