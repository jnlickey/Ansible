# AWX Inventory
Anyone vaguely familiar with Ansible Tower (AWX) should know that the inventory that is ran via the GUI interface is not accessible via the CLI. Therefore if you want to run AD-HOC commands like:

```
ansible-playbook -b -T1200 -l server01 MyAnisblePlaybook.yml
```

You will need to have an Ansible inventory file created. Now there are multiple ways that this can be done, but the fastest is to use Ansible's default location of `/etc/ansible/hosts`

## Building AD-HOC Inventory
The BuildInventory.sh script utilizes the 'tower-cli' command to pull out all hosts from Ansible Tower (AWX), and stores them in a single list inside of a file. In addition, I use logrotate to keep a weeks worth of history, and to update the inventory file daily.


### Setting Things Up
To install logrotate, if not already installed, run the following commands for your distro:

```
# Debian/Ubuntu systems
apt install logrotate -y

# RedHat/CentOS/Rocky & Alma Linux
dnf install logrotate -y
or
yum install logrotate -y
```

Next, download the logrotate file `ansible_inventory_logrotate` and place it in the logrotate directory, like below:

```
/etc/logrotate.d/ansible_inventory_logrotate
```

Then place the `BuildInventory.sh` script in the following directory path:

```
/usr/local/scripts/BuildInventory.sh
```

Create a backup of the original /etc/ansible/hosts file by moving it:

```
mv /etc/ansible/hosts /etc/ansible/hosts.orig
```

Create a symlink to the new inventory file that will be created to the /etc/ansible/hosts location:

```
ln -s  /usr/local/ansible/inventory /etc/ansible/hosts
```

Finally, build the first inventory file: /usr/local/ansible/inventory

```
/usr/local/scripts/BuildInventory.sh
```

Then you can test run logrotate using:
```
logrotate -d /etc/logrotate.d/ansible_inventory_logrotate
```
