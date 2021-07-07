require 'yaml'
require 'pry'

def load_library(path)
  
  emoticons_yml = YAML.load_file(path)
  
  new_emoticons = {}
  
  new_emoticons["get_meaning"] = {}
  new_emoticons["get_emoticon"] = {}
  
  emoticons_yml.each do |meaning, emoticon|
    
    new_emoticons["get_meaning"][emoticon[1]] = meaning
    new_emoticons["get_emoticon"][emoticon[0]] = emoticon[1]

  end 
  
  new_emoticons
  
end

# binding.pry

def get_japanese_emoticon(path, emoticon)
   
  library_result = load_library(path)

  library_result["get_emoticon"].each do |key, value|
    
      if emoticon == key
        return value
      end
      
  end
  
  return "Sorry, that emoticon was not found"
  
end

#binding.pry

def get_english_meaning(path, emoticon)
  
  library_result = load_library(path)
  
  library_result["get_meaning"].each do |key, value|
    
    if emoticon == key
        return value
    end
    
  end
  
  return "Sorry, that emoticon was not found"

end