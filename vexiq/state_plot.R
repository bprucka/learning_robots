library(tidyverse)
library(readxl)
library(plotly)

setwd("~/learning_robots/vexiq/")
dt_vex = read_excel("data/VexData.xlsx")

dt_vex %>% ggplot(aes(x=Rank,y=`Total Highscore`)) + geom_line() + xlab("2020 Indiana State Ranking")

dt_propPlot <- dt_vex %>% filter(`Total Highscore`>0) %>% mutate(propProgram=`Programming Highscore`/`Total Highscore`)
dt_propPlot %>% filter(Rank<=100) %>% ggplot(aes(x=Rank,y=propProgram)) + geom_line() + geom_smooth() + xlab("2020 Indiana State Ranking (Top 100)") +
            ylab("Programming Score / Total Score")


## Build plot dataset
dt_plot <- dt_vex %>% select(Rank,Team,`Driver Highscore`,`Programming Highscore`) %>% group_by(Rank,Team) %>%
              gather("Skill","Score",`Driver Highscore`,`Programming Highscore`)

ggplotly(dt_plot %>% ggplot(aes(x=Rank,y=Score,fill=Skill)) + geom_bar(position="stack",stat="identity") + xlab("2020 Indiana State Ranking"))



