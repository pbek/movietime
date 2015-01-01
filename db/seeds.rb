# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html


puts 'Creating Default Directory Name Cleanup Patterns...'
prio = 100
DirectoryNameCleanupPattern.create([
	{ pattern: '/DVDRip/i', replace: "", priority: prio-=1 },
	{ pattern: '/XviD/i', replace: "", priority: prio-=1 },
	{ pattern: '/BDRip/i', replace: "", priority: prio-=1 },
	{ pattern: '/720\w/i', replace: "", priority: prio-=1 },
	{ pattern: '/1080\w/i', replace: "", priority: prio-=1 },
	{ pattern: '/CD/i', replace: "", priority: prio-=1 },
	{ pattern: '/DVD/i', replace: "", priority: prio-=1 },
	{ pattern: '/BluRay/i', replace: "", priority: prio-=1 },
	{ pattern: '/448p/i', replace: "", priority: prio-=1 },
	{ pattern: '/Audio/i', replace: "", priority: prio-=1 },
	{ pattern: '/Subs/i', replace: "", priority: prio-=1 },
	{ pattern: '/ Eng/', replace: "", priority: prio-=1 },
	{ pattern: '/ EN/', replace: "", priority: prio-=1 },
	{ pattern: '/ NL/', replace: "", priority: prio-=1 },
	{ pattern: '/Jap\./i', replace: "", priority: prio-=1 },
	{ pattern: '/dual audio/i', replace: "", priority: prio-=1 },
	{ pattern: '/_sujaidr/i', replace: "", priority: prio-=1 },
	{ pattern: '/Directors Cut/i', replace: "", priority: prio-=1 },
	{ pattern: '/~/', replace: "", priority: prio-=1 },
	{ pattern: '/ Rip/i', replace: "", priority: prio-=1 },
	{ pattern: '/x264/i', replace: "", priority: prio-=1 },
	{ pattern: '/h264/i', replace: "", priority: prio-=1 },
	{ pattern: '/AC3/i', replace: "", priority: prio-=1 },
	{ pattern: '/AAC/i', replace: "", priority: prio-=1 },
	{ pattern: '/ aka /i', replace: " ", priority: prio-=1 },
	{ pattern: '/subtitle\w*/i', replace: "", priority: prio-=1 },
	{ pattern: '/-[\w]+$/', replace: "", priority: prio-=1 },
	{ pattern: '/-/', replace: " ", priority: prio-=1 },
	{ pattern: '/\./', replace: " ", priority: prio-=1 },
	# year numbers in brakets
	{ pattern: '/\[([\d]{4})\]/', replace: ' \1', priority: prio-=1 },
	 # skip all other stuff in brakets
	{ pattern: '/\[.*\]/', replace: "", priority: prio-=1 },
])