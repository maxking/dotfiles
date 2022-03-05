ssh () {
	/usr/bin/ssh -t $@ "tmux attach || tmux new";
}

dcleanup(){
	# Cleanup the containers that have exit.
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	# Cleanup the images that are dangling i.e. not being used by any container.
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

m(){
	if [ -z "$1" ]; then
		echo "Usage: m {mailman,postorius,hyperkity...}"
		return
	fi
	project=$1
	root_dir=$HOME/Documents/mm3
	if [ ! -d "$root_dir/$project" ]; then
		echo "Project $project doesn't exist at path $root_dir"
		echo "These are all the directories at $root_dir:"
		ls $root_dir
		exit 1
	fi

	# cd to the project directory.
	echo "cd'ing to $project directory."
	cd $root_dir/$project
}
