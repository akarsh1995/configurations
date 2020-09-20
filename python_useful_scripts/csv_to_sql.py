# MYSql dump csv to database using pandas and sqlalchemy

import pandas as pd
from sqlalchemy import create_engine
import sys

engine_name = 'mysql+pymysql'
user = 'python_snipps'
password = 'password'
host = 'localhost'
table_name = 'sample'

db_connection_url = f'{engine_name}://{user}:{password}@{host}'


def dump_csv(connection_url, file_path, db, table, date_cols):
    # establish a connection.
    db_ = create_engine(connection_url)
    conn = db_.connect()
    # create a database if does not exist
    conn.execute(f'CREATE DATABASE IF NOT EXISTS `{db}`')
    conn.close()
    # parsing date columns if mentioned any.
    date_cols = [d.strip() for d in date_cols.split(',') if d]
    date_parser = lambda c: pd.to_datetime(c, errors='coerce')
    # using pandas to read the csv.
    df = pd.read_csv(file_path, parse_dates=date_cols or True,
                     date_parser=date_parser)
    # let's push the csv to the database.
    df.to_sql(name=table, con=db_, schema=db, if_exists="replace")
    # cleaning the leftovers.
    db_.dispose()

# using the function.
dump_csv(db_connection_url, file_path, db, table_name, date_cols)
