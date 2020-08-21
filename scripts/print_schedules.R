#make html of tables

#dates for the week
datesXweek<- read.csv('week_dates.csv')

schedule<- schedule %>%
  inner_join(datesXweek)

html_schedule <- function(component){
  temp <- schedule %>%
    filter(Component==component) %>%
    select(Week, Dates, Topic, Assignments.due)%>%
    mutate(Assignments.due = gsub('\n', '<br>', Assignments.due))
  html_out <- temp %>% mutate_all(linebreak) %>%
    kable(booktabs = T, escape = F, col.names = c('Week', 'Date', 'Topic', "Assignments Due")) %>%
    kable_styling
  print(html_out)
}


html_schedule('Lecture')

html_schedule('Lab')
