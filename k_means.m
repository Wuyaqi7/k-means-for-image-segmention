close all;   %matlab代码
clear all;
clc

k=2;
org = imread('HZAU.jpg');        %读入图像
figure;
subplot(2,2,1);
imshow(org),title('原始图像');    %显示原图像

% 接下来需要知道图片的尺寸（长和宽），如若直接对RGB图像进行操作，如下                   
%转化为灰度图
gray=rgb2gray(org);
[m,n]=size(gray); %m,n为所求，p=3为通道数

% 将图像进行RGB——3通道分解 % org(:, :, 1)......分别代表rgb通道
A = reshape(org(:, :, 1), m*n, 1);   
B = reshape(org(:, :, 2), m*n, 1);
C = reshape(org(:, :, 3), m*n, 1);
data = [A B C]; % r g b分量组成样本的特征，每个样本有三个属性值，共width*height个样本

% 第二张图
% kmeans第一个参数: N*P的数据矩阵，N为数据个数，P为单个数据维度
res = kmeans(double(data), k);        
result = reshape(res, m, n);             % 反向转化为图片形式
subplot(2,2,2);
% label2rgb功能是转换标记矩阵到RGB图像
imshow(label2rgb(result)),title(strcat('K=',num2str(k),'时RGB通道分割结果')); %显示分割结果

% 第三张图
res = kmeans(double(data), k+1);    
result = reshape(res, m, n);     
subplot(2,2,3);
imshow(label2rgb(result)),title(strcat('K=',num2str(k+1),'时RGB通道分割结果'));   

% % 第四张图
res = kmeans(double(data), k+2);    
result = reshape(res, m, n);     
subplot(2,2,4);
imshow(label2rgb(result)),title(strcat('K=',num2str(k+2),'时RGB通道分割结果'));