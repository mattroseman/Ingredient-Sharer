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
