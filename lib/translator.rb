# require modules here
require "yaml"

def load_library(file_path)
emojis = YAML.load_file('./lib/emoticons.yml')
  emojis.inspect
  emoji_hash = {"get_meaning" =>{}, "get_emoticon" => {}}
  
  emojis.each do |eng, emo|
  emoji_hash["get_emoticon"][emo.first] = emo.last
  emoji_hash["get_meaning"][emo.last] = eng
end
emoji_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here, translates eng to jap
  emoji_hash = load_library(file_path)
  trnslt = emoji_hash["get_emoticon"][emoticon]
  if !trnslt
    trnslt = "Sorry, that emoticon was not found"
end
trnslt
end

def get_english_meaning(file_path, emoticon)
  # code goes here, translates jap to eng
  emoji_hash = load_library(file_path)
    trnslt = emoji_hash["get_meaning"][emoticon]
  if !trnslt
    trnslt = "Sorry, that emoticon was not found"
end
trnslt
end