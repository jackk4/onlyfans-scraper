
DOCKERFILE="onlyfans_scraper/dist/Dockerfile"
IMAGE_NAME="of-scraper"
DEFAULT_VERSION="latest"

BRANCH_NAME=$(git branch --show-current)

if [[ "$BRANCH_NAME" =~ ^release\/[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    IFS='/' read -ra X_TAG_NAME <<< "${BRANCH_NAME}"
    TAG_NAME=${X_TAG_NAME[1]}
else
    echo Unable to create a tag from branch name ["${X_TAG_NAME}"]. Make sure to only run this from a release branch.
    exit
fi

docker build \
    --tag "${IMAGE_NAME}:${TAG_NAME}" \
    --file "${DOCKERFILE}" .