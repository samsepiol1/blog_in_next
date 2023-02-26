require 'yaml/store'
require 'sinatra'

Opcoes = {
    'HAM' => 'Hambúrger',
    'PIZ' => 'Pizza',
    'SUS' => 'Sushi',
    'LAM' => 'Lámen',
  }
get '/' do
    @titulo = 'Bem vindo ao Sufragista!'
    erb :index
end

post '/cast' do
    @titulo = 'Obrigada por votar!'
    @votos  = params['voto']
    @store = YAML::Store.new 'votos.yml'
    @store.transaction do
      @store['votes'] ||= {}
      @store['votes'][@vote] ||= 0
      @store['votes'][@vote] += 1
    end
    erb :cast
  end

get '/results' do
    @titulo = 'Resultados até agora:'
    @store = YAML::Store.new 'votos.yml'
    @votes = @store.transaction { @store['votes'] }
    erb :results
end


