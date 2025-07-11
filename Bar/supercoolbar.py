from time import sleep
from datetime import datetime
from subprocess import check_output, CalledProcessError
import json
import re

weeks = ("Måndag", "Tisdag", "Onsdag", "Torsdag", "Fredag", "Lördag", "Söndag")
months = ("Januari", "Februari", "Mars", "April", "Maj", "Juni", "Juli", "Augusti", "Oktober", "September", "November", "December")

sep = "   "

white  = "#eeeeee"
red    = "#cc241d"
orange = "#fe8019"
yellow = "#fabd2f"
green  = "#b8bb26"

# print('{"version": 1}\n[', end="")

if 1:
    now = datetime.now()
    weekday = weeks[now.weekday()]
    day = now.day
    time = f"{now.hour:02d}:{now.minute:02d}"
    month = months[now.month-1]

    try:
        network_name = check_output(("iwgetid", "-r")).replace("\n".encode(), "".encode()).decode("utf-8")
        if network_name.isspace():
            network_name = "Oansluten"
    except Exception:
        network_name = "Oansluten"

    battery = check_output(("cat", "/sys/class/power_supply/BAT0/capacity")).decode().strip()
    charging = "+" if check_output(("cat", "/sys/class/power_supply/BAT0/status")).decode().strip() != \
        "Discharging" else "-"

    temp = check_output("sensors").decode("ascii", errors="ignore")
    temp = re.search(r"temp1:(.*)", temp).group(1).strip()[1:-1]
    temp = int(float(temp))

    brightness = check_output("light").decode().strip()
    brightness = brightness[:brightness.index(".")]

    volume = check_output(("pactl", "get-sink-volume", "@DEFAULT_SINK@")).decode()
    # volume = volume[volume.index("%")-2:volume.index("%")].lstrip()
    volume = re.search(r"\d*%", volume).group(0)

    try:
        bluetooth = check_output(("bluetoothctl", "info")).decode()
        bluetooth = re.search(r"Name: (.*)", bluetooth).group(1)
    except CalledProcessError:
        bluetooth = "Oansluten"

    widgets = (
        f"{weekday} {day} {month} {time}",
        f"Nät: {network_name}",
        f"Bt: {bluetooth}",
        (f"Bat: {battery}% ",
                red if int(battery) < 30 and charging == "-" else white,
                None),
        (charging, green if charging == "+" else red),
        (f"Vol: {volume}", white),
        (f"Temp: {temp}°C", red    if temp >= 85 else \
                            orange if temp >= 70 else \
                            yellow if temp >= 55 else green),
        f"Ljus: {brightness}%",
    )

    out = []

    for w in widgets:
        if type(w) is not tuple:
            w = (w, white)

        out.append({
            "full_text": w[0] + (sep if w[-1] is not None else ""),
            "color": w[1],
            "separator": False,
            "separator_block_width": 0,
        })

    out = json.dumps(out) + ","

    print(out, flush=True,  end="")

    # sleep(3)

