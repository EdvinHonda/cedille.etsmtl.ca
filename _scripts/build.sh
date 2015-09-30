#!/bin/bash

apt install -y openssh-server xdotool
bundle install
bundle exec jekyll build
bundle exec htmlproof ./_site
jekyll build
ssh-keyscan cedille.etsmtl.ca >> ~/.ssh/known_hosts
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCs7zNSFJv1ovWZWQPC/fsFAM2wr3jVSAi1y7jYlvk7j/EYY1SNv5jemFuP4cLskH17siOYB51jz5KVY9DuAMxEMy10h7otd1DCbv8VeQJotj6rKvglxrdV6w3hs7gojJKkTUhQ4ViG4E8Y+hVWNvH2NF6GlESQkoJaX7Ov7HVkI9O8LHdbzjh5DelkhrY8NSTFduLha7TNfWVTzPR2GobWO92CCjriVq3bZ2iJmRC9itfGNf5WR4qGIBNuqGtcNjWy9dCqcgDIL9lqmlNrnYlEkS09hX98Z4/G6WROlE5ZygbYAfRom5XGAfopriSBQT2KPptBCB/j0IkqhCV9TbTL6koNFHGjqSTU5EsLsuFtbRTkWxAIyvI22v47FrGjlIDKJHU3Af4goqNWQL8Owo+0aRXj4XmvFfcuNqamwy3fEeAx7bK5U44dQhxYe7p5Ear2/g7bERZxLY2o4ibXGSXCs7aU91l0PA87uswK3caL4BlUJxFTc01MdGZaY/i1wigQAp9/Tov9GH5jG5W4lFaNPV3Soetw1ZmDIIsBB9CDTnqzAYPNjBEgl6cFyNU4QHCufqm5uYZy6Y4bQpWAL0B/LBmmGqCz+65ouwQCXNhw8YRSuRi5ighn7dl72y5w7edb5dmSfWaIl5peoEXKpiWSK/QlgZmg3FCN0P140CGIAw== cedille@cedille-server" > ~/.ssh/authorized_keys
restart ssh
ssh-keygen -t rsa -N "" -f ~./.ssh/id_rsa
#ssh -T cedille@cedille.etsmtl.ca
#rsync ./_site/* cedille@cedille.etsmtl.ca:/home/cedille/site-web/_site/
#sleep 3
sshpass -p 'coffeeinmybloodveins' rsync --progress -avz -e ssh ./_site/* cedille@cedille.etsmtl.ca:/home/cedille/site-web/_site/
