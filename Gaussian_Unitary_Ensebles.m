close all
s=zeros(1,1000);
diff_s=zeros(1,1000);
for j=1:1000
    a = normrnd(0,0.5,100)+i.*normrnd(0,0.5,100);
    M = (a + a')/2;
    for k=1:100
        M(k,k)=normrnd(0,1);
    end
    eigen=transpose(eig(M));
%     hist(eigen,10)
%     figure 
%     plot(eigen)
    diff_s(j)=eigen(76)-eigen(75);
    
end
mean_s=mean(diff_s);
s=diff_s/mean_s;
P2=@(s) 32.*s.^2.*exp(-4.*s.^2./pi)./(pi^2);%GUE
a=linspace(0,3,1000);
[f,x]=hist(s,50);%# create histogram from a normal distribution.
bar(x,f/trapz(x,f));hold on
plot(a,P2(a),'*');
xlabel('Normalized Spacing');
ylabel('probability');
title('GUE');
