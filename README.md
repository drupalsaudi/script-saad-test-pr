# script-saad-test-pr

Script to test SAAD distribution pull requests.


**This script has two parameters:**
- First parameter is the PR number.
- Second parameter is the deploy type. Supporting only `lando`. which will spins up a new Docker container using [Lando](https://lando.dev).

# Installation
```
git clone https://github.com/drupalsaudi/script-saad-test-pr.git
cd script-saad-test-pr
chmod +x saad-test-pr.sh
./saad-test-pr.sh PR_NUMBER_HERE lando
```

# Usage

To test the PR number 52 you can use `./saad-test-pr.sh 52`
This will clone the project and checkout the needful PR by PR number.

To automate the same process and launch a new host using Lando you can use: `./saad-test-pr.sh 52 lando` and this command will create a lando file and starting the Docker for you, it will install the drupalsaudi profile also so you will just need to visit the website using the lando URL directly.

Note: This is a test script so it is not handling the validations of the output, so please use it carefully.
