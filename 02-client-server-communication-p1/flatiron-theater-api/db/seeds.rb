# Initialize + Save Two Productions
p1 = Production.create(title: 'Hamlet', genre: 'drama', director:'Bill Shakespeare', description:'The Tragedy of Hamlet, Prince of Denmark', budget: 100000.00, image:'https://upload.wikimedia.org/wikipedia/commons/6/6a/Edwin_Booth_Hamlet_1870.jpg', ongoing:true)
p2 = Production.create(title: 'cats', genre: 'musical', director:'Andrew Lloyd Webber', description:' Jellicles cats sing and dance', budget: 200000.00, image:'https://upload.wikimedia.org/wikipedia/en/3/3e/CatsMusicalLogo.jpg', ongoing:true)

# Initialize + Save One Production Role
ProductionRole.create(role:'Hamlet', understudy:true, production: p1)

# Initialize + Save Two Users
u1 = User.create(name:'Louis', admin:true)
u2 = User.create(name:'Rose', admin:true)

# Initialize + Save Three Tickets
Ticket.create(user:u1, production:p2, price:65.00)
Ticket.create(user:u2, production:p2, price:65.00)
Ticket.create(user:u2, production:p1, price:65.00)

# Confirm Seeding Has Completed
puts "🌱 Seeding Done!"