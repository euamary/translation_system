require 'net/http' # Carrega a biblioteca net/http para fazer requisições HTTP
require 'openssl' # Carrega a biblioteca openssl para lidar com conexões HTTPS
require 'json' # Carrega a biblioteca json para manipular dados em formato JSON
require 'uri' # Carrega a biblioteca uri para manipular URLs

class Tradutor # Define a classe tradutor, que será responsável por traduzir frases entre diferentes idiomas
  attr_accessor :frase, :de, :para # Define os atributos da classe Tradutor: frase, de (idioma de origem) e para (idioma de destino)

  def initialize(frase, de, para) # Define o método initialize, que é chamado quando uma nova instância da classe Tradutor é criada
    @frase = frase
    @de = de
    @para = para
  end

  def traduzir # Define o método traduzir, que será responsável por traduzir a frase fornecida pelo usuário
    url = URI("https://api.mymemory.translated.net/get?q=hello+world&langpair=en|pt") # Cria um objeto URI com a URL da API de tradução, que será usada para fazer a requisição HTTP

    parametros = {
      q: @frase,
      langpair: "#{@de}|#{@para}"
    } # Define um hash com os parâmetros que serão enviados na requisição HTTP, incluindo a frase a ser traduzida e os idiomas de origem e destino

    url.query = URI.encode_www_form(parametros) # Codifica os parâmetros em formato de query string e os adiciona à URL da requisição HTTP

    resposta = Net::HTTP.get(url) # Faz a requisição HTTP GET para a URL da API de tradução e armazena a resposta em uma variável
    dados = JSON.parse(resposta) # Converte a resposta da API, que está em formato JSON, em um hash Ruby para facilitar o acesso aos dados retornados pela API
    dados["responseData"]["translatedText"] # Retorna o texto traduzido, que está localizado no hash retornado pela API, acessando a chave "responseData" e, em seguida, a chave "translatedText"
  end

  def salvar(resultado) # Define o método salvar, que será responsável por salvar a tradução em um arquivo de texto
    nome = Time.now.strftime("%Y-%m-%d_%H-%M-%S") # Cria um nome de arquivo baseado na data e hora atual, formatado como "ano-mês-dia_hora-minuto-segundo"

    File.open "#{nome}.txt", "w" do |arquivo| # Abre um arquivo de texto com o nome gerado e modo de escrita ("w"), e passa o objeto do arquivo para o bloco
      arquivo.puts "Original (#{@de}): #{@frase}" # Escreve a frase original no arquivo, incluindo o idioma de origem
      arquivo.puts "Traduzido (#{@para}): #{resultado}" # Escreve a frase traduzida no arquivo, incluindo o idioma de destino
    end
  end
end