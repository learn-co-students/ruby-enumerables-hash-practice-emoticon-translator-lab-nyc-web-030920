# require modules here
require "yaml"

def load_library(file_name)
  emoticons = YAML.load_file(file_name)
  result = {
    get_meaning: {},
    get_emoticon: {}
  }
  
  emoticons.each do |key, value|
    result[:get_meaning][value[1]] = key
    result[:get_emoticon][value[0]] = emoticons[key][1]
  end 
  result
end

def get_japanese_emoticon(file_path, emoticon)
  result = load_library(file_path)[:get_emoticon][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  result = load_library(file_path)[:get_meaning][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end