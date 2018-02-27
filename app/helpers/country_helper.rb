# frozen_string_literal: true

module CountryHelper
  def display_country
    @countries = [ISO3166::Country.find_country_by_alpha3('can')]
    collection_select(:profile, :country, @countries, :alpha3, :name,
         { selected: params[:country] },
         class: 'form-control form-control-lg underlined')
  end
end
