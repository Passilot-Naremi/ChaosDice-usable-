import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix
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
X_test_scaled = scaler.transform(X_test)

clf = LogisticRegression()
clf.fit(X_train_scaled, y_train)

test_pred = clf.predict(X_test_scaled)
test_prob = clf.predict_proba(X_test_scaled)[:, 1]

# 1. Majority-class baseline on test data
majority_class = int(np.bincount(y_train).argmax())
baseline_pred = np.full_like(y_test, majority_class)

print(f"Majority-class baseline ({majority_class}): {accuracy_score(y_test, baseline_pred):.2f}")
print(f"Logistic Regression test accuracy:     {accuracy_score(y_test, test_pred):.2f}")

# 2. Confusion matrix: rows = actual [0, 1], cols = predicted [0, 1]
print("\nConfusion matrix (rows=actual [0, 1], cols=predicted [0, 1]):")
print(confusion_matrix(y_test, test_pred))

# 3. Sanity-check sample game states: [hp, rolls_survived, rolls_until_pity]
scenarios = [
    ("Full HP, fresh run, pity in 5", [8, 0, 5]),
    ("Low HP (2), 4 rolls until pity", [2, 11, 4]),
    ("Low HP (1), pity next roll (1)", [1, 9, 1]),
    ("Mid HP (4), 2 rolls until pity", [4, 23, 2]),
]

print("\nSanity-check scenario probabilities (high risk):")
for label, row in scenarios:
  scaled_row = scaler.transform([row])
  prob = float(clf.predict_proba(scaled_row)[0, 1])
  print(f"  {label}: {prob:.2%}")