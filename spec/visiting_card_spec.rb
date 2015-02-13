require_relative "spec_helper"
require_relative "../visiting_card.rb"

def app
  VisitingCard
end

describe VisitingCard do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
