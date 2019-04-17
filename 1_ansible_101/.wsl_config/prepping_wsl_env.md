```bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install python-dev libkrb5-dev krb5-user python-pip -y
sudo pip install ansible pywinrm kerberos requests-kerberos requests-credssp --upgrade -y
```

add this section to /etc/wsl.conf

```vi
[automount]
options = "metadata,umask=22,fmask=11"
```


exit and reload bash.  this mount option will allow you to modify permissions so that ansible can read the ansible.cfg file in your project directory.  The umask setting will cause all new files and directories to have permissions compatible with ansible

if you already have files and folders created, cd to ansible directory and run `chmod 755 . -R' to set the permissions to a compatible value