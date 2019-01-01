User.create!(
   email: "admin@test.com",
 password: "password",
  name: "admin",
  role: "site_admin"
)
puts "admin user created"


3.times do |topic|
    Topic.create!(
    title: "Topic #{topic}"
    )
end

puts "3 Topics created"

1.times do |blog|
    Blog.create!(
        title: "My blog Post #{blog}",
        body: "s simply dummy text of the 
        printing and typesetting industry. 
        Lorem Ipsum has been the industrys standard
        y text ever since the 1500s, when an unknown
         printer took a galley of type and scrambled 
         it to make a type specimen book. It has 
         survived not only five centuries, but also 
         the leap into electronic typesetting, 
         remaining essentially unchanged. It was,",
         topic_id: Topic.last.id
    )
end
puts "1 blog posts created"

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 15
    )
end
puts "5 skills created" 

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

puts "1 portfolio items created"

3.times do |technology| 
    Technology.create!(
        name: "Technology #{technology}",
        portfolio_id: Portfolio.last.id
    )
end
puts "3 technologies  created"

ProjectType.create!(
    name: "project"
)
ProjectType.create!(
    name: "experience"
)
puts "2 project types created"

3.times do |projects| 
    Project.create!(
    name: "project #{project}",
    title: "this is one",
    state: "IL",
    city: "chicago",
    start_month: "IL",
    start_year: 2018,
   end_month: "dec"
   end_year: 2018,
   project_type_id: 1
    )
end
puts "3 projects created"

Education.create!(
   name: "rockford",
    title: "rails dev",
    description: " made web sites",
   state: "il",
    city: "chicago",
    year_completed:  2017
)
puts "1 education created"
