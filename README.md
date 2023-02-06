# LandOfOpportunity
  
  This repository is going to be used to test and configure a few different tools in the Rocky Linux environment.


TROUBLESHOOTING NOTES:

  When installing Rocky Linux on the VM, I received a "checksum error". I verified the iso file had the correct checksum and so there had to be another issue going on. I determined that even though the VM prompts ask you to select an ISO image to boot from, you have to physically go into VM settings>>storage>>Controller IDE>>Empty and change the "Empty" selection to the ISO file.
  
  When installing Puppet, I could not get the distribution packages to download correctly. I spent a few hours trying different distros but had no success. I kept receiving an error when trying to run the "sudo dnf install puppetserver -y" command. It turns out the version of Rocky Linux I was running (9.1) was too new and did not have any compatible Puppet distros for it. I recreated the VMs using Rocky Linux Version 8.7 and the errors went away.


PUPPET RESOURCES:

https://www.how2shout.com/linux/install-puppet-server-agent-on-rocky-linux-or-almalinux-8/
https://www.atlantic.net/dedicated-server-hosting/how-to-set-and-change-hostname-in-rocky-linux-8/
https://www.puppet.com/docs/puppetdb/7/install_from_source.html
https://www.youtube.com/watch?v=T5QMnvHie0M

ROCKY LINUX DOWNLOAD LOCATION:

https://rockylinux.org/download/

VM NETWORKING RESOURCES:

https://www.youtube.com/watch?v=2Fkf6Kysh7I
