clyde() {
   case $1 in
       (-Ss | -Si | -Q* | -T | -G)
           /usr/bin/clyde "$@" ;;
       (-S* | -R* | -U | *)
           /usr/bin/sudo /usr/bin/clyde "$@" ;;
   esac
}
