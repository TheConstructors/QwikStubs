class Sunspot::DSL::Scope
  def fuzzy(field, words)
    words.to_s.strip.split(/\s+/).each do |word|
      all_of do |all|
        text_fields do |txt|
          txt.with(field).starting_with(word.downcase) 
        end
      end
    end
  end
end