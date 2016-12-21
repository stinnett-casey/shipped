             Prefix Verb        URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       users/sessions#new
            user_session POST   /users/sign_in(.:format)       users/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      users/sessions#destroy
           user_password POST   /users/password(.:format)      devise/passwords#create
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                         PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)        users/registrations#cancel
       user_registration POST   /users(.:format)               users/registrations#create
   new_user_registration GET    /users/sign_up(.:format)       users/registrations#new
  edit_user_registration GET    /users/edit(.:format)          users/registrations#edit
                         PATCH  /users(.:format)               users/registrations#update
                         PUT    /users(.:format)               users/registrations#update
                         DELETE /users(.:format)               users/registrations#destroy
                   users GET    /users(.:format)               users#index
                         POST   /users(.:format)               users#create
                new_user GET    /users/new(.:format)           users#new
               edit_user GET    /users/:id/edit(.:format)      users#edit
                    user GET    /users/:id(.:format)           users#show
                         PATCH  /users/:id(.:format)           users#update
                         PUT    /users/:id(.:format)           users#update
                         DELETE /users/:id(.:format)           users#destroy
                   boats GET    /boats(.:format)               boats#index
                         POST   /boats(.:format)               boats#create
                new_boat GET    /boats/new(.:format)           boats#new
               edit_boat GET    /boats/:id/edit(.:format)      boats#edit
                    boat GET    /boats/:id(.:format)           boats#show
                         PATCH  /boats/:id(.:format)           boats#update
                         PUT    /boats/:id(.:format)           boats#update
                         DELETE /boats/:id(.:format)           boats#destroy
                    jobs GET    /jobs(.:format)                jobs#index
                         POST   /jobs(.:format)                jobs#create
                 new_job GET    /jobs/new(.:format)            jobs#new
                edit_job GET    /jobs/:id/edit(.:format)       jobs#edit
                     job GET    /jobs/:id(.:format)            jobs#show
                         PATCH  /jobs/:id(.:format)            jobs#update
                         PUT    /jobs/:id(.:format)            jobs#update
                         DELETE /jobs/:id(.:format)            jobs#destroy
              add_to_job GET    /add_to_job(.:format)          jobs#ajax_index
                    root GET    /                              home#index
