This is a Python application that uses vulnerable packages, so in use by running a code GET request outside every 5 seconds, while other vulnerable packages are not in use. 

Example should show the difference between scanning docker files and scanning the image created from the dockerfile itself.

By using Sysdig client - we can see the Runtime data from our cluster.

Image created from dockerfile: 
checkmarx.jfrog.io/docker/containers-python-demo:test

How to scan using CLI: 
./cx scan create --project-name along-python-demo-test -s C:/Users/along/Downloads/Demo-September --branch main --scan-types container-security --container-images checkmarx.jfrog.io/docker/containers-python-demo:test --debug