Status.delete_all
Status.create!(description: "Waiting for Staff Response")
Status.create!(description: "Waiting for Customer")
Status.create!(description: "On Hold")
Status.create!(description: "Cancelled")
Status.create!(description: "Completed")