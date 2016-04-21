require 'jekyll/elasticsearch/indexer'
require 'elasticsearch'

# indexer
module Jekyll
  class SearchIndexer < Jekyll::Generator
    safe true
    priority :lowest

    def generate(site)
      url = site.config['elasticsearch']['url']
      $client = ::Elasticsearch::Client.new(url: url)
      $client.indices.create(index: 'blog')

      site.posts.docs.each do |post|
        $client.create(index: 'blog', type: 'posts', body: {
          title: post.data.title,
          url: post.url
          date: post.date,
          content: post.content
          })
      end
    end
  end
end
