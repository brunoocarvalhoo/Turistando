class PlacesController < ApplicationController
  before_action :target
  before_action :set_place, only: %i[ show destroy ]

  # GET /places
  def index
    @places = Place.all

    render json: @places
  end

  # GET /places/1
  def show
    render json: @place
  end

  # DELETE /places/1
  def destroy
    @place.destroy
  end

  def target
    @target = params[:target] ? params[:target] : 'en'
  end

  def specific_kinds
    kind = params[:kind]
    places = Place.where("kinds LIKE ?", "%#{kind}%").pluck(:name, :kinds, :rate, :coordinates)
    places_json = places.to_json

    translated_text(places_json)

    formated_places = formated_text(@request['data']['translations'][0]['translatedText'])

    render json: formated_places.as_json
  end

  def translated_text(text)
    @request = HTTParty.post("#{ENV['BASE_URL']}?key=#{ENV['API_KEY']}", {
      body: {
        q: text,
        target: @target
      }
    })
  end

  def formated_text(text)
    text.gsub(/&quot;/, "\"")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def place_params
    params.require(:place).permit(:xid, :name, :rate, :osm, :wikidata, :kinds, :coordinates)
  end
end
