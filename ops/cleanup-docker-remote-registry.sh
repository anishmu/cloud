source /home/stack/stackrc 

deletetags="12.0-20180529.1"

for tag in $deletetags; do
  for id in $( docker images | awk '{ print $3 }' | sort | uniq ); do
    for p in $(nova list | grep ACTIVE | awk -F= '{ print $2 }' | awk '{ print $1 }'); do
      ssh heat-admin@$p "sudo docker rmi -f $id" 
    done
  done
done
