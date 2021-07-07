require "yaml"

def load_library(file)
meaning = {}
emotions = {}
emoticons = YAML.load_file(file)
emoticons.each do |(word,value)|
  meaning[value[1]] = word
  emotions[value[0]] = value[1]
end
emoticons_hash =
  {:get_meaning => meaning,
   :get_emoticon => emotions
  }
emoticons_hash
end

def get_japanese_emoticon(file,emoticon)
  emoticon_lib = load_library(file)
  if emoticon_lib[:get_emoticon][emoticon]
    emoticon_lib[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file,emoticon)
  emoticon_lib = load_library(file)
  if emoticon_lib[:get_meaning][emoticon]
    emoticon_lib[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

p load_library("./lib/emoticons.yml")
