
$username = 'rodrigo'

$firstname = 'Rodrigo'
$secondname = 'Silva'

$comment = "${firstname} ${secondname}"



user { $username:
  ensure  => present,
  comment => $comment,

}
