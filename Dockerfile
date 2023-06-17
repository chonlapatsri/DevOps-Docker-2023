# Start from the alpine image that is smaller but no fancy tools
FROM ubuntu:20.04

# Use /usr/src/app as our workdir. The following instructions will be executed in this location.
WORKDIR /usr/src/app

# Update libraries and install curl
RUN apt-get update && apt-get -y install curl

# Copy the hello.sh file from this location to /usr/src/app/ creating /usr/src/app/hello.sh
COPY ask_website.sh .

# Alternatively, if we skipped chmod earlier, we can add execution permissions during the build.
RUN chmod +x ask_website.sh

# When running docker run the command will be ./hello.sh
CMD sh ask_website.sh