namespace :get_data do
  task :get_data => :environment do
    response = HTTParty.get('https://api.opentripmap.com/0.1/en/places/bbox?lon_min=-179.9999&lon_max=179.9999&lat_min=-89.9999&lat_max=89.9999&apikey=5ae2e3f221c38a28845f05b690ab6d7ccaf4c7354eec6ab34b5087f7')

    return 'O servidor de dados está fora, tente novamente mais tarde' if response.body.nil? || response.body.empty?

    return puts 'Os dados já foram cadastrados' unless Place.first.nil?

    data = JSON.parse(response.body)
    data["features"].each do |feature|
      properties = feature["properties"]

      place = Place.new

      place.xid = properties["xid"]
      place.name = properties["name"]
      place.rate = properties["rate"]
      place.osm = properties["osm"]
      place.wikidata = properties["wikidata"]
      place.kinds = properties["kinds"]
      place.coordinates = feature["geometry"]["coordinates"]

      place.save! ? msg = 'Ponto Turístico salvo com Sucesso' : msg ='Erro ao salvar Ponto Turístico'

      puts msg
    end
  end
end
