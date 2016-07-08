require 'colorize'
require 'fileutils'

require_relative 'scripts/wand.rb'

task :default do
    
    result_folder = "./NightNight/Classes/UIKit"

    file = './scripts/property.json'
    puts "[Input] Read json file '#{file}'"
    json = JSON.parse File.read(file)
    puts "[Generate] Start to generate swift extension file".yellow
    json.each do |kls, properties|
        file_name = File.join result_folder, "#{kls}+Mixed.swift"
        puts "[Generate] Generate #{file_name}"
        File.write file_name, render("./scripts/extension.swift.erb", { :kls => kls, :properties => properties })
    end
    puts "[Generate] Scripts complete".green
end
