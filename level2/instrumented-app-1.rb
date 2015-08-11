require 'sinatra'
require 'statsd'

set :bind, '0.0.0.0'
statsd = Statsd.new('localhost',8125)

get '/hi' do
  output = ''
  statsd.batch do |batcher|
    batcher.increment('level2.app1.hi.hits')
    batcher.time('level2.app1.hi.times') do
      sleep Random.rand(0.10..0.30)
      output = "Hello World!"
    end
  end
  output
end
