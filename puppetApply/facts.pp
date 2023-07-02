
$whoami = $::facts['os']['family']
$iam = $::osfamily

notify { "I am running on ${whoami} and also ${iam}": }
