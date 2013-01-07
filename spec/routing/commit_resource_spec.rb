require 'spec_helper'

describe 'routing to commits' do

  it 'routes a POST to /commits.json to CommitsController#create' do
    expect( :post => '/commits' ).to route_to(
      :controller => 'commits',
      :action     => 'create'
    )
  end

end
