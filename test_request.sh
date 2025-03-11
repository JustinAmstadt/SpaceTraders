set -a   # Automatically export all variables
source .env
set +a

# curl 'https://api.spacetraders.io/v2/my/agent' \
 # --header 'Authorization: Bearer '${AGENT_RED_TOKEN}''

 curl --request GET \
 --url 'https://api.spacetraders.io/v2/systems/X1-TZ54/waypoints?type=ENGINEERED_ASTEROID' \
 --header "Authorization: Bearer ${AGENT_RED_TOKEN}"