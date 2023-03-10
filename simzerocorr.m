%simzerocorr.m
%5.3.23

clc;
clear variables;

rng(3000,'twister'); 
k=1000; %number of samples
n=40;  %size of each sample

corrval=zeros(k,1); % an array to store the correlation coefficient
for i=1:k
    
    x=randn(n,1); %set up x variable
    y=randn(n,1); %set up y variable
    
    corrval(i)=corr(x,y); %record correlation
    
end

figure;
plot(linspace(1,k,k)',corrval,'ok');
xlabel('Sample number');
ylabel('Correlation coefficient');
hold on;

%work out percentiles for plotting
alpha=5; %type 1 error rate as a percentage
upperline=prctile(corrval, (100-alpha/2)).*ones(k,1);
lowerline=prctile(corrval, alpha/2).*ones(k,1);
plot(linspace(1,k,k)',upperline,'-b');
plot(linspace(1,k,k)',lowerline,'-b');
