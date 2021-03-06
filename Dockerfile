# Base this docker container off the official golang docker image.
# Docker containers inherit everything from their base.
FROM golang:1.8.3
# Create a directory inside the container to store all our application and then make it the working directory.
RUN mkdir -p /go/src/citest
WORKDIR /go/src/citest
# Copy the example-app directory (where the Dockerfile lives) into the container.
COPY . /go/src/citest
# Download and install any required third party dependencies into the container.
RUN go get ./server
# Set the PORT environment variable inside the container
ENV PORT 5000
# Expose port 8080 to the host so we can access our application
EXPOSE 5000
# Now tell Docker what command to run when the container starts
#CMD ["go-wrapper","run"]
CMD go run /go/src/citest/server/main.go
