t-deploy-lab() {

}

t-deploy-cluster() {

}

t-deploy-instances() {

}
#######
t-destroy-lab() {

}

t-destroy-cluster() {

}
# what about t-destroy-instances ?? 
#######
t-stop-managers(){

}

t-stop-msrs() {

}

t-stop-workers() {

}

t-stop-windows() {

}

#######
t-show-ip-managers() {

}

t-show-ip-msrs() {

}

t-show-ip-workers() {

}

t-show-ip-windows() {

}

t-show-ip-all() {
  t-show-ip-managers
  t-show-ip-msrs
  t-show-ip-workers
  # t-show-ip-windows   # if windows VMs exist 
}
######
t-show-dns-managers() {

}

t-show-dns-msrs() {

}

t-show-dns-workers() {

}

t-show-dns-windows() {

}

t-show-dns-all() {
  t-show-dns-managers
  t-show-dns-msrs
  t-show-dns-workers
  # t-show-dns-windows   # if windows VMs exist 
}
#####
t-show-hostname-managers() {

}

t-show-hostname-msrs() {

}

t-show-hostname-workers() {

}

t-show-hostname-windows() {

}
######
t-show-versions() {

}
######
t-show-creds-mke() {

}

t-show-creds-msr() {

}
######
t-show-access​-ke​y-linux() {

}

t-show-access​-ke​y-windows() {

}
#####
t-show-status-managers() {

}

t-show-status-msrs() {

}

t-show-status-workers() {

}

t-show-status-windows() {

}

t-show-status-all() {
  t-show-status-msrs
  t-show-status-msrs
  t-show-status-workers
  # t-show-status-wins  # if windows VMs exist 
}

#####
t-show-all() {

}
#####
usage1() {
  echo "t deploy lab|cluster|instances "
  echo "t show versions"
  echo "t show ip|dns|creds ...."
  echo "t show status|hostname managers|workers|msrs|windows "
}
######### Parsing starts here ########
if [ $# -lt 3 ]; then 
  if [ $# -eq 1 ]; then 
    usage1 
  elif [ $# -gt 4 ]; then 
    
  else 
    echo "You gave 3 or more args on $1"
  fi
fi

case "$1" in 
  "command01") func_c1 $1 $2 $3
               exit ;;
  "command02") func_c2 $1 $2 $3
               exit ;;
  *) echo $1 $2 $3 bad combination
     usagec12
     exit ;;
esac