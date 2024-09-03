require_relative 'translation.rb'

puts "Digite a frase que deseja ser traduzida: "
text = gets.chomp
puts "Digite a sigla da lingua destinada (exemplo: Espanhol(es), Inglês(en))"
target_language = gets.chomp  # Código do idioma de destino (es = Espanhol)
traduzir = Tradutor.new
traduzir.traducao(text,target_language)
traduzir.criar_arquivo
