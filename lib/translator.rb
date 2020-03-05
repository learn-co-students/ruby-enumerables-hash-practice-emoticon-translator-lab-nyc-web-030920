# require modules here
require "yaml"
require "pry"
def load_library(file_path)
 emoticons= YAML.load_file(file_path)
 newHash= { :get_meaning => {},
            :get_emoticon => {}
   
 }
 emoticons.each do |key, value|
   # :get_meaning points to english definitions
   # :get_emoticon points to Japanese emoticon
   newHash[:get_meaning][value[1]] = key
   newHash[:get_emoticon][value[0]] = value[1]
 end
# binding.pry
newHash
end

def get_japanese_emoticon(yaml, str)
  emoticons = load_library(yaml)
  if emoticons[:get_emoticon][str]
  emote = emoticons[:get_emoticon][str]
  return emote
end
return "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml,str )
 emoticons = load_library(yaml)
 if emoticons[:get_meaning][str]
 emote = emoticons[:get_meaning][str]
 return emote
 end
return "Sorry, that emoticon was not found"
end