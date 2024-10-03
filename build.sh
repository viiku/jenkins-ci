# Build jenkins image

docker build -t <image-name> -f Dockerfile.jenkins .

# Build jenkins agent image

docker build -t <image-name> -f Dockerfile.jenkins.agent .