#read schedule
schedule <- read.csv('~/Dropbox/M/Bowie State/Bowie_State_BIOL_102/Final_schedule.csv')

schedule <- schedule %>%
  separate(col=Topic, into = c('Component', 'Topic'),sep = ': ', fill='left')

schedule$Component[is.na(schedule$Component)] <- 'Lecture'

write.csv(schedule, 'Final_schedule.csv', row.names = F)

