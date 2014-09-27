class AppResource < BaseResource
  self.element_name = :app
  has_many :comments
  class << self
    def search(options={})
      response = self.post(:search, options)
      instantiate_collection(format.decode(response.body))
    end
  end
  def download(options={})
    response = connection.get(custom_method_element_url(:download, options), self.class.headers)
    filename = response.header['content-disposition'].gsub(/^.*filename=(.*)$/, '\1')
    File.open(filename, 'wb') do |f| # writing binary file out
      f.puts response.body
    end
  end
end

# debugging response bodies
module ActiveResource
  class Connection
    def get_with_print(x,y={})
      response = get_without_print(x,y)
      puts response.body
      response
    end
    alias_method :get_without_print, :get
    alias_method :get, :get_with_print

    def post_with_print(x,y='',z={})
      response = post_without_print(x,y,z)
      puts response.body
      response
    end
    alias_method :post_without_print, :post
    alias_method :post, :post_with_print
  end
end
