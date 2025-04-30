# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

# Get the Linux version but remove the "-1-ARCH" part
linux_version=$(uname -r | cut -d '-' -f1)

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_cap=$(cat /sys/class/power_supply/BAT0/capacity)

# RAM
total_ram=$(free -h | awk '/Mem:/ {print $2}')
used_ram=$(free -h | awk '/Mem:/ {print $3}')

# Storage (root partition)
storage_info=$(df -h / | awk 'NR==2')
used_storage=$(echo $storage_info | awk '{print $3}')
total_storage=$(echo $storage_info | awk '{print $2}')

# Volume
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n 1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# Final output
if [[ "$mute" == "yes" ]]; then
    volume_output="Muted"
else
    volume_output="$volume"
fi

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo  $used_storage "/" $total_storage 🖴 "|" $used_ram "/" $total_ram "MEM |" $linux_version 🐧 "|" $battery_status  $battery_cap"%" 🔋 "|" $volume_output 📢  "|"$date_formatted
