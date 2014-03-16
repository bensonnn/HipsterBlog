module HipsterRater
  class User
    def self.hipness
    end

    def self.hip?
    end
  end

  class Post

    def self.hipness(text)
    end

    def self.hip?(text, count=5)
      hipster_word_count = text.split(" ").count do |word|
                              Word.where("word = ?", word)
                            end
      hipster_word_count >= count
    end


  end


end

# hip_text = "Synth drinking vinegar next level  post-ironic messenger bag master cleanse keytar pug  Stumptown mustache chillwave Bushwick wolf  PBR beard deep v fingerstache tofu skateboard  Fixie cornhole freegan  Wes Anderson yr actually Cosby sweater PBR shabby chic stumptown  Meh plaid pop-up"

# HipsterRater::Post.hip?(hip_text)
