docker build -t automatedsetup .
docker run  -it -v ${PWD}:/root/reports/ automatedsetup:latest
