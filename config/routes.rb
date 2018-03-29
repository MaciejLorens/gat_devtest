Rails.application.routes.draw do

  apipie

  resource :locations, only: [], defaults: { format: 'json' } do
    get '/', to: 'api/v1/locations#index', defaults: { format: 'json' }
    get '/:country_code', to: 'api/v1/locations#index', defaults: { format: 'json' }
  end

  resource :target_groups, only: [], defaults: { format: 'json' } do
    get '/', to: 'api/v1/target_groups#index', defaults: { format: 'json' }
    get '/:country_code', to: 'api/v1/target_groups#index', defaults: { format: 'json' }
  end

  post 'evaluate_target', to: 'api/v1/evaluate_target#price'
end
