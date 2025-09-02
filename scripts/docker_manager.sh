MODE=$1

case "$MODE" in
  boot)
	./docker_boot.sh
	;;
  clean)
	./docker_boot_clean.sh
  *)
	echo "Unknown mode: $MODE"
	;;
esac
