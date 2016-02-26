# Custom Helpers
module CustomHelpers
  def categories(articles)
    categories = []
    articles.each do |article|
      category = article.metadata[:page][:category]
      categories.push(category) unless categories.include? category
    end
    categories
  end

  def tags(articles)
    tags = []
    articles.each do |article|
      article_tags = article.metadata[:page][:tags].split(', ')
      article_tags.each do |tag|
        tags.push(tag) unless tags.include? tag
      end
    end
    tags
  end
end
