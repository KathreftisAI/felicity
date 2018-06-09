# felicity

We're really excited to announce felicity (based on [OTRS](https://github.com/OTRS/otrs)) to the community. Our first ever community release. We've had about 5 years of experience in development of ITSM products like OTRS and have garnered good enough of knowledge to try and make the system robust enough for the community to experience which has useful service desk features.

# purpose
Our purpose on releasing felicity to the community was to share our own experiences and the add on features we developed in tandem with our clients. We thought the community should have this useful open source tool at their convenience. 

# installation

### A. Docker
  1. Prerequisites
  		- Install docker from <code>https://docs.docker.com/install/</code>.
      - Please make sure you have <code>docker-compose</code> installed. Windows and Mac OS docker installations will automatically ship <code>docker-compose</code>. If you don't have it then please refer <code>https://docs.docker.com/compose/install/</code>.
  2. Clone this repository using <code>git clone https://github.com/Unotechsoftware/felicity</code>.
  3. Check into the downloaded source code directory by running <code>cd felicity</code>.
  4. Once you're in felicity's directory, run <code>docker-compose up -d</code>.
  5. Wait until docker installs the required packages and sets up the system and then execute <code>docker ps</code> to see your containers running.
  6. Now, run <code>http://localhost:8000/felicity/installer.pl</code> and follow the steps to install felicity.
  
### B. CentOS

#### 1. Preparation: Disabling SELinux
<strong>Note:</strong> If your system uses SELinux, you should disable it, otherwise OTRS will not work correctly.
     
- Configure SELINUX=disabled in the ```/etc/selinux/config``` file:

"This file controls the state of SELinux on the system.
SELINUX= can take one of these three values:
enforcing - SELinux security policy is enforced.
permissive - SELinux prints warnings instead of enforcing.
disabled - No SELinux policy is loaded.
SELINUX=disabled
SELINUXTYPE= can take one of these two values:
targeted - Targeted processes are protected,
mls - Multi Level Security protection.
SELINUXTYPE=targeted"

Install the dependencies and devDependencies and start the server.

- Reboot your system. After reboot, confirm that the getenforce command returns Disabled:

```sh
$ getenforce
Disabled
```

#### 2. Move Zip/Cloned Repository

- Zip/Tar.gz download:
    - Extract the downloaded file.
    - Move the extracted files to <code>/opt/felicity</code>.

#### 3. Install Perl Modules
Use the following script to get an overview of all installed and required CPAN 
modules.

<strong>Note: </strong>Please note that Felicity requires a working Perl installation with all "core" modules such as the module version. These modules are not explicitly checked by the script. You may need to install a perl-core package on some systems like RHEL that do not install the Perl core packages by default.

```sh
$ perl /opt/felicity/bin/otrs.CheckModules.pl
o CGI..............................ok (v3.60)
o Crypt::PasswdMD5.................ok (v1.3)
o Crypt::SSLeay....................Not installed! (Optional - Required for Generic Interface SOAP SSL connections.)
o CSS::Minifier....................ok (v0.01)
o Date::Format.....................ok (v2.22)
o Date::Pcalc......................ok (v1.2)
...

```

To install missing Perl modules, you can:

a. Install the packages via the package manager CentOS
```sh
$ yum install "perl(Digest::MD5)"
```

b. Install the required modules via the CPAN shell

<strong>Note: </strong> When you're on Linux you should run CPAN as your superuser account because the modules should be accessible both by the OTRS account and the account under which the web server is running.

```sh
$ perl -MCPAN -e shell;
...
install Digest::MD5
install Crypt::PasswdMD5
...
```
Any optional modules listed by the script should be installed depending on the special requirements of the target system.

#### 4. Create OTRS User

```sh
$ useradd -d /opt/felicity -c 'Felicity user' otrs
```

Add user to webserver group (if the webserver is not running as the OTRS user):
```sh
$ usermod -G www otrs
(SUSE=www, Red Hat/CentOS/Fedora=apache, Debian/Ubuntu=www-data)
...

```

#### 5. Activate Default Config File
There is one Felicity config file bundled in $Felicity_HOME/Kernel/Config.pm.dist. You must activate it by copying it without the ".dist" filename extension.

```sh
$ cp /opt/felicity/Kernel/Config.pm.dist /opt/felicity/Kernel/Config.pm
```

