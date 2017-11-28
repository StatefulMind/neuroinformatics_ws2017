clear all
close all

%% d = 1

x = [];
B01 = [];
B11 = [];
B21 = [];
i = 1;
for j = -5:.01:5
    x(i) = j;
    B01(i) = 0;
    B11(i) = 0;
    B21(i) = 0;
    if j >= -3 && j < -2
        B01(i) = 1;
    end
    if j >= -2 && j < -1
        B11(i) = 1;
    end
    if j >= -1 && j < -0
        B21(i) = 1;
    end
    i = i+1;
end

figure(1)
subplot(4,3,1)
plot(x,B01,'Color','red','LineWidth',2)
axis([-3 1 0 max(B01)*1.2])
xlabel('x','FontSize',16)
title('B_{0,1}','FontSize',16)
set(gca,'FontSize',16)

subplot(4,3,2)
plot(x,B11,'Color','red','LineWidth',2)
axis([-3 1 0 max(B11)*1.2])
xlabel('x','FontSize',16)
title('B_{1,1}','FontSize',16)
set(gca,'FontSize',16)

subplot(4,3,3)
plot(x,B21,'Color','red','LineWidth',2)
axis([-3 1 0 max(B21)*1.2])
xlabel('x','FontSize',16)
title('B_{2,1}','FontSize',16)
set(gca,'FontSize',16)

%% d = 2

B02 = conv(B01,B01);
B02 = B02./max(B02);
B02 = B02(find(x==-3):length(B02));
B02 = B02(1:length(x));

B12 = [zeros(1,100),B02];
B12 = B12(1:length(x));

B22 = [zeros(1,200),B02];
B22 = B22(1:length(x));

subplot(4,3,4)
plot(x,B02,'Color','red','LineWidth',2)
axis([-3 1 0 max(B02)*1.2])
xlabel('x','FontSize',16)
title('B_{0,2}','FontSize',16)
set(gca,'FontSize',16)

subplot(4,3,5)
plot(x,B12,'Color','red','LineWidth',2)
axis([-3 1 0 max(B12)*1.2])
xlabel('x','FontSize',16)
title('B_{1,2}','FontSize',16)
set(gca,'FontSize',16)

subplot(4,3,6)
plot(x,B22,'Color','red','LineWidth',2)
axis([-3 1 0 max(B22)*1.2])
xlabel('x','FontSize',16)
title('B_{2,2}','FontSize',16)
set(gca,'FontSize',16)

%% d = 3

B03 = conv(B01,B02);
B03 = B03./max(B03);
B03 = B03(find(x==-3):length(B03));
B03 = B03(1:length(x));

B13 = [zeros(1,100),B03];
B13 = B13(1:length(x));

B23 = [zeros(1,200),B03];
B23 = B23(1:length(x));

subplot(4,3,7)
plot(x,B03,'Color','red','LineWidth',2)
axis([-3 1 0 max(B03)*1.2])
xlabel('x','FontSize',16)
title('B_{0,3}','FontSize',16)
set(gca,'FontSize',16)

subplot(4,3,8)
plot(x,B13,'Color','red','LineWidth',2)
axis([-3 1 0 max(B13)*1.2])
xlabel('x','FontSize',16)
title('B_{1,3}','FontSize',16)
set(gca,'FontSize',16)

subplot(4,3,9)
plot(x,B23,'Color','red','LineWidth',2)
axis([-3 1 0 max(B23)*1.2])
xlabel('x','FontSize',16)
title('B_{2,3}','FontSize',16)
set(gca,'FontSize',16)

%% d = 4

B04 = conv(B01,B03);
B04 = B04./max(B04);
B04 = B04(find(x==-3):length(B04));
B04 = B04(1:length(x));

B14 = [zeros(1,100),B04];
B14 = B14(1:length(x));

B24 = [zeros(1,200),B04];
B24 = B24(1:length(x));

subplot(4,3,10)
plot(x,B04,'Color','red','LineWidth',2)
axis([-3 1 0 max(B04)*1.2])
xlabel('x','FontSize',16)
title('B_{0,4}','FontSize',16)
set(gca,'FontSize',16)

subplot(4,3,11)
plot(x,B14,'Color','red','LineWidth',2)
axis([-3 1 0 max(B14)*1.2])
xlabel('x','FontSize',16)
title('B_{1,4}','FontSize',16)
set(gca,'FontSize',16)

subplot(4,3,12)
plot(x,B24,'Color','red','LineWidth',2)
axis([-3 1 0 max(B24)*1.2])
xlabel('x','FontSize',16)
title('B_{2,4}','FontSize',16)
set(gca,'FontSize',16)


