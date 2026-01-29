#!/usr/bin/env bash

# GTA V Style System Monitor Dashboard
# All in English - Cool, animated, neon GTA vibes
# Run with: chmod +x gta_system_monitor.sh && ./gta_system_monitor.sh
# Press Ctrl+C to exit

# ────────────────────────────────────────────────
# Colors & Styles (GTA Neon Theme)
# ────────────────────────────────────────────────
BLACK='\033[0;30m' RED='\033[0;31m' GREEN='\033[0;32m' YELLOW='\033[1;33m'
BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' WHITE='\033[1;37m'
NC='\033[0m' BOLD='\033[1m' DIM='\033[2m' BLINK='\033[5m' UNDER='\033[4m'

# ────────────────────────────────────────────────
# Functions
# ────────────────────────────────────────────────
clear_screen() { clear; }

loading_animation() {
    clear_screen
    echo -e "${PURPLE}${BOLD}"
    cat << 'EOF'
     ██████╗  ██████╗  ████████╗ █████╗ 
    ██╔════╝ ██╔═══██╗ ╚══██╔══╝██╔══██╗
    ██║  ███╗██║   ██║    ██║   ███████║
    ██║   ██║██║   ██║    ██║   ██╔══██║
    ╚██████╔╝╚██████╔╝    ██║   ██║  ██║
     ╚═════╝  ╚═════╝     ╚═╝   ╚═╝  ╚═╝
EOF
    echo -e "${NC}"
    echo -e "${GREEN}${BOLD}      Los Santos System Monitor${NC}"
    echo -e "${YELLOW}     Connecting to Grove Street Network...${NC}"
    echo ""

    local spinner=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    for i in {1..25}; do
        echo -ne "\r${CYAN}${spinner[$((i%10))]} Scanning system... ${NC}"
        sleep 0.08
    done
    echo -e "\n${GREEN}Connection established. Entering dashboard...${NC}"
    sleep 1.5
}

print_header() {
    echo -e "${BLACK}${BOLD}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "  ${PURPLE}${BOLD}GROVE STREET SYSTEM DASHBOARD${NC}   ${YELLOW}v1.0 - Los Santos Edition${NC}"
    echo -e "${BLACK}${BOLD}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

print_status() {
    local uptime=$(uptime -p | sed 's/up //')
    local load=$(uptime | awk -F'load average:' '{print $2}' | sed 's/,//g')
    local cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
    local mem_total=$(free -h | awk '/Mem:/ {print $2}')
    local mem_used=$(free -h | awk '/Mem:/ {print $3}')
    local mem_perc=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
    local disk_total=$(df -h / | awk 'NR==2 {print $2}')
    local disk_used=$(df -h / | awk 'NR==2 {print $3}')
    local disk_perc=$(df / | awk 'NR==2 {printf "%.0f", $5}' | tr -d '%')
    local temp=""
    if command -v sensors >/dev/null 2>&1; then
        temp=$(sensors | grep -oP 'Core \d+:\s+\+\K\d+' | head -1)
        [[ -n "$temp" ]] && temp="${temp}°C"
    fi

    echo -e "${CYAN}${BOLD}SYSTEM STATUS${NC} ${DIM}(Updated: $(date '+%H:%M:%S'))${NC}"
    echo -e "  ${YELLOW}Uptime:${NC}          ${GREEN}$uptime${NC}"
    echo -e "  ${YELLOW}Load Average:${NC}    ${GREEN}$load${NC}"
    echo -e "  ${YELLOW}CPU Usage:${NC}       ${RED}${cpu}%${NC} ${DIM}(core avg)${NC}"
    echo -e "  ${YELLOW}Memory:${NC}          ${mem_used} / ${mem_total}  ${RED}${mem_perc}%${NC}"
    echo -e "  ${YELLOW}Disk (/):${NC}        ${disk_used} / ${disk_total}  ${RED}${disk_perc}%${NC}"
    [[ -n "$temp" ]] && echo -e "  ${YELLOW}CPU Temp:${NC}        ${RED}${temp}${NC}"

    # Quick network status
    local ip=$(ip -4 addr show scope global | grep inet | awk '{print $2}' | head -1 | cut -d/ -f1)
    echo -e "  ${YELLOW}Local IP:${NC}        ${CYAN}${ip:-Disconnected}${NC}"

    # Mini progress bars (GTA style)
    echo ""
    echo -e "${DIM}CPU:${NC}  ${RED}[${BOLD}$(printf '█%.0s' $(seq 1 $((cpu/5))))${NC}$(printf ' %.0s' $(seq 1 $((20 - cpu/5)))) ]  ${cpu}%${NC}"
    echo -e "${DIM}RAM:${NC}  ${RED}[${BOLD}$(printf '█%.0s' $(seq 1 $((mem_perc/5))))${NC}$(printf ' %.0s' $(seq 1 $((20 - mem_perc/5)))) ]  ${mem_perc}%${NC}"
    echo -e "${DIM}DISK:${NC} ${RED}[${BOLD}$(printf '█%.0s' $(seq 1 $((disk_perc/5))))${NC}$(printf ' %.0s' $(seq 1 $((20 - disk_perc/5)))) ]  ${disk_perc}%${NC}"
}

neon_border() {
    echo -e "${PURPLE}${BOLD}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}${BOLD}║${NC}                                                            ${PURPLE}${BOLD}║${NC}"
    echo -e "${PURPLE}${BOLD}╚════════════════════════════════════════════════════════════╝${NC}"
}

refresh_loop() {
    while true; do
        clear_screen
        print_header
        neon_border
        print_status
        neon_border
        echo ""
        echo -e "${DIM}  Press Ctrl+C to exit. System monitoring in progress...${NC}"
        sleep 3  # Refresh every 3 seconds
    done
}

# ────────────────────────────────────────────────
# Start the dashboard
# ────────────────────────────────────────────────
loading_animation
refresh_loop
