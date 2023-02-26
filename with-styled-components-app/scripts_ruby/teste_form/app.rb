require 'sinatra'

date1 = 'teste'
statuss = 'teste'


def read_names
    return [] unless File.exist?("names2.md")
    File.read("names2.md").split("\n")
  end

def store_name(filename, name_p,desc_p)
        teste = File.open(filename, "a+") do |file|
        teste.write "---
        status: '#{name_p}'
        title: '#{desc_p}'
        date: 'teeee'
        excerpt: 'uuu'
        ---"
        arq.close unless file.closed? 
    end
end

def store_name2(tit, status, date,desc)
  arq = File.new("quarto-post.md", "w") 
  arq.write "---
  status: '#{status}'
  title: '#{tit}'
  date: '#{date}'
  excerpt: '#{desc}'
  ---"
  arq.close unless file.closed?
end

get "/monstas" do
    @titulo = 'Escreva aqui o seu post'
    @name_post = params["name"]
    @desc_post = params["desc"]
    @names = read_names
    @desc_post = read_names
    erb :monstas
  end
  
  post "/monstas" do
    @name_post = params["name"]
    @desc_post = params["desc"]
    store_name2(@name_post,statuss,date1,@desc_post)
  end