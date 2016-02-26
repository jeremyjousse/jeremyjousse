---
title: Using Travis to deploy Middleman on Github pages
summary: Using Travis to deploy Middleman on Github pages
date: 2016/02/08
category: Dev
tags: middleman, travis, github
author: Jérémy Jousse
published: true
---
I recently created a blog scaffold for a friend of my using Middleman.
Using [Github pages](https://pages.github.com/){:target="_blank"} in addition
to Middleman allows my friend to host his blog without any charge.
This is great but my friend is not a geek, and he does not hold back all the
Middleman boring commands to commit, generate, and deploy his blog.

I finaly found [prose.io](http://prose.io/){:target="_blank"} a content editor
for GitHub designed for managing websites. With a little my time of configuring
[prose.io](http://prose.io/){:target="_blank"}, my friend has finally a GUI
editor to handle his Middleman blog.

The last challenge was to automate the build and deployment of his blog after
each commit.

READMORE

The middleman extention directory list [8 deployment gems](https://directory.middlemanapp.com/#/extensions/deployment){:target="_blank"}, I've chosen [middleman-deploy](https://github.com/middleman-contrib/middleman-deploy){:target="_blank"} which is an official contribution form Middleman team.
This gem is also extermly simple to use with github pages.

First add the middleman-deploy gem to your Gemfile

~~~ruby
gem 'middleman-deploy'
~~~

Then activate the deploy pluggin in Middleman config.rb file

~~~ruby
activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
end
~~~

This activates the deploy pluggin to deploy using github pages. Find the complet middleman-deploy documentation on his [Github project](https://github.com/middleman-contrib/middleman-deploy){:target="_blank"}

You can now log to Travis, then activate Travis integration to you project.
![My Photo](/images/posts/2016-02-08-using-travis-to-deploy-middleman-on-github-pages/enable-your-project-for-travis-build.jpg){:class="img-fluid"}


Now you have to generate a Github Personal Access Token form your [Github Tokens Settings page](https://github.com/settings/tokens){:target="_blank"}
![My Photo](/images/posts/2016-02-08-using-travis-to-deploy-middleman-on-github-pages/generate-a-github-personal-access-token.jpg){:class="img-fluid"}


Then add your Github Personal Access Token to your Travis project settings using Environment Variables.
Your Github Personal Access Token will be "GH_TOKEN" Environment Variable (do not enable the "Display value in build log" option for this variable !).
![My Photo](/images/posts/2016-02-08-using-travis-to-deploy-middleman-on-github-pages/add-the-personal-token-to-travis-conf.jpg){:class="img-fluid"}


Now you can create a .travis.yml file.

~~~
language: ruby
rvm:
  - 2.3.0
cache: bundler
script:
  - git config --global user.name '${GIT_NAME}'
  - git config --global user.email '${GIT_NAME}'
  - git remote set-url origin https://<your-github-user>:${GH_TOKEN}@github.com/<your-github-user>/<your-github-repository>.git
  - bundle exec middleman deploy
~~~

You now only have to commit and push your updates to see your Middleman website magically updated.

If you missed something you can have a look at my [Middleman project](https://github.com/jeremyjousse/jeremyjousse/){:target="_blank"}.

<!-- <script src="https://gist.github.com/jeremyjousse/2880497.js"></script> -->
