# data science-solution 

1. clone the repository

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
