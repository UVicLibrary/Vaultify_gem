Vaultify::Engine.routes.draw do
  get '/upload', to: 'vaultify#upload', as: 'vaultify_upload'
  post '/translate', to: 'vaultify#translate', as: 'vaultify_translate'
  post '/export', to: 'vaultify#export', as: 'vaultify_export'
  get '/fast', to: 'vaultify#fast', as: 'vaultify_fast'
  get '/aat', to: 'vaultify#aat', as: 'vaultify_aat'
  get '/edtf', to: 'vaultify#edtf', as: 'vaultify_edtf'
end
