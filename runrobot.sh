 #!/bin/bash
 docker build -t automatedsetup .
 docker image prune -f
 docker run --rm -e BROWSER=firefox  -it -v $(pwd)/reports/:/root/reports/ automatedsetup:latest