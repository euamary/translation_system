require_relative 'translator' # Carrega o arquivo translator.rb para usar a classe Translator

loop do # Inicia um loop para permitir múltiplas traduções
  puts

  print "Phrase to translate: "
  phrase = gets.chomp # Lê a frase que o usuário deseja traduzir e remove o caractere de nova linha no final

  print "Source language (e.g., pt): "
  from = gets.chomp

  print "Target language (e.g., en): "
  to = gets.chomp

  translator = Translator.new(phrase, from, to) # Cria uma nova instância da classe Translator com a frase e os idiomas fornecidos pelo usuário

  result = translator.translate # Chama o método translate da classe Translator para obter a tradução da frase

  puts "\nTranslation: #{result}" # Exibe a tradução obtida pelo método translate da classe Translator

  translator.save(result) # Chama o método save para salvar a tradução em um arquivo de texto

  puts "Translation saved successfully!"

  print "\nWould you like to translate another phrase? (yes/no): " # Solicita ao usuário se deseja traduzir outra frase

  answer = gets.chomp.downcase # Lê a resposta do usuário e converte para minúsculas

  break unless answer == 'yes' # Sai do loop se a resposta não for 'yes'
end