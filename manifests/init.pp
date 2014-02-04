# == Class: boot-notify
#
# This class installs and configures the boot-notify files and service.
#
# === Parameters
#
# [*from_address*]
#   String. The email address from which the email should send.
#   Default is undefined.
# [*to_addresses*]
#   Array. The email addresses to which to send the emails.
#   Default is undefined.
# [*smtp_server*]
#   String. The fqdn of the smtp server to send mail through.
#   Default is undefined.
# [*python_file_dir*]
#   String. The directory to place the python mailer file.
#   Default is undefined.
#
# === Examples
#
# class { 'bootnotify':
#   from_address    => "noreply@example.com",
#   to_address      => "youraddress@example.com",
#   smtp_server     => "smtp.example.com",
#   python_file_dir => "/usr/local/bin",
# }
#
class bootnotify (
  $from_address = undef,
  $to_addresses = undef,
  $smtp_server = undef,
  $python_file_dir = undef,
)
{
  file { '/etc/init.d/boot-notify':
    content => template('boot-notify/boot-notify.erb'),
    mode    => '0755',
  }
  ->
  file { "$python_file_dir/boot-notify-sender.py":
    content => template('boot-notify/boot-notify-sender.py.erb'),
    mode    => '0755',
  }
  ->
  service { 'boot-notify':
    ensure => running,
    enable => true,
  }
}
