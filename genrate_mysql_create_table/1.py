import pymysql
import pandas as pd



def generate_create_table_statement(db_name, file_name):
    print("hao")

if __name__ == '__main__':
    print("dsa")
    host = "47.101.39.39"
    user = "program"
    password = "Dev@mtxdb2021"
    database = ""

    connection = pymysql.connect(
        host=host,
        user=user,
        password=password
    )

    df = pd.read_csv("1.csv")
    db_li = df.values.tolist()
    # print(db_li)

    cursor = connection.cursor()
    





    with open("1.sql", "w") as f:
        for db_table in db_li:
            db_name = db_table[0].split('.')[0]
            f.write("\n\n\n" + db_name + "\n")

            query_create_table = "show create table {}".format(db_table[0])
            print(query_create_table)
            cursor.execute(query_create_table)
            results_2 = cursor.fetchall()
            for row in results_2:
                f.write(row[1]+'\n')

    # # print(li)
    # with open("1.sql", "w") as f:
    #     for str1 in db_table_li:
    #         f.write(str1 + '\n')
    # print(db_table_li)