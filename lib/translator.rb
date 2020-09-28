# require modules here
require "yaml"
require 'pry'
def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  hash = {:get_meaning => {}, :get_emoticon => {}}
  emoticons.each do |key, value|
    hash[:get_meaning][value[1]] = key
    hash[:get_emoticon][value[0]] = value[1]
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon_english)
  # code goes here
new_variable = load_library(file_path)
japanese_emoticon = new_variable[:get_emoticon][emoticon_english]
if !japanese_emoticon 
  return "Sorry, that emoticon was not found"
end
japanese_emoticon
end

def get_english_meaning(file_path, japanese_emoticon)
  # code goes here
  new_variable =  load_library(file_path)
  english_meaning = new_variable[:get_meaning][japanese_emoticon]
  if !english_meaning 
    return "Sorry, that emoticon was not found" 
  end 
  english_meaning
end