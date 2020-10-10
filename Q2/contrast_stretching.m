function I_out =contrast_stretching(I_in, a, b, va, vb)

alfa = va/a;
beta = (vb-va)/(b-a);
gamma = (255-vb)/(255-b);

[M, N]=size(I_in);
I_out=I_in;

 for i=1:M
     for j=1:N
           if I_in(i,j) < a
               I_out(i,j) = I_in(i,j)*alfa;
           elseif I_in(i,j) < b
               I_out(i,j) = beta*(I_in(i,j) - a) + va;
           else
               I_out(i,j) = gamma*(I_in(i,j) - b) + vb;
           end;
     end;
 end;
 figure, imshow(uint8(I_out))