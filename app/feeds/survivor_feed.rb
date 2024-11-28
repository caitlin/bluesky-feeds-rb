require_relative 'feed'

class SurvivorFeed < Feed
  REGEXPS = [
    /\#survivor/i, /\#survivor47/i
  ]

  def feed_id
    1
  end

  def display_name
    "Survivor"
  end

  def description
    "Feed with posts mentioning #survivor, #survivor47, and from Survivor players"
  end

  def avatar_file
    "images/survivor.jpg"
  end

  def post_matches?(post)
    REGEXPS.any? { |r| post.text =~ r }
  end

  def colored_text(t)
    text = t.dup

    REGEXPS.each { |r| text.gsub!(r) { |s| Rainbow(s).green }}

    text
  end
end
