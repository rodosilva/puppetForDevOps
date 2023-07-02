
$username = 'micky'

unless $username =~ String[4,8] {
  fail('Invalid username')
}

notify { "Hello ${username}": }
