class NrelService
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn
      Faraday.new("https://developer.nrel.gov/api")
    end
end
