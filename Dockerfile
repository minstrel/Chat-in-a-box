FROM rails:onbuild
RUN rake db:create db:migrate RAILS_ENV=production
RUN RAILS_ENV=production bundle exec rake assets:precompile
ENV RAILS_ENV production
CMD export SECRET_KEY_BASE=`rake secret` && rails server -b 0.0.0.0
