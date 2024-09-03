require 'rest-client'
require 'json'
class Tradutor
  def traducao(text,target_language)
    api_key = "AIzaSyC_y-FvQ5WHLSReVXCNuN_w62pNormpsuc"
    url = "https://translation.googleapis.com/language/translate/v2"
    @text = text
    @target_language = target_language
    # fazer a solicitação para a API com a chave
    response = RestClient.post(url, { q: @text, target: @target_language, key: api_key })
    # Parseie a resposta JSON
    parsed_response = JSON.parse(response.body)
    # Resultado
    @translated_text = parsed_response["data"]["translations"].first["translatedText"]
  end
  def criar_arquivo
      time = Time.now.strftime("%Y%m%d_%H%M") #fortmata a string para ser válida como um nome de arquivo
      File.open("#{time}.txt",'w') do |line|
        line.puts("Texto original: #{@text}")
        line.puts("Língua de destino: #{@target_language}")
        line.puts("Texto traduzido: #{@translated_text}")
        line.puts("Tradução realizada às: #{Time.now.strftime("%Y/%m/%d %H:%M")}")
      end
  end
end
