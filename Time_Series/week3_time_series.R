library(timeSeries)
library(forecast)

simple_ts<-ts(c(35,25,30,35,32))
is.ts(simple_ts)
# ��Ȱ�����(smoothing) ,�ʱⰪ�� ������ �״�� ����, h���ڷ� ������ �� ���� ����
simple_ts_fit<-ses(simple_ts, alpha = 0.2, initial='simple', h=3)
# ���յ�(fitted) ��
simple_ts_fit$fitted
summary(simple_ts_fit)
setwd('C:\\Users\\joyh1\\Desktop\\������_20-1\\R_data')
ses_pra<-read.csv("ses_pra.csv")
ses_pra_ts<-ts(ses_pra$sales, start=c(1987,1), frequency = 1)
# ���İ� ���� x -> ������ �˾Ƽ� ã����, initial='simple'�̸� ���İ� �����������!
ses_pra_fit<-ses(ses_pra_ts, initial='optimal',h=3)
ses_pra_fit
summary(ses_pra_fit)
# �ܼ�������Ȱ�� ������ ������ �׷��� �ð�ȭ
plot(ses_pra_fit)
# �ܼ�������Ȱ�� ������ fitted�� ������ �׷��� �� �߰��� �׸���
lines(fitted(ses_pra_fit), type='o', col='red')

## ����� oil data�� �غ���
library(fpp2)
oil_ts<-window(oil, start=1996)
# alpha=0.1�� ��
oil_ts_fit<-ses(oil_ts, alpha=0.1,initial='simple', h=5)
summary(oil_ts_fit)
plot(oil_ts_fit)
lines(fitted(oil_ts_fit), type='o', col='red')
# alpha=0.5�� �� -> RMSE�� alpha=0.1�� ������ ����
oil_ts_fit<-ses(oil_ts, alpha=0.5, initial='simple', h=5)
summary(oil_ts_fit)
plot(oil_ts_fit)
lines(fitted(oil_ts_fit), type='o', col='red')
# alpha=0.9�� �� -> RMSE�� alpha=0.5�� ������ ����
oil_ts_fit<-ses(oil_ts_fit, alpha=0.9, initial='simple', h=5)
summary(oil_ts_fit)
plot(oil_ts_fit)
lines(fitted(oil_ts_fit), type='o', col='red')
names(oil_ts_fit)