#### 6. Check if all needed modules are installed
```sh
$ perl -cw /opt/felicity/bin/cgi-bin/index.pl
/opt/felicity/bin/cgi-bin/index.pl syntax OK

$ perl -cw /opt/felicity/bin/cgi-bin/customer.pl
/opt/felicity/bin/cgi-bin/customer.pl syntax OK

$ perl -cw /opt/felicity/bin/otrs.Console.pl
/opt/felicity/bin/otrs.Console.pl syntax OK
```
"syntax OK" tells you all mandatory Perl modules are installed.

#### 7. Configuring the Apache web server
First of all, you should install the Apache2 web server and mod_perl; you'd typically do this from your systems package manager. Below you'll find the commands needed to set up Apache on the most popular Linux distributions.

```sh
$ yum install httpd mod_perl
```

Most Apache installations have a conf.d directory included. On Linux systems you can usually find this directory under /etc/apache or /etc/apache2. Log in as root, change to the conf.d directory and link the appropriate template in /opt/felicity/scripts/apache2-httpd.include.conf to a file called zzz_otrs.conf in the Apache configuration directory (to make sure it is loaded after the other configurations).

Felicity requires a few Apache modules to be active for optimal operation. On most platforms you can make sure they are active via the tool a2enmod.

```sh
$ a2enmod perl
$ a2enmod version
$ a2enmod deflate
$ a2enmod filter
$ a2enmod headers
```

#### 8. File Permissions
File permissions need to be adjusted to allow OTRS to read and write files:

```sh
$  bin/otrs.SetPermissions.pl --web-group=apache
```

##### 9. Database setup
Please use the web installer at <code>http://localhost/felicity/installer.pl</code> (replace "localhost" with your Felicity hostname) to setup your database and basic system settings such as email accounts.

<strong>Note: </strong>The following configuration settings are recommended for MySQL setups. Please add the following lines to /etc/my.cnf under the [mysqld] section:

```sh
max_allowed_packet   = 20M
query_cache_size     = 32M
innodb_log_file_size = 256M
```
#### 10. First login
Now you are ready to login to your system at <code>http://localhost/felicity/index.pl</code> with the credentials you configured in the web installer (User: root@localhost).

With this step, the basic system setup is finished.

#### 11. Start the OTRS Daemon
The new OTRS daemon is responsible for handling any asynchronous and recurring tasks in OTRS. What has been in cron file definitions previously is now handled by the OTRS daemon, which is now required to operate OTRS. The daemon also handles all GenericAgent jobs and must be started from the otrs user.'

```sh
$ /opt/felicity/bin/otrs.Daemon.pl start
```

#### 12. Cron Jobs for OTRS user
There are two default OTRS cron files in /opt/felicity/var/cron/*.dist, and their purpose is to make sure that the OTRS Daemon is running. They need to be be activated by copying them without the ".dist" filename extension.

```sh
$ cd /opt/felicity/var/cron
$ for foo in *.dist; do cp $foo `basename $foo .dist`; done
```

To schedule these cron jobs on your system, you can use the script Cron.sh with the otrs user.

```sh
$ /opt/felicity/bin/Cron.sh start
```

Stopping the cron jobs is also possible (useful for maintenance):

```sh
$ /opt/felicity/bin/Cron.sh stop
```
#### 13. Setup bash autocompletion (optional)

All regular OTRS commandline operations happen via the otrs Console interface <code>bin/otrs.Console.pl</code>. This provides an auto completion for the bash shell which makes finding the right command and options much easier.

You can activate the bash autocompletion by installing the package bash-completion. It will automatically detect and load the file <code>/opt/felicity/.bash_completion</code> for the otrs user.

After restarting your shell, you can just type bin/otrs.Console.pl followed by TAB, and it will list all available commands. If you type a few characters of the command name, TAB will show all matching commands. After typing a complete command, all possible options and arguments will be shown by pressing TAB.

# getting started
We have provided a basic ticket life cycle creation to issue closure functionality but feel free to explore.

-- Insert ticket creation and issue closure functionality here --

# bug reporting
We know that we are far from perfect but we'll want to know where we made mistakes and would like to fix those mistakes.

# documentation
Feel free to use the tool the way you'd like. We'll be continuously working on documentation to make life simpler for the community.

# license
Since the core product remains OTRS we'll share the same license which was provided by [OTRS](https://otrs.com).

# build status
We have tried our best to make all the features as functional to their point but there may be certains bugs but we believe that since OTRS has been long enough and well established to have a robust tool so you can go ahead and use felicity .

# contribution
Feel free to pull and modify the code according to your likeness. You can find as at <code>felicity@unotechsoft.com</code>.
