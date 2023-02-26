def write_arc(tit, status, date,desc)
    arq = File.new("quarto-post.md", "w") 
    arq.write "---
    status: '#{status}'
    title: '#{tit}'
    date: '#{date}'
    excerpt: '#{desc}'
    ---"
    arq.close unless file.closed? 
end

require 'date'

statuss = ''

puts "Escreva o titulo do post"
title = gets.chomp.to_s

time_and_date = Time.now.strftime("%d/%m/%Y %H:%M")

puts "Escreva uma descrição para o seu post"
desc = gets.chomp.to_s

puts "Gostaria de publicar o post: Yes or No"
awn = gets.chomp.to_s

if awn.upcase == 'YES'
    statuss = 'published'
    write_arc(title,statuss,time_and_date,desc)
else
    puts "Execução do programa cancelado"
end

