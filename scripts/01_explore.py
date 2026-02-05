import pandas as pd

df = pd.read_csv("data/jobs.csv")

print(df.info())

# Average salary by experience
print(
    df.groupby("experience_level")["salary_in_usd"]
      .mean()
      .sort_values(ascending=False)
)

# Skill inference
def infer_primary_skill(title):
    title = title.lower()
    if "machine learning" in title:
        return "Machine Learning"
    elif "data scientist" in title:
        return "Python"
    elif "data analyst" in title:
        return "SQL"
    else:
        return "Other"

df["primary_skill"] = df["job_title"].apply(infer_primary_skill)

print(
    df.groupby("primary_skill")["salary_in_usd"]
      .mean()
      .sort_values(ascending=False)
)
