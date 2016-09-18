
CD_DIR=${HOME}/.bash/plugins/cd

if [ -r $CD_DIR/cd ]; then
  . ${CD_DIR}/cd                      # enables extensible cd
  . ${CD_DIR}/cd-traverse             # enables descendant/ancestor traversal
  . ${CD_DIR}/cd-history              # ^, ^^, ^n, -n, ^regexp
  #. ${CD_DIR}/cd-ssh                  # does nothing unless you have sshfs
  . ${CD_DIR}/cd-archive              # does nothing unless you have archivemount
  #. ${CD_DIR}/cd-hdfs                 # does nothing unless you have hadoop-fuse-dfs
  #. ${CD_DIR}/cd-git                  # does nothing unless you have yagfs
  #. ${CD_DIR}/cd-nfs                  # does nothing unless you have mount.nfs
  #. ${CD_DIR}/cd-encfs                # does nothing unless you have encfs
  #. ${CD_DIR}/cd-dev                  # enables automounting for /dev/ entries
  #. ${CD_DIR}/cd-loop                 # enables mounting for loopback files
  #. ${CD_DIR}/cd-missing-mkdir        # mkdir -p if you cd someplace nonexistent
fi

