# dev-docker

This project provides Docker Compose configurations for setting up development environments for various big data and database technologies. Each subdirectory contains a `docker-compose.yml` file tailored for a specific technology stack.

## Services

### Spark Development Environment

Located in `spark-dev/docker-compose.yml`, this setup includes:

- **spark-master**: The Spark master node.
- **spark-worker**: Spark worker nodes.

### Hive Development Environment

Located in `hive-dev/docker-compose.yml`, this setup includes:

- **mysql**: MySQL database for Hive metastore.
- **namenode**: Hadoop Namenode.
- **datanode**: Hadoop Datanode.
- **hive-metastore**: Hive metastore service.
- **hive-server**: Hive server.

### Flink Development Environment

Located in `flink-dev/docker-compose.yml`, this setup includes:

- **jobmanager**: Flink JobManager.
- **taskmanager**: Flink TaskManagers.

### Database Development Environment

Located in `db-dev/docker-compose.yml`, this setup includes:

- **elasticsearch**: Elasticsearch service.
- **kibana**: Kibana for Elasticsearch.
- **mysql**: MySQL database.
- **postgresql**: PostgreSQL database.
- **clickhouse**: ClickHouse database.
- **redis**: Redis database.

### Observe Development Environment
Located in `observe-dev/docker-compose.yml`, this setup includes:
- **prometheus**: Prometheus monitoring system.
- **grafana**: Grafana for visualizing Prometheus metrics.

## Usage

1. Navigate to the desired subdirectory.
2. Run `docker-compose up` to start the services.
3. Access the services via the exposed ports as defined in the `docker-compose.yml` files.

## Notes

- Ensure Docker and Docker Compose are installed on your machine.
- Adjust the configurations as needed for your specific development requirements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
