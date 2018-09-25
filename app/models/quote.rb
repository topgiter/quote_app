class Quote < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  serialize :custom_meta, Hash

  class << self
    def download_and_save!
      response = RestClient.get('http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=10')
      quotes = JSON.parse(response.body)
      quotes.each do |quote|
        Quote.create(title: quote['title'], content: quote['content'], link: quote['link'], custom_meta: quote['custom_meta'])
      end
    end
  end

end
