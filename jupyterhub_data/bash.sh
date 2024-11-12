chmod 777 /srv/share_data
chown root:users /srv/share_data

# Step 3: Set up the share_data link in /etc/skel so it appears in new users' home directories
echo "Creating symlink in /etc/skel for new users..."
ln -s /srv/share_data /etc/skel/share_data

# Step 4: Create a script to add the share_data link to existing users' home directories
echo "Creating symlink for existing users' home directories..."
for user_home in /home/*; do
    if [ -d "$user_home" ] && [ ! -L "$user_home/share_data" ]; then
        ln -s /srv/share_data "$user_home/share_data"
    fi
done