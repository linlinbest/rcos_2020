FROM amazonlinux

# RUN yum update -y

# Install Golang
RUN yum install -y golang

# Install Gocv and Opencv
RUN go get -u -d gocv.io/x/gocv
WORKDIR $GOPATH/src/gocv.io/x/gocv
RUN make install



# Add code
# WORKDIR /
# RUN mkdir /backend
# ADD <Path to the source code> /backend
# WORKDIR /backend



# Create zip files for Lambda Layer deployment (only include dynamic library)
WORKDIR /usr/local/opencv/build/bin
RUN zip -r9 /usr/local/opencv.zip .
RUN rm -rf /usr/local/opencv/build/bin




# Command to run the image produced
# docker run -t -i image /bin/bash