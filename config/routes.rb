Rails.application.routes.draw do
  resources :places do
    collection do
      get ':kind', to: "places#specific_kinds", constraints: { kind: /[a-zA-Z]+/ }
      get ':kind/:target', to: "places#specific_kinds", constraints: { kind: /[a-zA-Z]+/, target: /[a-zA-Z]+/ }
    end
  end
end

