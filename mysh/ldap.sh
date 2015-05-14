#!/bin/sh
passwd=pleaseeditme
dc1=pleaseeditme
dc2=pleaseeditme
hash_pw=`slappasswd -s $passwd`
tmpdir=/tmp
#--------------------------------------------------------------#
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/inetorgperson.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/nis.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/misc.ldif
#——————————————————————-#
# database.ldif
#——————————————————————-#
cat << EOF > $tmpdir/database.ldif
# Load dynamic backend modules
dn: cn=module{0},cn=config
objectClass: olcModuleList
cn: module{0}
olcModulePath: /usr/lib/ldap
olcModuleLoad: {0}back_hdb

# Create directory database
dn: olcDatabase={1}hdb,cn=config
objectClass: olcDatabaseConfig
objectClass: olcHdbConfig
olcDatabase: {1}hdb
olcDbDirectory: /var/lib/ldap
olcSuffix: dc=$dc1,dc=$dc2
olcRootDN: cn=admin,dc=$dc1,dc=$dc2
olcRootPW: $hash_pw
olcAccess: {0}to attrs=userPassword,shadowLastChange by dn="cn=admin,dc=$dc1,dc=$dc2" write by anonymous auth by self write by * none
olcAccess: {1}to dn.base="" by * read
olcAccess: {2}to * by dn="cn=admin,dc=$dc1,dc=$dc2" write by * read
olcLastMod: TRUE
olcDbCheckpoint: 512 30
olcDbConfig: {0}set_cachesize 0 2097152 0
olcDbConfig: {1}set_lk_max_objects 1500
olcDbConfig: {2}set_lk_max_locks 1500
olcDbConfig: {3}set_lk_max_lockers 1500
olcDbIndex: uid pres,eq
olcDbIndex: cn,sn,mail pres,eq,approx,sub
olcDbIndex: objectClass eq
################################
#        Modifications
################################

dn: cn=config
changetype: modify

dn: olcDatabase={-1}frontend,cn=config
changetype: modify
delete: olcAccess

dn: olcDatabase={0}config,cn=config
changetype: modify
add: olcRootDN
olcRootDN: cn=admin,cn=config

dn: olcDatabase={0}config,cn=config
changetype: modify
add: olcRootPW
olcRootPW: $hash_pw

dn: olcDatabase={0}config,cn=config
changetype: modify
delete: olcAccess
EOF
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f $tmpdir/database.ldif
####################################
#         Mini DIT
####################################
cat << EOF > $tmpdir/dit.ldif
# Tree root

dn: dc=$dc1,dc=$dc2
objectClass: dcObject
objectclass: organization
o: $dc1.$dc2
dc: $dc1
description: Tree root

# Populating
dn: cn=admin,dc=$dc1,dc=$dc2
objectClass: simpleSecurityObject
objectClass: organizationalRole
cn: admin
userPassword: $hash_pw
description: LDAP administrator

dn: cn=aw,dc=$dc1,dc=$dc2
objectClass: simpleSecurityObject
objectClass: organizationalRole
cn: aw
userPassword: $hash_pw
description: LDAP aw

dn: ou=people,dc=$dc1,dc=$dc2
ou: people
objectClass: organizationalUnit
objectClass: top

dn: ou=groups,dc=$dc1,dc=$dc2
ou: groups
objectClass: organizationalUnit
objectClass: top

dn: ou=addressbook,dc=$dc1,dc=$dc2
ou: addressbook
objectClass: top
objectClass: organizationalUnit

#Adding user
dn: uid=ldap1,ou=people,dc=$dc1,dc=$dc2
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: ldap1
sn: Asdasd
givenName: ldap1
cn: ldap1 Asdasd
displayName: ldap1 asdasd
uidNumber: 1002
gidNumber: 1000
userPassword: $hash_pw
gecos: ldap1 asdasd
loginShell: /bin/bash
homeDirectory: /home/ldap1
shadowExpire: -1
shadowFlag: 0
shadowWarning: 7
shadowMin: 8
shadowMax: 999999
shadowLastChange: 10877
mail: aw@$dc1.$dc2
postalCode: 31000
l: Mysity
o: $dc1
mobile: +33 (0)6 22 22 22 22 22
homePhone: +33 (0)5 33 22 33 22
title: System Administrator
postalAddress:
initials: LP
EOF

sudo ldapadd -x -D cn=admin,dc=$dc1,dc=$dc2 -W -f $tmpdir/dit.ldif
