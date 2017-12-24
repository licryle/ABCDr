Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# How to install:
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update

sudo apt-get install ruby2.3 ruby2.3-dev rails libpq-dev
sudo apt-get install postgresql postgresql-contrib

git clone https://github.com/licryle/ABCDr.git
cd ABCDr/
git checkout master

sudo gem install nio4r -v '2.1.0'
gem install pg -v '0.21.0'
bundle install

# Configure
sudo -u postgres createuser -s $USER
rake db:create

# How to run
rails server