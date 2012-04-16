#
# .cj
# 

# I dot this file before running some shell scripts.

. /pt/w/b4/cj4b4/.orcl

export CJ4B4=/pt/w/b4/cj4b4
export PATH=${CJ4B4}/bin:$PATH
# $B4 is where I have rails_root for bot4.us
export B4=/pt/w/b4/b4

# . /home/oracle/.rvm/scripts/rvm
# export MY_RUBY_HOME=/home/oracle/.rvm/rubies/ruby-1.9.2-p290
# export RUBY_VERSION=ruby-1.9.2-p290
# export GEM_HOME=/home/oracle/.rvm/gems/ruby-1.9.2-p290
# export GEM_PATH=/home/oracle/.rvm/gems/ruby-1.9.2-p290
# export PATH=${MY_RUBY_HOME}/bin:${GEM_HOME}/bin:${PATH}

export GEM_HOME=/home/oracle/.rvm/gems/ruby-1.9.2-p318
export GEM_PATH=$GEM_HOME

unset MY_RUBY_HOME RUBY_VERSION
export PATH=/pt/nodejs/bin:/home/oracle/.rvm/rubies/default/bin:${GEM_PATH}/bin:${PATH}
