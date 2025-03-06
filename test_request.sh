set -a   # Automatically export all variables
source .env
set +a

# curl 'https://api.spacetraders.io/v2/my/agent' \
 # --header 'Authorization: Bearer '${AGENT_RED_TOKEN}''

 curl --request POST \
 --url 'https://api.spacetraders.io/v2/my/ships/AGENTRED-1/dock' \
 --header "Authorization: Bearer ${AGENT_RED_TOKEN}"