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

