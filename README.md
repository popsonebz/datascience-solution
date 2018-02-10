# datascience-solution1. 

1. clone the repository

3. Run the command:
```
docker build -t myconda . 
```

4. Run the command:
```
docker run -it -p 9000:9000 myconda
```

5. Copy the url that shows on the terminal and paste on your browser. This will open a jupyter browser

6. Click the "home" folder

7. For Pandas Task,  click on "pandas_notebook.ipynb" then execute the code sequentially.

8. NOTE!!!
For Spark Task, this line of code has been changed from
```
csv_dataframe = spark.read.csv("file:///csv_path",header=True)
```
to
```
csv_dataframe = spark.read.csv(csv_path, header=True)
```
