#default['teamcity']['version'] = '8.1.4'
#default['teamcity']['username'] = 'teamcity'
#default['teamcity']['group'] = 'teamcity'
#default['teamcity']['service_name'] = 'tcbuildagent'

node.default['teamcity']['agents']['test'] = {'server_url': 'http://test.com',
	'name': 'test',
	'user': 'tcbuild',
	'group': 'tcbuild',
	'home': '/opt/tcbuild',
	'system_dir': 'tcagent',
	'env_properties': {'supportes_java': 'true'}
}
