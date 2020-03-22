def test_user_is_present(host):
    user_name = 'application'
    group_name = 'application'
    home_dir = '/home/application'
    shell = '/bin/ash'

    usr = host.user(user_name)
    assert user_name in usr.name
    assert group_name in usr.group
    assert home_dir in usr.home
    assert shell in usr.shell