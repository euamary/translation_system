require_relative 'tradutor' # Carrega o arquivo tradutor.rb para usar a classe Tradutor

loop do # Inicia um loop para permitir múltiplas traduções
  puts
  print "Frase a traduzir: "
  frase = gets.chomp # Lê a frase que o usuário deseja traduzir e remove o caractere de nova linha no final

  print "Idioma de origem (ex: pt): "
  de = gets.chomp

  print "Idioma de destino (ex: en): "
  para = gets.chomp

  tradutor = Tradutor.new(frase, de, para) # Cria uma nova instância da classe Tradutor com a frase e os idiomas fornecidos pelo usuário

  resultado = tradutor.traduzir # Chama o método traduzir da classe Tradutor para obter a tradução da frase

  puts"\nTradução: #{resultado}" # Exibe a tradução obtida pelo método traduzir da classe Tradutor

  tradutor.salvar(resultado) # Chama o método salvar para salvar a tradução em um arquivo de texto

  puts "Tradução salva com sucesso!"

  print "\nDeseja traduzir outra frase? (sim/não): " # Solicita ao usuário se deseja traduzir outra frase
  resposta = gets.chomp.downcase # Lê a resposta do usuário e converte para minúsculas
  break unless resposta == 'sim' # Sai do loop se a resposta não for 'sim'
end