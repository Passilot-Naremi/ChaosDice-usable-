import pandas as pd

df = pd.read_csv("rolls.csv")

print("Shape (rows, columns):", df.shape)
print("\nData types:")
print(df.dtypes)

print("\nMissing values per column:")
print(df.isna().sum())

print("\nSummary statistics:")
print(df.describe())

print("\nTarget distribution (0 vs 1):")
print(df["is_high_risk_roll"].value_counts())

print("\nOut-of-range checks:")
print("hp < 0 or hp > 8:", ((df["hp"] < 0) | (df["hp"] > 8)).sum())
print("rolls_survived < 0:", (df["rolls_survived"] < 0).sum())
print(
    "rolls_until_pity < 1 or > 5:",
    ((df["rolls_until_pity"] < 1) | (df["rolls_until_pity"] > 5)).sum(),
)
print(
    "invalid target values:", (~df["is_high_risk_roll"].isin([0, 1])).sum()
)