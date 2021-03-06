require 'test_helper'

describe Lotus::Routes do
  before do
    @scheme   = 'https'
    @host     = 'lotusrb.org'
    @port     = 443
    @original = Lotus::Router.new(scheme: @scheme, host: @host, port: @port) do
      get '/', as: :root
    end

    @routes = Lotus::Routes.new(@original)
  end

  describe '#path' do
    it 'returns a path for the given name' do
      @routes.path(:root).must_equal '/'
    end

    it 'raises an error when the path cannot be found' do
      -> { @routes.path(:unknown) }.must_raise Lotus::Routing::InvalidRouteException
    end
  end

  describe '#url' do
    it 'returns a url for the given name' do
      @routes.url(:root).must_equal "#{ @scheme }://#{ @host }/"
    end

    it 'raises an error when the url cannot be found' do
      -> { @routes.url(:unknown) }.must_raise Lotus::Routing::InvalidRouteException
    end
  end
end
