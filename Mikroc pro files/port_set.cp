#line 1 "C:/Users/UCHIHA/Desktop/embedded system project/port_set.c"
void port_set(){
RCC_APB2ENR.IOPAEN=1;
RCC_APB2ENR.IOPBEN=1;
RCC_APB2ENR.IOPCEN=1;
RCC_APB2ENR.IOPDEN=1;
RCC_APB2ENR.IOPEEN=1;
GPIOA_CRL=0X44444444;
GPIOA_CRH=0X44444444;
GPIOB_CRL=0X44444444;
GPIOB_CRH=0X44444444;
GPIOC_CRL=0X44444444;
GPIOC_CRH=0X44444444;
GPIOD_CRL=0X44444444;
GPIOD_CRH=0X44444444;
GPIOE_CRL=0X33333333;
GPIOE_CRH=0X33333333; }
