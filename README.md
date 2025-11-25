# Ansible Role: vector
[![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)

## Description

Deploy [Vector](https://vector.dev) A lightweight, ultra-fast tool for building observability pipelines using ansible.

## Requirements

- Ansible >= 2.11 (It might work on previous versions, but we cannot guarantee it)
- Debian and python on deployer machine.

## Role Variables

All variables which can be overridden are stored in [defaults/main.yml](defaults/main.yml) file as well as in table below.

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `vector_version` | 0.31.0 | Vector package version. |
| `clickhouse.user`| logger | Default user for connect to clickhouse |
| `clickhouse.password`| logger | Default password for connect to clickhouse |
| `clickhouse.database`| logs | Default database on clickhouse |
| `clickhouse.table`| file | Default table on clickhouse |

## Example

### Playbook

```yaml
---
- name: CLICKHOUSE | Install
  hosts: clickhouse
  roles:
    - role: clickhouse
      tags: clickhouse
  vars:
    - vector_version: "0.31.0"
    - clickhouse:
      - user: "logger"
      - password: "logger"
      - database: "logs"
      - table: "file"

```

## License

This project is licensed under MIT License. See [LICENSE](/LICENSE) for more details.


## Author Information

[Vector](https://vector.dev/docs/) by [DATALOG](https://www.datadoghq.com/about/leadership/).

Role by `InfernoFeniks`.