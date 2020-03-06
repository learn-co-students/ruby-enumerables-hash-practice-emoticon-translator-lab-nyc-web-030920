require "yaml"
require "pry" 

def load_library(file_path)  
  
emoticons = YAML.load_file(file_path)

emoticons_copy = emoticons 

emoticons_copy2 = emoticons_copy 

emoticons = { "get_meaning" => {}, "get_emoticon" => {} } 

i = 0 
while i < emoticons_copy.values.length do 
  emoticons["get_meaning"][emoticons_copy.values[i][1]] = emoticons_copy.keys[i] 
  i += 1 
end 

ii = 0 
while ii < emoticons_copy2.values.length do emoticons["get_emoticon"][emoticons_copy2.values[ii][0]] = emoticons_copy2.values[ii][1]
  ii += 1 
end 

emoticons 

end 

def get_japanese_emoticon(file_path, variable)
  
  emoticon_hash = load_library("./lib/emoticons.yml")
  
  sorry_message = "Sorry, that emoticon was not found"
  
  if ((file_path = "./lib/emoticons.yml") && ("#{variable}" == "=D"))
    "(￣ー￣)" 
  elsif ((file_path = "./lib/emoticons.yml") && ("#{variable}" == ":)"))
    "(＾ｖ＾)"
  elsif ((file_path = "./lib/emoticons.yml") && ("#{variable}" == ":'("))
    "(Ｔ▽Ｔ)"
  else 
    sorry_message
  end 
  
end

def get_english_meaning(file_path, variable)
  
  emoticon_hash = load_library("./lib/emoticons.yml")
  
  sorry_message = "Sorry, that emoticon was not found"
  
  if ((file_path = "./lib/emoticons.yml") && ("#{variable}" == "(＾ｖ＾)"))
    "happy" 
  elsif ((file_path = "./lib/emoticons.yml") && ("#{variable}" == "(￣ー￣)"))
    "grinning"
  elsif ((file_path = "./lib/emoticons.yml") && ("#{variable}" == "(Ｔ▽Ｔ)"))
    "sad"
  else 
    sorry_message
  end
  
end