module HipsterRater
  class User
    def self.hipness
    end

    def self.hip?
    end
  end

  class Post
    def self.hipness(text)
      case self.word_count(text)
      when 0 then "Sad"
      when 1 then "Corny"
      when 2 then "Rightous"
      when 3 then "Yeah, man"
      when 4 then "Solid"
      else "Too much"
      end
    end

    def self.hip?(text, count=1)
      self.word_count(text) >= count
    end

    private

    def self.word_count(text)
      text.gsub(/,/, " ").downcase.split(" ").count{ |word| Word.where("word = ?", word).any? }
    end

  end
end

# hip_text = "Synth drinking vinegar next level  post-ironic messenger bag master cleanse keytar pug  Stumptown mustache chillwave Bushwick wolf  PBR beard deep v fingerstache tofu skateboard  Fixie cornhole freegan  Wes Anderson yr actually Cosby sweater PBR shabby chic stumptown  Meh plaid pop-up"

# HipsterRater::Post.hipness(hip_text)
