Event.delete_all
User.delete_all
Ticket.delete_all
Status.delete_all
Status.create!(description: "Waiting for Staff Response")
Status.create!(description: "Waiting for Customer")
Status.create!(description: "On Hold")
Status.create!(description: "Cancelled")
Status.create!(description: "Completed")

admin_user = User.create(:email => "antonio@antonio.com",
 :password => "xpto1234", :role => "admin", :username => "antonio")

staff_user = User.create(:email => "staff@staff.com",
  :password => "xpto1234", :role => "staff", :username => "staff")

issue = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. " +
 "Minus eum autem doloremque similique nulla fugit totam excepturi," +
" architecto consectetur ex, ea nam dolor praesentium possimus" +
" quisquam culpa fuga quam laboriosam."
Ticket.create(name: "Average Joe", email: "average@joe.com", department: "test",
  issue: issue, email_confirmed: true)

Ticket.create(name: "Average Joe 2", email: "average2@joe.com", department: "test2",
  issue: issue, email_confirmed: true)

