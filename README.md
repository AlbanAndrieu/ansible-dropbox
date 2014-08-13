# ansible-dropbox

A role for installing dropbox.


## Actions

- Ensures that dropbox is installed (using `apt`)


## Usage:
```
  - name: Install dropbox
    hosts: dropbox
    connection: local
    sudo: yes
    sudo_user: "{{ user }}"
    
    roles:
      - dropbox

```
[workstation:vars]
user=albandri
version=10
home=/workspace/users/{{ user }}{{ version }}/      
```

## License

MIT
