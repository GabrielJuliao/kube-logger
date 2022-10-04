#!/bin/sh

prep_term() {
  unset term_child_pid
  unse term_kill_needed
  trap 'handle_term' TERM INT
}

handle_term() {
  if [ "${term_child_pid}" ]; then
    kill -TERM "${term_child_pid}" 2>/dev/null
  else
    term_kill_needed="yes"
  fi
}

wait_term() {
  term_child_pid=$!
  if [ "${term_kill_needed}" ]; then
    kill -TERM "${term_child_pid}" 2>/dev/null
  else
    term_kill_needed="yes"
  fi
  wait ${term_child_pid} 2>/dev/null
  trap - TERM INT
  wait ${term_child_pid} 2>/dev/null
}

prep_term

# Base path for logs
export LOG_PATH=/var/log/xyz/kube-logger
# Path to security logs
export PATH_TO_SECURITY_LOGS=$LOG_PATH/security/$HOSTNAME
# PAth to run logs
export PATH_TO_RUN_LOGS=$LOG_PATH/run/$HOSTNAME

sudo mkdir -p -m 775 $PATH_TO_SECURITY_LOGS
sudo mkdir -p -m 775 $PATH_TO_RUN_LOGS

java -jar app.jar

wait_term