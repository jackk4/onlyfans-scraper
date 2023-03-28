
DOCKERFILE="onlyfans_scraper/dist/Dockerfile"
IMAGE_NAME="of-scraper"
DEFAULT_VERSION="latest"

X_TAG_NAME=$(git branch --show-current)

if [[ "$X_TAG_NAME" =~ ^release\/[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    TAG_NAME=${X_TAG_NAME}
else
    echo Unable to create a tag from branch name ["${X_TAG_NAME}"]. Make sure to only run this from a release branch.
    exit
fi

docker build \
    --pull \
    --no-cache \
    --tag "${IMAGE_NAME}:${TAG_NAME}" \
    --file "${DOCKERFILE}" .