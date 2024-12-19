
library(ggstatsplot)
library(statsExpressions)
library(easystats)
library(ggplot2)
library(ggridges)
library(dplyr)
library(insight)


# ANOVA
oneway_anova(data = mtcars, 
             x = cyl, 
             y = wt, 
             type = "nonparametric")



ggstatsplot::ggbetweenstats(data = iris, 
                            title = "ANOVA 1 Factor",
                            xlab = "Tipo de Espécies",
                            ylab = "EIXO Y",
                            x = Species, 
                            y = Sepal.Length,
                            type = "parametric",
                            conf.level = 0.95,
                            pairwise.display = "all",
                            p.adjust.method = "holm"
                            #violin.args = list(width = 0),
                            #boxplot.args = list(width = 0)
                            )


set.seed(123)
results_data <- oneway_anova(data = iris,
                             x = Species, 
                             y = Sepal.Length, 
                             type = "robust")

# RidgePlot
ggplot2::ggplot(iris, 
                aes(x = Sepal.Length, 
                    y = Species,
                    fill = Species
                 )) +
  ggridges::geom_density_ridges2(fill = "lightblue",
                                 quantile_lines = TRUE, 
                                 quantiles = 2, # mediana
                                 scale = 1,
                                 jittered_points = TRUE, 
                                 position = "points_sina"
                                 ) +
ggridges::theme_ridges()+
ggplot2::theme_gray(base_size = 12) +
  #facet_wrap(~Species) +
  labs(
    title = "ANOVA 1 FACTOR",
    subtitle = results_data$expression[[1]]
  )







