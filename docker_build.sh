
DOCKERFILE="onlyfans_scraper/dist/Dockerfile"
IMAGE_NAME="of-scraper"
DEFAULT_VERSION="latest"

while getopts "t:" option; do
    case ${option} in
        t ) # Add tag
        X_TAG_NAME=$OPTARG
        ;;
    esac
done

TAG_NAME=${X_TAG_NAME:-DEFAULT_VERSION}

docker build \
    --pull \
    --no-cache \
    --tag "${IMAGE_NAME}:${TAG_NAME}" \
    --file "${DOCKERFILE}" .