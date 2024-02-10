import pymysql
import pandas as pd 

# Establish a connection to the database
connection=pymysql.connect(host='localhost',user='root',password='root',db='pollution',unix_socket= '/Applications/MAMP/tmp/mysql/mysql.sock')
cursor=connection.cursor()

# Insert data into the Schema table:

schema = pd.read_csv('Schema.csv')
schema_values=schema.values

for row in schema.itertuples():
    cursor.execute("INSERT INTO `Schema` (Schema_ID, Measure, Description, Unit) VALUES (%s, %s, %s, %s)", row[1:])

# Insert data into the Constituency table:

constituency = pd.read_csv('Constituency.csv')
constituency_values=constituency.values

for row in constituency.itertuples():
    cursor.execute("INSERT INTO `Constituencies` (Constituency_ID, Region, MP_name) VALUES (%s, %s, %s)", row[1:])


# Insert data into the Station table:

station = pd.read_csv('Station.csv')
station_values=station.values

for row in station.itertuples():
    cursor.execute("INSERT INTO `Station` (Site_id, Station_name, Latitude, Longitude, Constituency_id) VALUES (%s, %s, %s, %s, %s)", row[1:])

# Insert data into the Reading table:

readings=pd.read_csv('Cropped and Cleansed Data.csv')
readings_values=readings.values

for i in range(readings_values.shape[0]) :
        cursor.execute(f"insert into `Reading` values ('{readings_values[i,0]}','{readings_values[i,1]}','{readings_values[i,2]}','{readings_values[i,3]}','{readings_values[i,4]}','{readings_values[i,5]}','{readings_values[i,6]}','{readings_values[i,7]}','{readings_values[i,8]}','{readings_values[i,9]}','{readings_values[i,10]}','{readings_values[i,11]}','{readings_values[i,12]}','{readings_values[i,13]}','{readings_values[i,14]}','{readings_values[i,15]}','{readings_values[i,16]}','{readings_values[i,17]}','{readings_values[i,18]}','{readings_values[i,19]}')")

#Commit all the changes in database:

connection.commit()

#Close the connection:
cursor.close()    
connection.close()
