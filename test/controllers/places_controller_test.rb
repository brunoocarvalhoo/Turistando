require "test_helper"

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:one)
  end

  test "should get index" do
    get places_url, as: :json
    assert_response :success
  end

  test "should create place" do
    assert_difference("Place.count") do
      post places_url, params: { place: { coordinates: @place.coordinates, kinds: @place.kinds, name: @place.name, osm: @place.osm, rate: @place.rate, wikidata: @place.wikidata, xid: @place.xid } }, as: :json
    end

    assert_response :created
  end

  test "should show place" do
    get place_url(@place), as: :json
    assert_response :success
  end

  test "should update place" do
    patch place_url(@place), params: { place: { coordinates: @place.coordinates, kinds: @place.kinds, name: @place.name, osm: @place.osm, rate: @place.rate, wikidata: @place.wikidata, xid: @place.xid } }, as: :json
    assert_response :success
  end

  test "should destroy place" do
    assert_difference("Place.count", -1) do
      delete place_url(@place), as: :json
    end

    assert_response :no_content
  end
end
