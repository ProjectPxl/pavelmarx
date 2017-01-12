require 'fileutils'
require 'git'


task :build do
	puts "===Middleman Build...==="
	system( "middleman build" ) or raise "Something went wrong with middleman build!"

	FileUtils.cp_r 'build/.', '../gh-pages/'
	puts "===Build moved to 'gh-pages'==="

	puts "===Deploying...==="

	g = Git.open( File.join(File.dirname(__FILE__), '../gh-pages')  )
	g.branch('gh-pages').checkout
	g.add(:all=>true) 
	g.commit("Build #{ Time.now.strftime("%d/%m/%Y %H:%M") }")
	g.push(remote = 'origin', branch = 'gh-pages')

	puts "===Deploy Successfull...==="
end