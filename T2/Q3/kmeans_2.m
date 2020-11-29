function [out] = kmeans_2(RGBImage, K, Iterations)
% initialize
% K sendo o numero desejado de clusters desejado.
% Iterations sendo o numero de iteracoes do kmeans.
I = im2double(RGBImage);

%   Reshape a matriz tridimencional RGB em uma matriz bidimencional onde cada
%   Canal de cor e agora representado em uma coluna do tamanho dim1(I)*dim2(I)
F = reshape(I,size(I,1)*size(I,2),3);                 

%   Randomicamente gere a posicao inicial dos clusters.                                           
ClusterCenters = F( ceil(rand(K,1)*size(F,1)) ,:);    

%   Tamanho de dim1F por numero de clusters + 2 (Para guardar o label do
% cluster assim como a distancia minima. 
DistLabels   = zeros(size(F,1),K+2);                                                                  

for n = 1:Iterations
    for i = 1:size(F,1)
        for j = 1:K
            DistLabels(i,j) = norm(F(i,:) - ClusterCenters(j,:));
        end
        [Distance, CN] = min(DistLabels(i,1:K));                    %Procura menor distancia, a guardando. Assim 
        DistLabels(i,K+1) = CN;                                     % como a label do cluster.   
        DistLabels(i,K+2) = Distance;                          
    end
    for i = 1:K
        A = (DistLabels(:,K+1) == i);                               % Calcula a nova posicao dos Clusters de acordo
        ClusterCenters(i,:) = mean(F(A,:));                         % com a media dos pixels associados a ele.
        if sum(isnan(ClusterCenters(:))) ~= 0                    
            NC = find(isnan(ClusterCenters(:,1)) == 1);             % Caso o novo valor nao seja valido, e randomicamente
            for Ind = 1:size(NC,1)                                  % gerado novamente.
                ClusterCenters(NC(Ind),:) = F(randi(size(F,1)),:);
            end
        end
    end
end

X = zeros(size(F));
% Remonta a matriz original com os valores de cada pixel de acordo com o
% cluster associado.
for i = 1:K
    idx = find(DistLabels(:,K+1) == i);
    X(idx,:) = repmat(ClusterCenters(i,:),size(idx,1),1);
end
%Retorna para o formato RGB
T = reshape(X,size(I,1),size(I,2),3);

out = T;

end

