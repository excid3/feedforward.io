xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Feed Forward"
    xml.description "Seriously Awesome Articles"
    xml.link links_url
    xml.url "http://feedist.herokuapp.com/assets/favicon.png"

    @links.each do |link|
      xml.item do
        xml.title link.title
        xml.description link.url
        xml.pubDate link.created_at.to_s(:rfc822)
        xml.link link.url
        xml.guid link.url
      end
    end
  end
end
