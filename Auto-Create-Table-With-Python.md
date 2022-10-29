# Creating table for SQL by the use of Python 

## Steps for creating a table 

1. Open anaconda prompt. 

![image](https://user-images.githubusercontent.com/60937657/198824825-fd219baa-c73c-4de4-86d1-b20991616581.png)

2. Go to the directory where the file whose table has to be created is saved. 

```
ls # Used to look at the files in directory 
cd # Directory_name/file_name # Used to transfer in different file location 
```

3. Install csvkit by running below given command. 

![image](https://user-images.githubusercontent.com/60937657/198825032-f21529bd-a8ed-4621-98ec-fc848f516914.png)

```
pip install csvkit
```

4. After installing csvkit run the below given command 

![image](https://user-images.githubusercontent.com/60937657/198825123-5eaa4782-1655-44ea-a49f-1c72faa2266d.png)

```
csvsql --dialect mysql --snifflimit 100000 sales_data_final.csv > output_sales.sql
```

In the above code output_sales.sql is the file where the table is being created and from that file we can open the code in notepad and use it in sql workbench. 
