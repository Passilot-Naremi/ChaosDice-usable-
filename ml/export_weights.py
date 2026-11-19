import json
import math
import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

df = pd.read_csv("rolls.csv")

features = ["hp", "rolls_survived", "rolls_until_pity"]
target = "is_high_risk_roll"

X = df[features].values
y = df[target].values

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.25, random_state=42, stratify=y
)

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)

clf = LogisticRegression()
clf.fit(X_train_scaled, y_train)

exported = {
    "features": features,
    "mean": scaler.mean_.tolist(),
    "scale": scaler.scale_.tolist(),
    "weights": clf.coef_[0].tolist(),
    "bias": float(clf.intercept_[0]),
}

with open("model_weights.json", "w", encoding="utf-8") as f:
  json.dump(exported, f, indent=2)

print("Exported model_weights.json successfully.")


# Parity check: compute probability purely from exported JSON values
def manual_predict_proba(payload: dict, sample: list[float]) -> float:
  z = payload["bias"]
  for val, m, s, w in zip(
      sample, payload["mean"], payload["scale"], payload["weights"]
  ):
    scaled = (val - m) / s
    z += w * scaled
  return 1.0 / (1.0 + math.exp(-z))


test_sample = [2, 11, 4]
sklearn_prob = float(
    clf.predict_proba(scaler.transform([test_sample]))[0, 1]
)
json_prob = manual_predict_proba(exported, test_sample)

print(f"scikit-learn prob: {sklearn_prob:.8f}")
print(f"JSON formula prob: {json_prob:.8f}")
print(f"Difference:        {abs(sklearn_prob - json_prob):.2e}")