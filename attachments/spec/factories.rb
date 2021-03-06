FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :admin_user, class: Brightcontent::AdminUser do
    email
    password "password"
    password_confirmation "password"
  end

  factory :blog do
    name "Blogname"
  end
end
