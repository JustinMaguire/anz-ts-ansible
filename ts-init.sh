#!/bin/bash -x

COMPLEX="false"
if [ "$1" = "complex" ];
    then
	COMPLEX="true"
	echo You have accepted the challenge!
fi


if grep -q -i "release 6" /etc/redhat-release ; then
  majversion=6
elif grep -q -i "release 7" /etc/redhat-release ; then
  majversion=7
else
  echo "Apparently, running neither release 6.x nor 7.x "
  exit;
fi

## Attach EPEL
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$majversion.noarch.rpm

sudo yum install -y python-pip gcc python-devel git bzip2

sudo pip install --upgrade pip

sudo pip install 'ansible==2.4.3.0' 

sudo mkdir -p /sas/install
sudo mkdir -p /sas/ts_playbooks
ansible localhost -b -m git -a "repo=https://github.com/JustinMaguire/anz-ts-ansible.git dest=/sas/ts_playbooks/anz-ts-ansible"
sudo chown cloud-user:cloud-user -R /sas 
wget --quiet --no-parent --no-check-certificate -r https://gelweb.race.sas.com/mirror/gitlab/OpenLDAP/ -P /sas/ts_playbooks/gel-openldap -nH --cut-dirs=3
rm -rf /sas/ts_playbooks/gel-openldap/*.htm*
wget --quiet --no-parent --no-check-certificate -r https://gelweb.race.sas.com/mirror/gitlab/viya-gel-training-materials/17w47/gel.example.playbooks/viya.services/ -P /sas/ts_playbooks/gel-viya-services -nH --cut-dirs=6
rm -rf /sas/ts_playbooks/gel-viya-services/*.htm* 
chmod +x /sas/ts_playbooks/gel-viya-services/viya.services.deregister.microservices.sh


/bin/ansible-playbook /sas/ts_playbooks/anz-ts-ansible/inital-setup.yml -e hard=$COMPLEX -i /sas/ts_playbooks/anz-ts-ansible/ts.inventory.ini
