# Priorização de processo 103.6
# Exemplo: nice -n -1 bash count.sh 100000 A& bash count.sh 100000 B&
x="$1"
l=0
while [ $x -gt 0 ]; do
  if [[ ! l -eq $(( x*100/$1 )) ]]; then
    l=$(( x*100/$1 ))
    echo $2 $l%
  fi
  x=$(( x-1 ))
done
exit 0
