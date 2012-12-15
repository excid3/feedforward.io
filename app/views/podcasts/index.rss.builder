title = "FeedForward Podcast"
author = "Chris Oliver & Rob Log"
description = "Each day we post the most thought provoking articles we find on http://feedforward.io. We collect these articles to discuss them on the FeedForward Podcast and http://feedforward.io so that we can learn from each other's experiences. The topics are geared towards people interested in technology, improving their careers, and the impact they can make on the world."
keywords = "technology, programming, articles, stories"
image = "http://railscasts.com/images/railscasts_cover.jpg"
ext = 'mp3'

xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do
    xml.title title
    xml.link 'http://feedforward.io'
    xml.description description
    xml.language 'en'
    xml.pubDate @podcasts.first.created_at.to_s(:rfc822)
    xml.lastBuildDate @podcasts.first.created_at.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, 'Chris Oliver'
      xml.itunes :email, 'chris@excid3.com'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Technology' do
      xml.itunes :category, :text => 'Tech News'
    end
    xml.itunes :category, :text => 'Business' do
      xml.itunes :category, :text => 'Careers'
    end

    @podcasts.each do |podcast|
      xml.item do
        xml.title podcast.name
        xml.description podcast.description
        xml.pubDate podcast.created_at.to_s(:rfc822)
        xml.enclosure :url => go_podcast_url(podcast), :length => podcast.audio_file_size, :type => 'audio/mp3'
        xml.link podcast_url(podcast)
        xml.guid({:isPermaLink => "false"}, podcast_url(podcast))
        xml.itunes :author, author
        xml.itunes :subtitle, truncate(podcast.description, :length => 150)
        xml.itunes :summary, podcast.description
        xml.itunes :explicit, 'no'
        xml.itunes :duration, podcast.duration
      end
    end
  end
end
