require 'jekyll/elasticsearch/indexer'

# indexer
module Jekyll
  class SearchIndexer < Jekyll::Generator
    safe true
    priority :lowest

    def generate(site)
      url = site.config['elasticsearch']['elasticsearch_url']

      site.posts.docs.each do |post|
        # print basic info
        puts post.name
      end

      # indexing
      # 1. POST to your ES url to Create an index
      # 2. TODO: batch the posts and insert them in elasticsearch,
        # but we're being lazy so we're going to do it doc by doc individually
        # POST /indexname/type/id {foobar_document_value}
        # POST /indexname/post (no unique id on our end, so we're going to omit it and let ES take care of it)
      # 3. Have to clear out old indices since we're building a new one err time we build


    end
  end
end
