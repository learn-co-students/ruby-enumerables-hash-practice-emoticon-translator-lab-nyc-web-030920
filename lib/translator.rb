require "pry"
require "yaml"
# require modules here

def load_library(path)
  emoticon_hash = YAML.load_file(path)
  modified_hash = {
    "get_meaning": {},
    "get_emoticon": {}
  }
  emoticon_hash.each do |name, both_emoticons|
    modified_hash[:get_meaning][both_emoticons[1]] = name  # japanese emoticon is the key value should be the meaning
    modified_hash[:get_emoticon][both_emoticons[0]] =  both_emoticons[1]
end
modified_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  comparison_hash = load_library(file_path)
   comparison_hash[:get_emoticon].each do |english, japanese|
      if english == english_emoticon
      return japanese
   end
 end
 return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
comparison_hash = load_library(file_path)
comparison_hash[:get_meaning].each do |japanese, meaning|
  if japanese == japanese_emoticon 
    return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end