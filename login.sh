#export Q_FMT="%.7i %.9P %.7j %.2t %.10M %.5D %.3c %.3C %.12R %k"
export Q_FMT="%.7i %.9P %.7j %.4t %.12M %.12l %.5D %.3c %.3C %.12R %.12k"
export Q_FMT_WP="%.7i %.9P %.12j %.7T %.12M %.12l %.5D %.3C %.12k"

mq() {
  args="${@}"
  fmt="${Q_FMT}"
  squeue -o "${fmt}" | head -1
  if [[ -z "${args}" ]]; then
    squeue -h -S i -o "${fmt}" -u $USER
  else
    squeue -h -S i -o "${fmt}" -u $USER | egrep -v "${args}"
  fi
}

mqwp() {
  # For getting information to mathpost
  args="${@}"
  fmt="${Q_FMT_WP}"
  squeue -o "${fmt}" | head -1
  if [[ -z "${args}" ]]; then
    squeue -h -S i -o "${fmt}" -u $USER
  else
    squeue -h -S i -o "${fmt}" -u $USER | egrep -v "${args}"
  fi
}

mqp() {
	# For when the job ID is all that is needed
  yq | egrep "${@}" | awk '{print $1}'
}

yip() {
  args="${@}"
  fmt='%10N %.10P %.3r %.6D %.6a %.18C %.12O %E'
  sinfo -o "${fmt}" "${args}"
}

ypl() {
  args="${@}"
  fmt='%.10P %.5r %.6D %.18C'
  sinfo -o "${fmt}" "${args}"
}

sai() {
  # Slurm Acct Info
  args="${@}"
  sacctmgr list user $USER witha ${args[@]}
}


export SCRATCH=/scratch/fjcasti1
export EDITOR=vim

touchallfiles() {
  arg="${1:-}"
  echo "Touching all files in directory ${arg}"
  nice find ${arg} | parallel -Xj1 touch &
}

cdscratch() {
  arg="${1:-}"
  echo 'Changing into scratch directory'
  cd "$SCRATCH/${arg}"
}

cdteam() {
  arg="${1:-}"
  REPO=$HOME/asu-lofertgroup/kiko
  echo 'Changing into team repo directory'
  cd "${REPO}/${arg}"
}

tmp() {
  echo 'Changing into tmp directory'
  cd "/tmp"
  mkdir -p "tmpkiko"
  cd "tmpkiko"
  ls
}

load_git() {
  echo 'Loading git'
  module load git/2.16.2
}

load_intel() {
  echo 'Loading intel'
  module load intel/2018x
}

load_intelmpi() {
  echo 'Loading intel'
  module load intel-mpi/2018x
}
#load_intel
#load_git
