# Configure ssh forwarding

# RELAY=~/bin/npiperelay.exe
RELAY=npiperelay.exe
export SSH_AUTH_SOCK=$HOME/bin/agent.sock

ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
if [ $ALREADY_RUNNING -ne 0 ]; then
    # echo "no npiperelay process"
    rm -f $SSH_AUTH_SOCK
    echo "Create SSH agent pipe [no process]"
    (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"$RELAY -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
fi 
if [ ! -S $SSH_AUTH_SOCK ]; then
    # echo "no $SSH_AUTH_SOCK"
    echo "Create SSH agent pipe [missing socket]"
    (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"$RELAY -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
fi
