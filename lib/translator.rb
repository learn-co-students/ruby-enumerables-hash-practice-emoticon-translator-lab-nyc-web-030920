# require modules here
require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)
  
  #should be a hash of arrays, with western at index 0, japanese at index 1
  #since the key names will be used as values, collecting them into an array:
  names = emoticons.keys
  
  #declare a new hash of hashes
  emoticon_library = {:get_meaning => {}, :get_emoticon => {}}
  
  #:get_meaning values are hashes: japanese_emoticon => name_of_emoticon
  #:get_emoticon values are hashes: english_emoticon => japanese_emoticon
  #fill in values for :get_meaning and :get_emoticon
  i = 0
  while i < names.length do
    
    emoticon_library[:get_meaning][emoticons[names[i]][1]] = names[i]
    
    emoticon_library[:get_emoticon][emoticons[names[i]][0]] = emoticons[names[i]][1]
    
    i += 1
  end
  
  return emoticon_library
  
end



def get_japanese_emoticon(yml_path, english_emoticon)
  
  library = load_library(yml_path)
  
  #check to see if passed english_emoticon exists in the library
  if library[:get_emoticon].any?{|eng_emoji, j_emoji| eng_emoji == english_emoticon  }
    #if exists, then return japanese_emoticon
    return library[:get_emoticon][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  
end



def get_english_meaning(yml_path, japanese_emoticon)
  
  library = load_library(yml_path)
  
  #check to see if passed japanese_emoticon exists in the library
  if library[:get_meaning].any?{|j_emoji, meaning| j_emoji == japanese_emoticon}
    #if exists, then return the meaning in English
    return library[:get_meaning][japanese_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  
end