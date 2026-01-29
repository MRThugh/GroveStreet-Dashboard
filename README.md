

# GroveStreet-Dashboard

<div align="center">

  <h1>🌃 GroveStreet-Dashboard</h1>
  
  <p>
    <strong>Neon-lit GTA V style system monitor dashboard for Linux terminal</strong><br>
    CPU • RAM • Disk • Uptime • Network – Pure street vibes from Grove Street
  </p>

  <img src="https://placehold.co/800x450/0d1117/00ff9f?text=Grove+Street+Dashboard+Demo&font=roboto" alt="Dashboard Preview" width="80%"/>

  <br>

  <sub>Built by <a href="https://github.com/MRThugh">MRThugh (Ali Kamrani)</a> – Always curious about tech & design</sub>

</div>

<br>

### 🔥 Features

- GTA V inspired loading screen with spinner animation and ASCII art
- Cyberpunk neon color palette (purple, neon green, red, yellow)
- Real-time system statistics:
  - CPU usage
  - Memory (RAM) usage
  - Root disk (/) usage
  - System uptime
  - Load average
  - Local IP address
- Clean terminal progress bars for CPU, RAM, and Disk
- Auto-refresh every 3 seconds
- Optional CPU temperature display (requires `lm-sensors`)
- Zero external dependencies – 100% pure Bash
- Exit gracefully with Ctrl+C
- 

### 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/MRThugh/GroveStreet-Dashboard.git
cd GroveStreet-Dashboard

# Make the script executable
chmod +x gta_system_monitor.sh

# Launch the dashboard
./gta_system_monitor.sh
```

One-liner to try it instantly:

```bash
curl -sSL https://raw.githubusercontent.com/MRThugh/GroveStreet-Dashboard/main/gta_system_monitor.sh | bash
```

### 🛠 Requirements

- Linux (tested on Ubuntu, Arch, Fedora, Debian, etc.)
- Bash ≥ 4
- Optional: `lm-sensors` for CPU temperature  
  ```bash
  sudo apt install lm-sensors      # Ubuntu / Debian
  sudo dnf install lm_sensors      # Fedora
  sudo pacman -S lm_sensors        # Arch
  ```

### 🎮 Controls

- Sit back and watch the dashboard
- `Ctrl + C` → Exit

### ✍️ Author

Created by **Ali Kamrani** (GitHub: [@MRThugh](https://github.com/MRThugh))  

Passionate about creative tools, UI/UX, programming languages, and building cool stuff.  
Location: Qazvin, Iran

Check out my other projects:  
- [KamraniLang](https://github.com/MRThugh/KamraniLang) – A beginner-friendly interpreted language  
- [PassThugh](https://github.com/MRThugh/PassThugh) – Neon password generator  
- [Colorify](https://github.com/MRThugh/Colorify) – Color palette tool  
- [Bara-PWA](https://github.com/MRThugh/Bara-PWA) – Weather PWA  

### 🤝 Contributing

Pull requests are welcome!  
Ideas that would be awesome:
- Add short GTA sound effects (using `paplay` or `mpv`)
- Laptop battery status support
- Theme variants (Vice City neon, San Andreas desert, etc.)
- Hidden cheat-code easter eggs

### 📜 License

[MIT License](LICENSE) – Free to use, modify, share

<div align="center">
  <sub>Built with 💚 & neon dreams – Ali Kamrani © 2025/2026</sub>
</div>
```
