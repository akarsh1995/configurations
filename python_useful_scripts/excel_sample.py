#!python3.8
import pandas as pd
import sys


def sample_df(file_path: str, sample_size, output_file):
    sample_size = int(sample_size)
    excel = 'xlsx' in file_path
    output_format_excel = 'xlsx' in output_file
    if excel:
        df = pd.read_excel(file_path)
    else:
        df = pd.read_csv(file_path)

    if len(df) < sample_size:
        print('df has less number of rows than '
              'sample size no sampling is done.')
    else:
        df = df.sample(sample_size)
        if output_format_excel:
            df.to_excel(output_file, index=False)
        else:
            df.to_csv(output_file, index=False)

if __name__ == '__main__':
    _, file_path, sample_size, output_file = sys.argv
    sample_df(file_path, sample_size, output_file)
