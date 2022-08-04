class MarvelApi
  attr_reader :data

  def initialize(query)
    @query = query || nil
    @data = JSON.parse(response.body, object_class: OpenStruct)
  end

  def search_results
    if @query
      @data["data"]["results"].select { |values| values["title"].downcase.include? @query.downcase }
    else
      @data["data"]["results"]
    end
  end

  private

  def response
    private_key = Rails.application.credentials.marvel[:private_key]
    public_key = Rails.application.credentials.marvel[:public_key]

    connection =
      Faraday.new(
        url: "https://gateway.marvel.com:443/v1/public/comics",
        params: {
          orderBy: "focDate",
          apikey: public_key,
          ts: Time.now.to_i.to_s,
          hash: Digest::MD5.hexdigest(Time.now.to_i.to_s + private_key + public_key),
        },
        headers: {
          "Content-Type" => "application/json",
        },
      )

    connection.get
  end
end
