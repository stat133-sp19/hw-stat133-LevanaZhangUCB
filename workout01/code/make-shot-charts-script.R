library(grid)
library(jpeg)
library(ggplot2)
# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
pdf("../images/stephen-curry-shot-chart.pdf",6.5,5)
curry_shot_chart
dev.off()
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
pdf("../images/kevin-durant-shot-chart.pdf",6.5,5)
durant_shot_chart
dev.off()
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Klay (2016 season)') +
  theme_minimal()
pdf("../images/draymond-green-shot-chart.pdf",6.5,5)
green_shot_chart
dev.off()
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
pdf("../images/andre-iguodala-shot-chart.pdf",6.5,5)
iguodala_shot_chart
dev.off()
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
pdf("../images/klay-thompson-shot-chart.pdf",6.5,5)
thompson_shot_chart
dev.off()
gsw_shot_charts <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('All GSW Shot Charts (2016 season)') +
  theme_minimal() +
  facet_wrap(~ name)
pdf("../images/gsw-shot-charts.pdf",8,7)
gsw_shot_charts
dev.off()
png("../images/gsw-shot-charts.png",8,7,units="in",res=1000)
gsw_shot_charts
dev.off()