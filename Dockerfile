FROM ghcr.io/cx-david-kesoshvili/alpine:3.15
FROM davidkesoshvili/wolfi:new
FROM checkmarx.jfrog.io/ast-docker/logs:00584fb
FROM 058264083262.dkr.ecr.us-east-1.amazonaws.com/davidk/dummy:latest
FROM quay.io/shaked_karta/cx_python:latest
