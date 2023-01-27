resource "local_file" "pet" {
filename = "./pets.txt"
content = "We love pets!"
file_permission = "0700"
}

resource "random_pet" "my-pet" {
prefix = "Mrs"
separator = "_"
length = "1"
}