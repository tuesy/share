class AppResource < BaseResource
  self.element_name = :app
  has_many :comments
  def download(options={})
    response = connection.get(custom_method_element_url(:download, options), self.class.headers)
    filename = response.header['content-disposition'].gsub(/^.*filename=(.*)$/, '\1')
    File.open(filename, 'w') do |f|
      f.puts response.body
    end
  end
end
