# RemoteCopy

This Ansible playbook was written to copy individual files between two different servers without the need to use rsync, scp, or some other means.

Make a directory /usr/local/scripts

Place RemoteCopy.yml and rc.sh in /usr/local/scripts

Create an SSH KEY PAIR or use one that has access to all servers that you are wanting to use this script on.

Update the private key path in rc.sh to use your key:

```
--private-key /path/to/<SSHKEY>
```
Create an alias in /home/&#60;user&#62;/.bashrc
```
alias rc='/usr/local/scripts/rc.sh'
```
Now source the .bashrc
```
source /home/<user>/.bashrc
or
. /home/<user>/.bashrc`
```

You now should be able to run the following command:
```
rc <ServerToCopyFROM> </path/to/file/to/copy> <ServerCopyFileTO> </path/to/directory/on/remote/server/to/Copy/file/to/>

* NOTE: Ending directory should include trailing slash (e.g. dir/)
```
