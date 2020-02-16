require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)
  
  hash = Hash.new
  hash["get_emoticon"] = Hash.new
  hash["get_meaning"] = Hash.new 

  emoticons.each do |english, japanese|
    hash["get_emoticon"][japanese.first] = japanese.last 
    hash["get_meaning"][japanese.last] = english
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  result = hash["get_emoticon"][emoticon]
  if result == nil 
    "Sorry, that emoticon was not found"
  else
    result
  end
end


def get_english_meaning(path, emoticon)
  hash = load_library(path)
  result = hash["get_meaning"][emoticon]
  if result == nil 
    "Sorry, that emoticon was not found"
  else
    result
  end
end