10.times do |blog|
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
         remaining essentially unchanged. It was"
    )
end
puts "10 blog posts created"

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 15
    )
end
puts "5 skills created" 

9.times do |portfolio_item|
    Portfolio.create!(
        title: "Portfolio title: #{portfolio_item}",
        subtitle: "My great service",
        body: "It is a long established fact that a reader will 
          be distracted by the readable content of a page when looking at
          its layout. The point of using Lorem Ipsum is that it has a 
          more-or-less normal distribution of letters, as opposed to using",
        main_image: "http://placeholder.it/600x400",
        thumb_image: "http://placeholder.it/350x200" 
    )
end
puts "9 portfolio items created"