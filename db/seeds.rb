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
	{ pattern: '/WRD/', replace: "", priority: prio-=1 },
	{ pattern: '/UPA/', replace: "", priority: prio-=1 },
	{ pattern: '/morgie/', replace: "", priority: prio-=1 },
	{ pattern: '/aXXo/', replace: "", priority: prio-=1 },
	{ pattern: '/DiAMOND/', replace: "", priority: prio-=1 },
	{ pattern: '/AXED/', replace: "", priority: prio-=1 },
	{ pattern: '/BRRip/i', replace: "", priority: prio-=1 },
	{ pattern: '/BDRip/i', replace: "", priority: prio-=1 },
	{ pattern: '/SCREAM/', replace: "", priority: prio-=1 },
	{ pattern: '/720\w/i', replace: "", priority: prio-=1 },
	{ pattern: '/1080\w/i', replace: "", priority: prio-=1 },
	{ pattern: '/CD/i', replace: "", priority: prio-=1 },
	{ pattern: '/DVDSCR/i', replace: "", priority: prio-=1 },
	{ pattern: '/DVD/i', replace: "", priority: prio-=1 },
	{ pattern: '/R5/', replace: "", priority: prio-=1 },
	{ pattern: '/MP3/i', replace: "", priority: prio-=1 },
	{ pattern: '/Gogo/i', replace: "", priority: prio-=1 },
	{ pattern: '/BiTo/i', replace: "", priority: prio-=1 },
	{ pattern: '/HDSi/i', replace: "", priority: prio-=1 },
	{ pattern: '/UNRATED/i', replace: "", priority: prio-=1 },
	{ pattern: '/CoWRY/i', replace: "", priority: prio-=1 },
	{ pattern: '/2Lions/i', replace: "", priority: prio-=1 },
	{ pattern: '/E.Sub/i', replace: "", priority: prio-=1 },
	{ pattern: '/www.mastitorrents.com/i', replace: "", priority: prio-=1 },
	{ pattern: '/torrents/i', replace: "", priority: prio-=1 },
	{ pattern: '/GreatMagician/i', replace: "", priority: prio-=1 },
	{ pattern: '/Release/i', replace: "", priority: prio-=1 },
	{ pattern: '/Kingdom/i', replace: "", priority: prio-=1 },
	{ pattern: '/anoXmous/i', replace: "", priority: prio-=1 },
	{ pattern: '/BluRay/i', replace: "", priority: prio-=1 },
	{ pattern: '/GCJM/i', replace: "", priority: prio-=1 },
	{ pattern: '/MitZep/i', replace: "", priority: prio-=1 },
	{ pattern: '/PhoenixRG/i', replace: "", priority: prio-=1 },
	{ pattern: '/RETAIL/i', replace: "", priority: prio-=1 },
	{ pattern: '/german/i', replace: "", priority: prio-=1 },
	{ pattern: '/448p/i', replace: "", priority: prio-=1 },
	{ pattern: '/pinki/i', replace: "", priority: prio-=1 },
	{ pattern: '/Audio/i', replace: "", priority: prio-=1 },
	{ pattern: '/DD5/i', replace: "", priority: prio-=1 },
	{ pattern: '/5\.1/i', replace: "", priority: prio-=1 },
	{ pattern: '/Subs/i', replace: "", priority: prio-=1 },
	{ pattern: '/nlx/i', replace: "", priority: prio-=1 },
	{ pattern: '/LiMiTED/i', replace: "", priority: prio-=1 },
	{ pattern: '/ Eng/', replace: "", priority: prio-=1 },
	{ pattern: '/ EN/', replace: "", priority: prio-=1 },
	{ pattern: '/ NL/', replace: "", priority: prio-=1 },
	{ pattern: '/Jap\./i', replace: "", priority: prio-=1 },
	{ pattern: '/Recalled2Life/i', replace: "", priority: prio-=1 },
	{ pattern: '/dual audio/i', replace: "", priority: prio-=1 },
	{ pattern: '/_sujaidr/i', replace: "", priority: prio-=1 },
	{ pattern: '/Directors Cut/i', replace: "", priority: prio-=1 },
	{ pattern: '/AC3-ViSiON/i', replace: "", priority: prio-=1 },
	{ pattern: '/~/', replace: "", priority: prio-=1 },
	{ pattern: '/ Rip/i', replace: "", priority: prio-=1 },
	{ pattern: '/x264/i', replace: "", priority: prio-=1 },
	{ pattern: '/h264/i', replace: "", priority: prio-=1 },
	{ pattern: '/AC3/i', replace: "", priority: prio-=1 },
	{ pattern: '/AAC/i', replace: "", priority: prio-=1 },
	{ pattern: '/ aka /i', replace: " ", priority: prio-=1 },
	{ pattern: '/HDRiP/i', replace: "", priority: prio-=1 },
	{ pattern: '/subtitle\w*/i', replace: "", priority: prio-=1 },
	{ pattern: '/-[\w]+$/', replace: "", priority: prio-=1 },
	{ pattern: '/-/', replace: " ", priority: prio-=1 },
	{ pattern: '/\./', replace: " ", priority: prio-=1 },
	# year numbers in brakets
	{ pattern: '/\[([\d]{4})\]/', replace: ' \1', priority: prio-=1 },
	 # skip all other stuff in brakets
	{ pattern: '/\[.*\]/', replace: "", priority: prio-=1 },
])