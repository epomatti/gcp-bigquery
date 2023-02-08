# gcp-bigquery

Make sure to login with gcloud:

```
gcloud auth application-default login
```

Create the `.auto.tfvars` parameter:

```
project_id = "nodal-algebra-355718"
region     = "us-central1"
```

automated backups + enabled point-in-time recovery

Need to enable Dataflow


# BigQuery

create repository

grant bigquery user permission `roles/bigquery.user`

create workspace