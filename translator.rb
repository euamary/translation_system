require 'net/http' # Carrega a biblioteca net/http para fazer requisições HTTP
require 'openssl' # Carrega a biblioteca openssl para lidar com conexões HTTPS
require 'json' # Carrega a biblioteca json para manipular dados em formato JSON
require 'uri' # Carrega a biblioteca uri para manipular URLs

class Translator # Define a classe translator, que será responsável por traduzir frases entre diferentes idiomas
  attr_accessor :phrase, :from, :to # Define os atributos da classe Translator: phrase, from (idioma de origem) e to (idioma de destino)

  def initialize(phrase, from, to) # Define o método initialize, que é chamado quando uma nova instância da classe Translator é criada
    @phrase = phrase
    @from = from
    @to = to
  end

  def translate # Define o método translate, que será responsável por traduzir a frase fornecida pelo usuário
    url = URI("https://api.mymemory.translated.net/get?q=hello+world&langpair=en|pt") # Cria um objeto URI com a URL da API de tradução, que será usada para fazer a requisição HTTP

    parameters = {
      q: @phrase,
      langpair: "#{@from}|#{@to}"
    } # Define um hash com os parâmetros que serão enviados na requisição HTTP, incluindo a frase a ser traduzida e os idiomas de origem e destino

    url.query = URI.encode_www_form(parameters) # Codifica os parâmetros em formato de query string e os adiciona à URL da requisição HTTP

    response = Net::HTTP.get(url) # Faz a requisição HTTP GET para a URL da API de tradução e armazena a resposta em uma variável
    data = JSON.parse(response) # Converte a resposta da API, que está em formato JSON, em um hash Ruby para facilitar o acesso aos dados retornados pela API
    data["responseData"]["translatedText"] # Retorna o texto traduzido, que está localizado no hash retornado pela API, acessando a chave "responseData" e, em seguida, a chave "translatedText"
  end

  def save(result) # Define o método save, que será responsável por salvar a tradução em um arquivo de texto
    filename = Time.now.strftime("%Y-%m-%d_%H-%M-%S") # Cria um nome de arquivo baseado na data e hora atual, formatado como "ano-mês-dia_hora-minuto-segundo"

    File.open "#{filename}.txt", "w" do |file| # Abre um arquivo de texto com o nome gerado e modo de escrita ("w"), e passa o objeto do arquivo para o bloco
      file.puts "Original (#{@from}): #{@phrase}" # Escreve a frase original no arquivo, incluindo o idioma de origem
      file.puts "Traduzido (#{@to}): #{result}" # Escreve a frase traduzida no arquivo, incluindo o idioma de destino
    end
  end
end