# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

puts 'Creating Directory Name Cleanup Patterns...'
prio = 100
DirectoryNameCleanupPattern.create([
	{ pattern: '/DVDRip/i', replace: "", priority: --prio },
	{ pattern: '/XviD/i', replace: "", priority: --prio },
	{ pattern: '/WRD/', replace: "", priority: --prio },
	{ pattern: '/UPA/', replace: "", priority: --prio },
	{ pattern: '/morgie/', replace: "", priority: --prio },
	{ pattern: '/aXXo/', replace: "", priority: --prio },
	{ pattern: '/DiAMOND/', replace: "", priority: --prio },
	{ pattern: '/AXED/', replace: "", priority: --prio },
	{ pattern: '/BRRip/i', replace: "", priority: --prio },
	{ pattern: '/BDRip/i', replace: "", priority: --prio },
	{ pattern: '/SCREAM/', replace: "", priority: --prio },
	{ pattern: '/720\w/i', replace: "", priority: --prio },
	{ pattern: '/1080\w/i', replace: "", priority: --prio },
	{ pattern: '/CD/i', replace: "", priority: --prio },
	{ pattern: '/DVDSCR/i', replace: "", priority: --prio },
	{ pattern: '/DVD/i', replace: "", priority: --prio },
	{ pattern: '/R5/', replace: "", priority: --prio },
	{ pattern: '/MP3/i', replace: "", priority: --prio },
	{ pattern: '/Gogo/i', replace: "", priority: --prio },
	{ pattern: '/BiTo/i', replace: "", priority: --prio },
	{ pattern: '/HDSi/i', replace: "", priority: --prio },
	{ pattern: '/UNRATED/i', replace: "", priority: --prio },
	{ pattern: '/CoWRY/i', replace: "", priority: --prio },
	{ pattern: '/2Lions/i', replace: "", priority: --prio },
	{ pattern: '/E.Sub/i', replace: "", priority: --prio },
	{ pattern: '/www.mastitorrents.com/i', replace: "", priority: --prio },
	{ pattern: '/torrents/i', replace: "", priority: --prio },
	{ pattern: '/GreatMagician/i', replace: "", priority: --prio },
	{ pattern: '/Release/i', replace: "", priority: --prio },
	{ pattern: '/Kingdom/i', replace: "", priority: --prio },
	{ pattern: '/anoXmous/i', replace: "", priority: --prio },
	{ pattern: '/BluRay/i', replace: "", priority: --prio },
	{ pattern: '/GCJM/i', replace: "", priority: --prio },
	{ pattern: '/MitZep/i', replace: "", priority: --prio },
	{ pattern: '/PhoenixRG/i', replace: "", priority: --prio },
	{ pattern: '/RETAIL/i', replace: "", priority: --prio },
	{ pattern: '/german/i', replace: "", priority: --prio },
	{ pattern: '/448p/i', replace: "", priority: --prio },
	{ pattern: '/pinki/i', replace: "", priority: --prio },
	{ pattern: '/Audio/i', replace: "", priority: --prio },
	{ pattern: '/DD5/i', replace: "", priority: --prio },
	{ pattern: '/5\.1/i', replace: "", priority: --prio },
	{ pattern: '/Subs/i', replace: "", priority: --prio },
	{ pattern: '/nlx/i', replace: "", priority: --prio },
	{ pattern: '/LiMiTED/i', replace: "", priority: --prio },
	{ pattern: '/ Eng/', replace: "", priority: --prio },
	{ pattern: '/ EN/', replace: "", priority: --prio },
	{ pattern: '/ NL/', replace: "", priority: --prio },
	{ pattern: '/Jap\./i', replace: "", priority: --prio },
	{ pattern: '/Recalled2Life/i', replace: "", priority: --prio },
	{ pattern: '/dual audio/i', replace: "", priority: --prio },
	{ pattern: '/_sujaidr/i', replace: "", priority: --prio },
	{ pattern: '/Directors Cut/i', replace: "", priority: --prio },
	{ pattern: '/~/', replace: "", priority: --prio },
	{ pattern: '/ Rip/i', replace: "", priority: --prio },
	{ pattern: '/x264/i', replace: "", priority: --prio },
	{ pattern: '/h264/i', replace: "", priority: --prio },
	{ pattern: '/AC3/i', replace: "", priority: --prio },
	{ pattern: '/AAC/i', replace: "", priority: --prio },
	{ pattern: '/ aka /i', replace: " ", priority: --prio },
	{ pattern: '/HDRiP/i', replace: "", priority: --prio },
	{ pattern: '/subtitle\w*/i', replace: "", priority: --prio },
	{ pattern: '/-[\w]+$/', replace: "", priority: --prio },
	{ pattern: '/-/', replace: " ", priority: --prio },
	{ pattern: '/\./', replace: " ", priority: --prio },
	# year numbers in brakets
	{ pattern: '/\[([\d]{4})\]/', replace: ' \1', priority: --prio },
	 # skip all other stuff in brankets
	{ pattern: '/\[.*\]/', replace: "", priority: --prio },
	{ pattern: '/AC3-ViSiON/i', replace: "", priority: --prio },
])