require 'json'
require 'fileutils'
require 'erb'
require 'ostruct'

class ObjcClass

    attr_accessor :properties
    attr_accessor :name
    def initialize(name, properties = [])
        @name = name
        @properties = properties
    end
    
end

json = JSON.parse File.read('property.json')
# json.map do |kls, properties|
#     ObjcClass.new(kls, properties)
# end


class ErbalT < OpenStruct
    def self.render_from_hash(t, h)
        ErbalT.new(h).render(t)
    end

    def render(template)
        ERB.new(template).result(binding)
    end
end

def render(template, hash)
    erb = File.open(template).read
    ErbalT::render_from_hash(erb, hash)
end

result_folder = "./results"

FileUtils.rm_rf result_folder



json.each do |kls, properties|
    FileUtils.mkdir_p result_folder
    file_name = File.join "results", "#{kls}+Mixed.swift"
    File.write file_name, render("extension.swift.erb", { :kls => kls, :properties => properties })
end
