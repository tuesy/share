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
