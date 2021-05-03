#!/bin/bash
pr_number=$1
deploy_type=$2

PROJECT_NAME="saad-pr$pr_number"
PROJECT_SITE_NAME="SAAD"
PROJECT_PROFILE="drupalsaudi"

git clone https://github.com/drupalsaudi/saudi-distribution.git "pr$pr_number"
cd "pr$pr_number"
git checkout drupalsaudi-dev
git fetch origin pull/$pr_number/head:"pull_$pr_number"
git checkout "pull_$pr_number"

# with lando
if [ "$deploy_type" == "lando" ]; then
  lando init --source cwd --recipe drupal8 --name $PROJECT_NAME --webroot .
  lando start
  lando drush si $PROJECT_PROFILE --db-url=mysql://drupal8:drupal8@database:3306/drupal8 --site-name=$PROJECT_SITE_NAME --account-pass='admin' -y  
fi

