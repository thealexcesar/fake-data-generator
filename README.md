# Fake Data Generator

![GitHub](https://img.shields.io/github/license/thealexcesar/fake-data-generator)
[![Release](https://img.shields.io/github/release/thealexcesar/fake-data-generator?label=Release&color=green&style=flat)](https://github.com/thealexcesar/fake-data-generator/releases)

## Overview

Fake Data Generator is a simple Ruby application that generates fake data for various types such as names, emails,
phone numbers, and more. It uses the Faker gem to create realistic-looking data for testing or other purposes.

## Features

- Generate fake data for different types:
  - p (paragraph),
  - w (word),
  - m (email),
  - n (name),
  - p (phone_number),
  - i (valid),
  - p (cpf),
  - p (cnpj)
  - we will have more soon

- Copy generated data to the clipboard for easy use.

## Installation

> Ensure you have Ruby installed on your system.

### Automated Installation (Recommended)

1. Setup and create an alias automated
    ```bash
    url="git@github.com:thealexcesar/fake-data-generator.git"
    repo_name=$(echo "$url" | awk -F/ '{print substr($NF, 1, length($NF)-4)}')
    cd $repo_name
    zsh setup.sh
    ```
> Note: In the last line, switch `zsh setup.sh` to `bash setup.sh` if you are using that shell.
2. Running
    ```bash
    fake <type> [quantity optional(default 1)]
    ```

### Using Docker

    ```bash
    latest_release=$(curl -s https://api.github.com/repos/thealexcesar/fake-data-generator/releases/latest | jq -r .tag_name)
    docker pull thealexcesar/fake-data-generator:$latest_release
    ```

or

    ```bash
    git clone git@github.com:thealexcesar/fake-data-generator.git && cd fake-data-generator
    
    docker build -t fake .
    docker run -it fake ruby src/app.rb <type> [quantity optional(default 1)]
    # Ex: docker run -it fake ruby src/app.rb n
    ```

### Manual Installation


1. Clone the repository and navigate to the project directory:

    ```bash
    git clone git@github.com:thealexcesar/fake-data-generator.git && cd fake-data-generator
    ```

2. Install the required gems:

    ```bash
    gem install faker clipboard
    ```

3. Start generating fake data:

    ```bash
    ruby src/app.rb <type> [quantity optional(default 1)]
    ```
#### Ex to generate 3 fake paragraphs:
1. With Alias:
    ```bash
    fake p 3
    ```

2. Without Alias: 
    ```bash
   ruby src/app.rb p 3                                           # In project path.
    ```
   
3. Returns
    ```bash
         fake p 3            
        ruby src/app.rb p 3                                          
        # => +----------------------------------------------------------------------+
        # => | Dolor et autem. Omnis amet consequatur. Fugiat rerum necessitatibus. |
        # => |     Voluptate ab velit. Sunt quas laborum. Aspernatur illo sint.     |
        # => |           Dolorem qui odit. Ab ut eveniet. Maxime aut et.            |
        # => +----------------------------------------------------------------------+
        # => 3 items of fake data have been generated
    ```