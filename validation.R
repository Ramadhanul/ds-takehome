# Load library
library(glmtoolbox)
library(dplyr)
library(ggplot2)
library(readr)

# Baca data prediksi dari Python
data <- read_csv("D:/Ramadhanul Husna/ds-takehome/notebooks/model_predictions_for_R.csv")

# Jika ingin uji HL Test, buat model glm pseudo
model <- glm(actual_default ~ pred_prob, data = data, family = binomial)

# Hosmer-Lemeshow test
hltest(model)

# Kurva Kalibrasi
data <- data %>%
  mutate(bin = ntile(pred_prob, 10)) %>%
  group_by(bin) %>%
  summarise(
    mean_pred = mean(pred_prob),
    mean_actual = mean(actual_default)
  )

ggplot(data, aes(x = mean_pred, y = mean_actual)) +
  geom_line(color = "blue") +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "gray") +
  labs(title = "Calibration Curve", x = "Predicted Probability", y = "Observed Default Rate") +
  theme_minimal()

ggsave("calibration_curve.png")
