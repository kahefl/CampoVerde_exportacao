library(dplyr)
library(ggplot2)
library(readxl)
library(scales)

setwd("C:\\Users\\kahel\\OneDrive\\Documents\\Coisas do R\\scripts\\Campo_Verde\\exportacao")

exp <- read_excel('export_mes.xlsx')

options(scipen = 999)

cores_mes <- c("#1981CD",#Azul Tóquio, Janeiro
               "#FFFF00",#Amarelo, Fevereiro
               "#ADFF2F",#Amarelo Esverdeado, Março
               "#808000",#Oliva, Abril
               "#DE3163",#Cereja, Maio
               "#ED9121",#Cenoura, Junho
               "#FF2400",#Escarlate, Julho
               "#B53389",#Fandango, Agosto
               "#2E8B57",#Jade, Setembro
               "#C8A2C8",#Lilás, Outubro
               "#964b00",#Marrom, Novembro
               "#FBEC5D")#Milho, Dezembro

exp$meses = factor(exp$meses, levels=c("Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez"))

ggplot(exp, aes(x = "", y = valor,fill = meses)) +theme_classic()+
  geom_col(stat = "identity", position = "dodge")+
  scale_y_continuous(" ",limits = c(0, 65000000),expand = c(0, 0),labels = scales::dollar)+
  scale_fill_discrete(name = " ")+
  labs(x=" ",y=" ", title = " ")+
  facet_wrap(~anos, ncol = 2, switch = "x")+
  theme(legend.title = element_text(face = 'bold', size = 12),
        legend.position = "right",
        panel.grid.major.y = element_line(colour = "grey50", size=0.05, linetype = "dotted"),
        axis.text = element_text(colour = "black", size = 10),
        panel.spacing = unit(1, "cm"),panel.spacing.y = unit(0.23, "cm"),
        strip.text = element_text(size=11, face="bold"))+
  scale_fill_manual(values=cores_mes)

ggsave("CV_export.jpg", width = 8, height = 9.5)
