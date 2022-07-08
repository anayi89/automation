from google.cloud import bigquery
import os

def main():
    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'creds.json'
    project_name = input('Enter a name for the project: ')
    dataset_name = input("Enter a name for the dataset: ")
    table_name   = input("Enter a name for the table: ")
    client       = bigquery.Client(
        project=project_name,
        location='US'
    )
    client.create_dataset(dataset_name)
    client.create_table(f"{project_name}.{dataset_name}.{table_name}")
    filename = 'test_file.csv'

    # tell the client everything it needs to know to upload our csv
    dataset_ref = client.dataset(dataset_name)
    table_ref = dataset_ref.table(table_name)
    job_config = bigquery.LoadJobConfig()
    job_config.source_format = bigquery.SourceFormat.CSV
    job_config.autodetect = True

    # load the csv into bigquery
    with open(filename, "rb") as source_file:
        job = client.load_table_from_file(source_file, table_ref, job_config=job_config)

    job.result()

    query = f""" SELECT * 
            FROM `{project_name}.{dataset_name}.{table_name}`"""
    query_job = client.query(query)
    print(query_job)

if __name__ == '__main__':
    main()
