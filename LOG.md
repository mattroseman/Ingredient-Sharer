# Developer's Notes

### Hun Jae, 161015

Post should contain:

- `title: String` The title of this post. Empty textbox.
- `location: String` The location where the user wants to request or offer. Autofilled from User's profile but can be changed.
- `content: text` The content of the post. Empty textbox.
- `created: DateTime` The created time of this post. Need to convert UTC to EST. Should be hidden.
- `ttl: Integer` The time-to-live (in hours) of this post.
- `deleted: DateTime` The deleted time of this post (calculated as created + ttl)
- `is_request: Boolean` Whether this is a request or not. Is a checkbox by default, should be radio button or dropdown menu.

The `post` can be created using the following `rails generate` method:

```
rails generate scaffold post user_id:integer title:string created:datetime ttl:integer is_request:boolean
```

Check out http://localhost:3000/posts to verify that it works. You can create post from there on.

Next, we have to make sure that in the "Create Post" page, some properties should not be shown and/or automatically assigned.

### Hun Jae, 161019

- Added `devise` gem which helps us with user authentication.
    - `devise` gem conflicts with `rails` which then was resolved in version `4.2.3`, changing `rails` version dependency higher from `4.2.0` to `~> 4.2.3` (Currently `4.2.7.1`)
- Added `index.html` so we see what we should be seeing on the first page (rather than the hello-world equivalent of Rails)

### Hun Jae, 161021

1. Generate user using Devise:

```
$ rails generate devise User
```

2. migrate db, as always:

```
$ rake db:migrate
```

3. rake routes to check what we should use

```
$ rake routes
                  Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
            user_session POST   /users/sign_in(.:format)       devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
           user_password POST   /users/password(.:format)      devise/passwords#create
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                         PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
       user_registration POST   /users(.:format)               devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
                         PATCH  /users(.:format)               devise/registrations#update
                         PUT    /users(.:format)               devise/registrations#update
                         DELETE /users(.:format)               devise/registrations#destroy
                    root GET    /                              home#index
```

So `devise/sessions#new` is what we want to use for our root path (the home page is log in page)

4. Set `/config/routes.rb` as following, so we properly redirect to sign-in page.

```
devise_for :users
devise_scope :user do
  authenticated :user do
    # Once we are done making the posts scaffold:
    # root :to => 'posts#index', as: :authenticated_root
    root :to => 'devise/sessions#new', as: :authenticated_root
  end
  unauthenticated :user do
    root :to => 'devise/sessions#new', as: :unauthenticated_root
  end
end
```

- Renamed `/public/index.html` to `dummy_welcome.html`. Somehow it was overriding the `routes.rb` file to show the default page.
- Prettified CSS stuff

#### TODO:

Generate model for moderator. Migrate db (`rake db:migrate`) & `rake routes` afterwards

```
$ rails generate devise Moderator
```

