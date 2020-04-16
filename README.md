# Docker BCrypt
Encrypt a password easily with BCrypt using Docker and Apache htpasswd

Initiates a prompt for the password to be hashed (the password is hidden from view when typed)

## Run
```bash
   docker run --rm -it westwater/bcrypt [-r ROUNDS] [-p PASSWORD]
   
   options:
     -r : Rounds (defaults to 10)
     -p : Supply the password as an argument instead
```

## License
Distributed under the MIT license
