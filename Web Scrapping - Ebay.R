#robotstxt - to get permission, connectivity, etc.....
#rvest - to take the HTML scrapper point
library(robotstxt)
library(rvest)

#scrapping websites
url <- "https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313&_nkw=earphones&_sacat=0"

#allowability
path = paths_allowed(url)

#HTML elements from website
web <- read_html(url)

#segregating names
name <- web %>% html_nodes(".s-item__pl-on-bottom:nth-child(6) .s-item__title , .s-item__pl-on-bottom:nth-child(5) .s-item__title span , .s-item__pl-on-bottom:nth-child(4) .s-item__title span , .s-item--watch-at-corner:nth-child(3) .s-item__title span , .srp-river-answer--NAVIGATION_ANSWER_COLLAPSIBLE_CAROUSEL+ .s-item__pl-on-bottom .s-item__title span") %>%html_text()
View(name)

#segregating price
price <- web %>% html_nodes(".s-item__pl-on-bottom:nth-child(6) .s-item__price , .s-item__pl-on-bottom:nth-child(5) .s-item__price , .s-item__pl-on-bottom:nth-child(4) .s-item__price , .s-item--watch-at-corner:nth-child(3) .s-item__price , .srp-river-answer--NAVIGATION_ANSWER_COLLAPSIBLE_CAROUSEL+ .s-item__pl-on-bottom .s-item__price") %>%html_text()
View(price)

#segregating origin
origin <- web %>% html_nodes(".s-item--watch-at-corner:nth-child(3) .s-item__itemLocation , .s-item__pl-on-bottom:nth-child(4) .s-item__itemLocation , .s-item__pl-on-bottom:nth-child(5) .s-item__itemLocation , .s-item__pl-on-bottom:nth-child(6) .s-item__itemLocation , .srp-river-answer--NAVIGATION_ANSWER_COLLAPSIBLE_CAROUSEL+ .s-item__pl-on-bottom .s-item__itemLocation") %>%html_text()
View(origin)

#segregating sold
sold <- web %>% html_nodes(".s-item--watch-at-corner:nth-child(3) .BOLD , .s-item__pl-on-bottom:nth-child(6) .BOLD , .s-item__pl-on-bottom:nth-child(5) .BOLD , .s-item--watch-at-corner+ .s-item__pl-on-bottom .s-item__watchCountTotal .BOLD , .srp-river-answer--NAVIGATION_ANSWER_COLLAPSIBLE_CAROUSEL+ .s-item__pl-on-bottom .s-item__quantitySold .BOLD") %>%html_text()
View(sold)

#creating dataframe
ebay <- data.frame(name, price, origin, sold)
View(ebay)

#saving data
write.csv(ebay,"mov.csv")
