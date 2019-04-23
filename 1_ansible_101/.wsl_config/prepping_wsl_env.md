```bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install python-dev libkrb5-dev krb5-user python-pip -y
sudo pip install ansible pywinrm kerberos requests-kerberos requests-credssp --upgrade -y
```

https://devblogs.microsoft.com/commandline/chmod-chown-wsl-improvements/


add this section to /etc/wsl.conf

```vi
[automount]
options = "metadata,umask=22,fmask=11"
```
Note: after Win10 1903 you have to wait a few minutes for something magical to happen for the new mount options to appear, or forcibly terminate the wsl session with `wsl.exe --terminate ubuntu`.  Or if you want it right now you can forcibly remount the volume
```
cd ~
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata,uid=1000,gid=1000,umask=22,fmask=11
cd -

exit and reload bash.  this mount option will allow you to modify permissions so that ansible can read the ansible.cfg file in your project directory.  The umask setting will cause all new files and directories to have permissions compatible with ansible

if you already have files and folders created, cd to ansible directory and run `chmod 755 . -R' to set the permissions to a compatible value