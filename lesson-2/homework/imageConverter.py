import pyodbc
con_str = "DRIVER={SQL SERVER}; SEVER=JALOLKHX28DE; DATABASE=newDB; Trusted_Connection=yes;"
con = pyodbc.connect(con_str)
cursor = con.cursor()
cursor.execute(
    """
    select * from Images
    """
)
row = cursor.fetchone()

with open('img333.jpeg', 'wb') as img:
    img.write(row[1])
