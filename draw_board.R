library(ggplot2)
df <- data.frame(x = c(0:15), y = c(0:1))

ggplot(df) +
  geom_rect(xmin = -Inf, xmax = Inf,   ymin = -Inf, ymax = Inf, size = 2,   fill = "#D2B48C", color="black", alpha = 0.3)

+
  geom_rect(xmin = 0,    xmax = Inf, ymin = -Inf, ymax = 0,   fill = "#F5F5DC") +
  geom_rect(xmin = 0,    xmax = Inf, ymin = 0,    ymax = Inf, fill = "green") +
  geom_rect(xmin = -Inf, xmax = 0,   ymin = 0,    ymax = Inf, fill = "yellow") +
  geom_point(aes(x, y), size = 5)