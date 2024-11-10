# Disclamer: use with caution. All the images below contain at least one malicious package!

# Dockerfile to pull all listed images, each line pulls a new image as a separate stage

# Stage to pull each image (using AS to tag each stage uniquely)
FROM vulhub/phpmyadmin:4.8.1 AS phpmyadmin
FROM library/golang:1.21.5-alpine3.19 AS golang1
FROM localstack/localstack-pro:2.3 AS localstack_pro2_3
FROM library/node:14.9.0-stretch AS node14
FROM library/node:12.16.0-alpine3.11 AS node12_16
FROM library/node:buster AS node_buster
FROM library/node:12-alpine AS node12_alpine
FROM library/golang:1.19.1-alpine3.16 AS golang19
FROM library/node:10 AS node10
FROM library/golang:1.20.6-alpine3.18 AS golang20_6
FROM confluentinc/cp-schema-registry:7.3.9 AS cp_schema_registry
FROM confluentinc/cp-zookeeper:7.1.1 AS cp_zookeeper7_1_1
FROM confluentinc/cp-enterprise-kafka:7.1.1 AS cp_kafka
FROM manifoldai/orbyter-ml-dev:3.5 AS orbyter
FROM mcr.microsoft.com/devcontainers/miniconda:0.203.0-3 AS miniconda
FROM library/golang:1.18-alpine3.15 AS golang18
FROM localstack/localstack:0.11.3 AS localstack
FROM localstack/localstack-pro:1.3 AS localstack_pro1_3
FROM library/golang:1.22 AS golang22
FROM confluentinc/cp-zookeeper:6.1.12 AS cp_zookeeper6_1_12
FROM jbroin/cxpoc:2020.2.4 AS cxpoc
FROM opensearchproject/opensearch-dashboards:1.1.0 AS opensearch_dashboards
FROM library/node:8-alpine AS node8_alpine
FROM mixmaxhq/arena:latest AS arena
FROM library/node:12.22-alpine AS node12_22
FROM datadog/agent:7.45.1-jmx AS datadog_agent
FROM library/golang:1.20 AS golang20
FROM vulhub/mongo-express:0.53.0 AS mongo_express
FROM registry.rocket.chat/rocketchat/rocket.chat:3.12.1 AS rocket_chat
FROM library/node:12 AS node12
