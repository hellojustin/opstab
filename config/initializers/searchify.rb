require 'indextank'

module Searchify

  def self.index

    @client = @client ||  IndexTank::Client.new( ENV['SEARCHIFY_API_URL'] )
    index_name = Rails.env.production? ? 'production' : 'idx'

    @client.indexes( index_name )

  end

end
