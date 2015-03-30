require 'instagram'

namespace :posts do
  desc "Rake task to fetch photos from Instagram"
  task :fetch => :environment do
    Instagram.user_recent_media(1444174065).each do |item|
      Post.find_or_create_by(subject: "Image From Instagram", instagram_link: item.link)
    end
  end
end
