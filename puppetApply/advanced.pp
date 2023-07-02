
include apache #We can include and it will not be affected by the defaults

$attrs = {
  'ensure' => 'file',
  'owner'  => 'root',
  'group'  => 'root',
  'mode'   => '0644',
}

file {
  default:
   * => $attrs;

  '/etc/foo':
    content => 'Hello foo';
  '/etc/bar':
    content => 'Hello bar';
  '/etc/tango':
    content => 'Hello tango';

}
