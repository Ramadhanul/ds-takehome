# install.packages("glmtoolbox")
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("readr")

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
calib_data <- data %>%
  mutate(bin = ntile(pred_prob, 10)) %>%
  group_by(bin) %>%
  summarise(
    mean_pred = mean(pred_prob),
    mean_actual = mean(actual_default)
  )

# Plot kalibrasi
ggplot(calib_data, aes(x = mean_pred, y = mean_actual)) +
  geom_line(color = "blue") +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "gray") +
  labs(title = "Calibration Curve", x = "Predicted Probability", y = "Observed Default Rate") +
  theme_minimal()

ggsave("calibration_curve.png")


# Fungsi konversi probabilitas ke skor industri
prob_to_score <- function(prob, min_score = 300, max_score = 850) {
  return(min_score + (1 - prob) * (max_score - min_score))
}

# Hitung skor per applicant
data$score <- prob_to_score(data$pred_prob)

# Cari cutoff skor untuk expected default ≤ 5%
cutoff_score <- min(data$score[data$pred_prob <= 0.05])

# Print hasilnya
print(paste("Cut-off score untuk expected default ≤ 5%: ", round(cutoff_score, 2)))
