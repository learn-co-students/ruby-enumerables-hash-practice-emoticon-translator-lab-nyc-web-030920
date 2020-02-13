# require modules here
require 'yaml'


def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticon_library = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, emoticon|
    emoticon_library["get_meaning"][emoticon[1]] = meaning
    emoticon_library["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  emoticon_library
end


def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticon_library = load_library(file_path)
  japanese_emoticon = emoticon_library["get_emoticon"][emoticon]
  japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticon_library = load_library(file_path)
  english_emoticon = emoticon_library["get_meaning"][emoticon]
  english_emoticon ? english_emoticon : "Sorry, that emoticon was not found"
end