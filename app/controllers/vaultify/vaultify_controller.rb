module Vaultify
  class VaultifyController < ApplicationController




    require 'net/http'
    require 'base64'

    def upload

    end

    def translate

    end

    def export

    end



    def fast
      url = 'http://fast.oclc.org/searchfast/fastsuggest?' + "&query=#{params['query']}&queryIndex=#{params['queryIndex']}&queryReturn=#{params['queryReturn']}&suggest=#{params['suggest']}&rows=20"

      fastResponse = Net::HTTP.get_response(URI.parse(url)).body


      respond_to do |format|
        format.json { render plain: fastResponse }
        format.text { render plain: fastResponse }
      end
    end

    def aat
      url = URI('http://vocabsservices.getty.edu/AATService.asmx/AATGetTermMatch?term=' + params[:cleanQuery] + '&logop=&notes=')
      req = Net::HTTP::Get.new(url)
      req['Authorization'] = "Basic " + "univic" + ":" + "1V23g~dn~\8/"#Base64.urlsafe_encode64("1V23g~dn~\8/")

      res = Net::HTTP.start(url.hostname, url.port) do |http|
        http.request(req)
      end

      respond_to do |format|
        format.json { render plain: res.body }
        format.text { render plain: res.body }
      end

    end
  end
end