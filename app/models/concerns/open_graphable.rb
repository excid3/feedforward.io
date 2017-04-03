module OpenGraphable
  extend ActiveSupport::Concern

  included do
    before_validation :set_og_values
  end

  def set_og_values
    self.title       ||= og_title
    self.link_type   ||= og_link_type
    self.description ||= og_description
    self.image       ||= og_image
  end

  def og_title
    if title = og_property("title")
      title['content']
    else
      document.at("title").text
    end
  end

  def og_link_type
    if type = og_property("type")
      type['content'].split(":").last
    else
      "Article"
    end
  end

  def og_description
    if desc = og_property("description")
      desc['content']
    end
  end

  def og_image
    if image = og_property("image")
      image['content']
    elsif image = document.search("img").first
      image['src']
    end
  end

  def og_property(name)
    document.at("meta[property=\"og:#{name}\"]")
  end

  def document
    @document ||= Nokogiri::HTML(open(url))
  end

end
