import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

df = pd.read_csv("rolls.csv")

features = ["hp", "rolls_survived", "rolls_until_pity"]
target = "is_high_risk_roll"

X = df[features].values
y = df[target].values

# Split 75% train / 25% test, preserving the 0/1 ratio in both splits
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.25, random_state=42, stratify=y
)

# Fit scaler ONLY on training data to avoid data leakage
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Fit baseline Logistic Regression model
clf = LogisticRegression()
clf.fit(X_train_scaled, y_train)

# Check training and test accuracy
train_pred = clf.predict(X_train_scaled)
test_pred = clf.predict(X_test_scaled)

print(f"Train accuracy: {accuracy_score(y_train, train_pred):.2f}")
print(f"Test accuracy:  {accuracy_score(y_test, test_pred):.2f}")

print("\nLearned weights (coefficients) per feature:")
for name, coef in zip(features, clf.coef_[0]):
  print(f"  {name}: {coef:.4f}")

print(f"\nIntercept (bias): {clf.intercept_[0]:.4f}")