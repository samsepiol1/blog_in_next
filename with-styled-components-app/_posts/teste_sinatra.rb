require 'yaml/store'
require 'sinatra'

class ContaBancaria
    attr_accessor :nome
    def initialize(nome)
      @nome = nome
  end
  # Omitindo o resto da implementação da classe
 end

 pessoa1 = ContaBancaria.new('Pedro')


 

Opcoes = {
    'HAM' => 'Hambúrger',
    'PIZ' => 'Pizza',
    'SUS' => 'Sushi',
    'LAM' => 'Lámen',
  }
get '/' do
    @titulo = 'Bem vindo ao Sufragista!'
    @sas = pessoa1.nome
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




