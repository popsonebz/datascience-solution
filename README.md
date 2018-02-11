# data science-solution 

1. clone the repository
```
git clone https://github.com/popsonebz/datascience-solution.git
```
```
cd datascience-solution
```

2. Run the command:
```
docker build -t myconda . 
```

3. Run the command:
```
docker run -it -p 9000:9000 myconda
```

4. Copy the url that shows on the terminal and paste on your browser. This will open a jupyter browser

5. Click the "home" folder

## For Data Science Task
6. click on "solution_to_data_science.ipynb" then execute the code sequentially.

## For Docker task one (pandas)
7. click on "pandas_notebook.ipynb" then execute the code sequentially.

## For Docker task two (spark)
8. click on "spark_notebook.ipynb" then execute the code sequentially.

### NOTE!!!
For Spark Task, this line of code has been changed from
```
csv_dataframe = spark.read.csv("file:///csv_path",header=True)
```
to
```
csv_dataframe = spark.read.csv(csv_path, header=True)
```
# SUMMARY
The following were observed in the dataset of step 6:
1. It describes the spending habit of genders across different age.
2. It has missing values in the gender feature.
3. There were some typographical errors in the spelling of "MALE".
4. The dataset had outliers in the age values such as 0, 201, .... These ages are not realistic.
5. Majority of the ammount spent by the realistic age (20 to 29) were less than 300.
6. It was observed that the average spending of males does not change significantly with increasing age.
7. There is a steady increase in the average spending of females as the age increases.
8. Though the average spending of males across the age range is greater than that of females, the difference reduces as the age increases.
# Business Insight
1. Investing in products whose price is less than 300 will yeild more sales when targeting the age group 20 to 29.
2. The males within this age group on an average can afford a little more than the females.
3. The females have the tendency to spend more than the females as the age progresses.
4. The company should investigate more into the outliers as there is a great deal spendings there.
