import string
import random
import os

if os.path.isfile('passwords.txt'):
    reply = input("Would you like have a look at all your login passwords ([y/n]): ")
    if reply.lower() == 'y':
        with open('passwords.txt', 'r') as txt:
            for line in txt:
                print(line, end='')
    
      
reply = input("Do you want a password generator ([y/n]): ")
if reply.lower() == 'y':
    website = input("Whats the website you're trying to login to: ")
    characters = string.ascii_letters + string.punctuation  + string.digits
    password =  "".join(random.choice(characters) for x in range(16))
    print(password)
    
    my_file = open('passwords.txt', 'a+')
    my_file.write(f"Website: {website} \n")
    my_file.write(f"Password: {password} \n\n")
    my_file.close()

