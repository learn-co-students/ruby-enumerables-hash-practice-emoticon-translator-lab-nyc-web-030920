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

def get_japanese_emoticon (emoticons, western_emo)
  emoticons = load_library("./lib/emoticons.yml")
  get_emoticon = emoticons["get_emoticon"]
  japanese_emo = ""

  get_emoticon.each { |key, value|
      if western_emo == key
        japanese_emo = value
      end
  }

  if japanese_emo == ""
    japanese_emo = "Sorry, that emoticon was not found"
  end 
  
  japanese_emo
end

def get_english_meaning(emoticons, japanese_emo)
  emoticons = load_library("./lib/emoticons.yml")
  get_emoticon = emoticons["get_meaning"]
  meaning = ""

  get_emoticon.each { |key, value|
      if japanese_emo == key
        meaning = value
      end
  }

  if meaning == ""
    meaning = "Sorry, that emoticon was not found"
  end 
  
  meaning 
end