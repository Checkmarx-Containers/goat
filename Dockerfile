FROM ghcr.io/cx-david-kesoshvili/alpine:3.15
FROM davidkesoshvili/wolfi:new
FROM checkmarx.jfrog.io/ast-docker/logs:00584fb
FROM 058264083262.dkr.ecr.us-east-1.amazonaws.com/davidk/dummy:3.15
FROM quay.io/david_kesoshvili/t2:3.15
FROM cxoneclouenginestest170625-aagfgjf2efgbbxck.azurecr.io/spinel-mysql:8.0
