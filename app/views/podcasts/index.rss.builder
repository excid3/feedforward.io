title = "FeedForward Podcast"
author = "Chris Oliver & Rob Log"
description = "Every week you will be treated to a new RailsCasts episode featuring tips and tricks with Ruby on Rails, the popular web development framework. These screencasts are short and focus on one technique so you can quickly move on to applying it to your own project. The topics are geared toward the intermediate Rails developer, but beginners and experts will get something out of it as well."
keywords = "technology, programming, articles, stories"
image = "http://railscasts.com/images/railscasts_cover.jpg"
ext = 'mp4'

xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do
    xml.title title
    xml.link 'http://feedforward.io'
    xml.description description
    xml.language 'en'
    xml.pubDate @podcast.first.created_at.to_s(:rfc822)
    xml.lastBuildDate @podcast.first.created_.to_s(:rfc822)
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
        xml.title podcast.full_name
        xml.description podcast.description
        xml.pubDate podcast.published_at.to_s(:rfc822)
        xml.enclosure :url => podcast.asset_url("videos", ext), :length => podcast.file_size(ext), :type => 'video/mp4'
        xml.link podcast_url(podcast)
        xml.guid({:isPermaLink => "false"}, podcast.permalink)
        xml.itunes :author, author
        xml.itunes :subtitle, truncate(podcast.description, :length => 150)
        xml.itunes :summary, podcast.description
        xml.itunes :explicit, 'no'
        xml.itunes :duration, podcast.duration
      end
    end
  end
end
