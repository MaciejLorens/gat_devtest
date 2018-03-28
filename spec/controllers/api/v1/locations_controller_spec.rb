require 'rails_helper'

RSpec.describe Api::V1::LocationsController, type: :controller do
  render_views

  let(:sample_country_code) { 'pl' }
  let(:sample_panel_code) { 'sample-panel-auth-code' }
  let(:valid_auth) do
    ActionController::HttpAuthentication::Token
      .encode_credentials(sample_panel_code)
  end

  before :each do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe 'GET #index' do
    context 'when request token is missing' do
      it 'returns error' do
        get :index, country_code: sample_country_code
        expect(response).to have_http_status(401)
      end
    end

    context 'when request token is present' do
      context 'when there is no panel_provider for token' do
        before do
          request.env['HTTP_AUTHORIZATION'] = valid_auth
        end

        it 'returns error' do
          get :index, country_code: sample_country_code
          expect(response).to have_http_status(404)
        end
      end

      context 'when there is panel_provider for token' do
        before do
          @panel_provider = create(:panel_provider, code: sample_panel_code)
          request.env['HTTP_AUTHORIZATION'] = valid_auth
        end

        context 'when there is no country for request' do
          it 'returns http error' do
            get :index, country_code: sample_country_code
            expect(response).to have_http_status(404)
          end
        end

        context 'when there is country for request' do
          before do
            @country_1 = create(:country, panel_provider: @panel_provider)
          end

          context 'when country_code is missing' do
            it 'returns error' do
              get :index

              expect(response).to have_http_status(422)
              expect(response.body).to include('Missing', 'country_code')
            end
          end

          context 'when country_code is present' do
            context 'when locations are empty' do
              it 'returns empty array' do
                get :index, country_code: @country_1.country_code

                expect(response).to have_http_status(:success)
                expect(json).to eq([])
              end
            end

            context 'when there are locations' do
              before do
                @panel_provider_2 = create(:panel_provider)

                @country_2 = create(:country, panel_provider: @panel_provider)

                @location_1 = create(:location)
                @location_2 = create(:location)
                @location_3 = create(:location)
                @location_4 = create(:location)
                @location_5 = create(:location)

                @location_group_1 = create(:location_group,
                                           country: @country_1,
                                           panel_provider: @panel_provider,
                                           locations: [@location_1, @location_2])
                @location_group_2 = create(:location_group,
                                           country: @country_2,
                                           panel_provider: @panel_provider,
                                           locations: [@location_3])
                @location_group_3 = create(:location_group,
                                           country: @country_1,
                                           panel_provider: @panel_provider_2,
                                           locations: [@location_4, @location_5])
              end

              context 'for first country' do
                it 'returns all locations which belongs to provider and country' do
                  get :index, country_code: @country_1.country_code, fomat: :json

                  expect(response).to have_http_status(:success)
                  expect(json.count).to eq(2)
                end
              end

              context 'for second country' do
                it 'returns all locations which belongs to provider and country' do
                  get :index, country_code: @country_2.country_code, fomat: :json

                  expect(response).to have_http_status(:success)
                  expect(json.count).to eq(1)
                end
              end
            end
          end
        end
      end
    end
  end
end
