user_name="Richard Priestley"
email="richard.priestley@gmail.com"

echo "User Setup"
git config --global user.email ${email}
git config --global user.name "${user_name}"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
