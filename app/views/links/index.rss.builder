title = "FeedForward"
author = "Chris Oliver & Rob Log"
description = "Each day we post the most thought provoking articles we find on http://feedforward.io. We collect these articles to discuss them on the FeedForward Podcast and http://feedforward.io so that we can learn from each other's experiences. The topics are geared towards people interested in technology, improving their careers, and the impact they can make on the world."
keywords = "technology, programming, articles, stories"
image = "http://railscasts.com/images/railscasts_cover.jpg"
ext = 'mp3'

xml.rss "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do
    xml.title title
    xml.link 'http://feedforward.io'
    xml.description description
    xml.language 'en'

    @links.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.url
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link go_link_url(article)
        xml.guid article.url
      end
    end
  end
end
