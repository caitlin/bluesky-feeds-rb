require_relative 'feed'

class SurvivorFeed < Feed
  REGEXPS = [
    # /\#survivor/i, /\#survivor47/i
  ]

  TAGS = [
    "survivor", "survivor47"
  ]

  MUTED_PROFILES = [
    # List of dids
  ]


  def feed_id
    1
  end

  def display_name
    "Survivor"
  end

  def description
    "Feed featuring the tags #survivor and #survivor47"
  end

  def avatar_file
    "images/survivor.jpg"
  end

  def post_matches?(post)
    return false if MUTED_PROFILES.include?(post.repo)

    return true if TAGS.any? { |tag| post.tags.include?(tag) }

    REGEXPS.any? { |r| post.text =~ r }
  end

  def colored_text(t)
    text = t.dup

    REGEXPS.each { |r| text.gsub!(r) { |s| Rainbow(s).green }}

    text
  end
end
