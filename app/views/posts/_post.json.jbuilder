json.extract! post, :id, :title, :content, :location, :posted_time, :ttl, :created_at, :updated_at, :is_request
json.url post_url(post, format: :json)