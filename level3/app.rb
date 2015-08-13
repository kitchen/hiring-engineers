require 'sinatra'
require 'statsd'

set :bind, '0.0.0.0'
statsd = Statsd.new('localhost',8125)

get '/hi' do
  output = ''
  statsd.batch do |batcher|
    batcher.increment('level2.app1.hits', :tags => %w{support page:hi})
    batcher.time('level2.app1.times', :tags => %w{support page:hi}) do
      sleep Random.rand(0.42..0.56)
      output = "Hello World!"
    end
  end
  output
end

get '/foo' do
  output = ''
  statsd.batch do |batcher|
    batcher.increment('level2.app1.hits', :tags => %w{support page:foo})
    batcher.time('level2.app1.times', :tags => %w{support page:foo}) do
      sleep Random.rand(0.12..0.15)
      output = "Hello World!"
    end
  end
  output
end
