require(ggplot2)

data('iris')
data('diamonds')

ggplot(iris) +
	geom_point(aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
	scale_color_northwestern()


ggplot(diamonds) +
  geom_histogram(aes(x = price, fill = cut)) +
  ggthemes::theme_fivethirtyeight()
