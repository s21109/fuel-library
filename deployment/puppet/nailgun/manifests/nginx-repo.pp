class nailgun::nginx-repo(
  $repo_root = "/var/www/nailgun",
  ){

  file { "${repo_root}/index.html":
    ensure  => present,
    content => '',
  }

  file { "/etc/nginx/conf.d/repo.conf":
    content => template("nailgun/nginx_nailgun_repo.conf.erb"),
    owner => 'root',
    group => 'root',
    mode => 0644,
    require => [
                Package["nginx"],
                ],
    notify => Service["nginx"],
  }

}
