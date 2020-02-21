require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file("./lib/emoticons.yml")

  new_emoticons = {}
  new_emoticons["get_meaning"] = {}
  new_emoticons["get_emoticon"] = {}

  emoticons.each { |key, value|
      japanese_emo = emoticons[key][1]
      western_emo = emoticons[key][0]

      new_emoticons["get_meaning"][japanese_emo] = key
      new_emoticons["get_emoticon"][western_emo] = japanese_emo
   }  
   new_emoticons
end

# puts load_library("./lib/emoticons.yml")

def get_japanese_emoticon (emoticons, western_emo)
  emoticons = load_library("./lib/emoticons.yml")
  get_emoticon = emoticons["get_emoticon"]
  japanese_emo = ""

  get_emoticon.each { |key, value|
      if western_emo == key
        japanese_emo = value
      end 
  }
  
  japanese_emo
end

puts get_japanese_emoticon("./lib/emoticons.yml", "=D")

def get_english_meaning
  # code goes here
end