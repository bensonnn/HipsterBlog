module HipsterRater
  class User
    def self.hipness
    end

    def self.hip?
    end
  end

  class Post
    def self.hipness(text)
      case self.raw_score(text)
      when (-100..-1) then 'Banned'
      when (0..4) then "Sad"
      when (5..9) then "Corny"
      when (10..19) then "Rightous"
      when (20..34) then "Yeah, man"
      when (35..49) then "Solid"
      when (50..100) then "Too much"
      end
    end

    def self.raw_score(text)
      words_array = text.gsub(/,/, " ").downcase.split(" ")
      word_count = words_array.count
      hip = words_array.count{ |word| Word.where(word: word, is_hipster: true).any? }
      unhip = words_array.count{ |word| Word.where(word: word, is_hipster: false).any? }
      word_count == 0 ? 0 : (hip - unhip) * 100 / word_count
    end

  end
end

# hip_text = "Synth drinking vinegar next level  post-ironic messenger bag master cleanse keytar pug  Stumptown mustache chillwave Bushwick wolf  PBR beard deep v fingerstache tofu skateboard  Fixie cornhole freegan  Wes Anderson yr actually Cosby sweater PBR shabby chic stumptown  Meh plaid pop-up"

# HipsterRater::Post.hipness(hip_text)
