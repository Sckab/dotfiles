#!/usr/bin/env python3
"""
🌊 Mega Ping Kanagawa Style Versione 1.1 🌊

Stesso script super dettagliato, ma con colori ispirati al tema Kanagawa:
- Header in BLU profondo (Fore.BLUE)
- Testi informativi in “off-white” (Fore.LIGHTWHITE_EX)
- Successi in CIANO tenue (Fore.CYAN)
- Errori/timeout in ROSSO tenue (Fore.LIGHTRED_EX)
- Statistiche in magenta/viola scuro per un tocco di contrasto
"""

import argparse
import subprocess
import sys
import time
import platform
import re
from datetime import datetime
try:
    from colorama import init, Fore, Style
    init(autoreset=True)
except ImportError:
    print("❌ Installa colorama: pip install colorama")
    sys.exit(1)

# ----------------------------------------------------------
# Funzioni di utilità
# ----------------------------------------------------------
def risolvi_host(host):
    """
    Risolve l'host in IP. Ritorna (hostname, ip) o esce se fallisce.
    """
    try:
        import socket
        ip = socket.gethostbyname(host)
        return host, ip
    except Exception as e:
        print(Fore.LIGHTRED_EX + f"❌ Errore risoluzione '{host}': {e}")
        sys.exit(1)

def genera_comando_ping(host_ip, timeout, size, seq):
    """
    Genera il comando ping a seconda del sistema.
    """
    sistema = platform.system().lower()
    if "windows" in sistema:
        return ["ping", "-n", "1", "-w", str(int(timeout * 1000)), "-l", str(size), host_ip]
    else:
        return ["ping", "-c", "1", "-W", str(timeout), "-s", str(size), host_ip]

def estrai_rtt_e_ttl(raw_output):
    """
    Estrae RTT e TTL dall'output del ping. Ritorna (rtt_ms, ttl).
    """
    rtt = None
    ttl = None
    match = re.search(r"ttl=(\d+)\s+time=([\d\.]+)\s*ms", raw_output)
    if match:
        ttl = int(match.group(1))
        rtt = float(match.group(2))
        return rtt, ttl
    match = re.search(r"time[=<]\s*(\d+)ms\s+TTL=(\d+)", raw_output, re.IGNORECASE)
    if match:
        rtt = float(match.group(1))
        ttl = int(match.group(2))
        return rtt, ttl
    return None, None

def stampa_header():
    """
    Stampa l'header in BLU profondo (Kanagawa waves vibes).
    """
    print(Fore.BLUE + Style.BRIGHT + "="*61)
    print(Fore.BLUE + Style.BRIGHT + "                        🌊 MEGA PING 🌊")
    print(Fore.BLUE + Style.BRIGHT + "="*61 + Style.RESET_ALL)
    print()

# ----------------------------------------------------------
# Funzione principale
# ----------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(
        description="Mega Ping Kanagawa Style: dettagliato, colorato, on the waves"
    )
    parser.add_argument(
        "--host", "-H", type=str, required=True, help="Host o dominio da pingare"
    )
    parser.add_argument(
        "--count", "-c", type=int, default=4, help="Numero di ping (default: 4)"
    )
    parser.add_argument(
        "--timeout", "-t", type=float, default=2.0, help="Timeout per ping in secondi (default: 2.0)"
    )
    parser.add_argument(
        "--size", "-s", type=int, default=56, help="Dimensione payload in byte (default: 56)"
    )
    parser.add_argument(
        "--interval", "-i", type=float, default=1.0, help="Intervallo tra ping in secondi (default: 1.0)"
    )
    args = parser.parse_args()

    host, ip = risolvi_host(args.host)
    stampa_header()
    print(Fore.LIGHTWHITE_EX + f"🔍 Risolto '{host}' → IP: {ip}")
    print(Fore.LIGHTWHITE_EX + f"📦 Payload: {args.size} byte | ⏱️ Timeout: {args.timeout}s | 🔁 Count: {args.count} | ⏳ Interval: {args.interval}s")
    print()

    risultati_rtt = []
    success_count = 0

    for seq in range(1, args.count + 1):
        comando = genera_comando_ping(ip, args.timeout, args.size, seq)
        ora_partenza = datetime.now()

        try:
            output = subprocess.run(
                comando, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
            )
            stdout = output.stdout
            stderr = output.stderr

            if output.returncode == 0:
                # Ping riuscito
                rtt, ttl = estrai_rtt_e_ttl(stdout)
                if rtt is None:
                    print(Fore.LIGHTRED_EX + f"⚠️ Impossibile estrarre RTT/TTL da: {stdout.strip()}")
                else:
                    success_count += 1
                    risultati_rtt.append(rtt)
                    ora_ricezione = datetime.now()
                    timestamp = ora_ricezione.strftime('%H:%M:%S.%f')[:-3]
                    print(
                        Fore.CYAN
                        + f"✅ Seq={seq} | RTT={rtt:.2f}ms | TTL={ttl} | Time={timestamp}"
                    )
            else:
                # Ping fallito
                ora_ricezione = datetime.now()
                timestamp = ora_ricezione.strftime('%H:%M:%S.%f')[:-3]
                print(
                    Fore.LIGHTRED_EX
                    + f"❌ Seq={seq} | Timeout/Unreachable (code {output.returncode}) | Time={timestamp}"
                )
        except Exception as e:
            print(Fore.LIGHTRED_EX + f"🔴 Errore ping seq={seq}: {e}")

        if seq < args.count:
            time.sleep(args.interval)

    # Report finale
    print()
    print(Fore.BLUE + Style.BRIGHT + "-"*61)
    print(Fore.BLUE + Style.BRIGHT + "                       📊 STATISTICHE 📊")
    print(Fore.BLUE + Style.BRIGHT + "-"*61 + Style.RESET_ALL)
    print(Fore.MAGENTA + f"Pacchetti inviati: {args.count}")
    print(Fore.MAGENTA + f"Pacchetti ricevuti: {success_count}")
    packets_lost = args.count - success_count
    perc_loss = (packets_lost / args.count) * 100
    print(Fore.MAGENTA + f"Pacchetti persi: {packets_lost} ({perc_loss:.1f}% loss)")
    if risultati_rtt:
        min_rtt = min(risultati_rtt)
        max_rtt = max(risultati_rtt)
        avg_rtt = sum(risultati_rtt) / len(risultati_rtt)
        print(Fore.MAGENTA + f"RTT min: {min_rtt:.2f} ms")
        print(Fore.MAGENTA + f"RTT avg: {avg_rtt:.2f} ms")
        print(Fore.MAGENTA + f"RTT max: {max_rtt:.2f} ms")
    else:
        print(Fore.MAGENTA + "Nessun RTT disponibile (nessun ping riuscito)")

    print(Fore.BLUE + "="*61)
    print(Fore.BLUE + Style.BRIGHT + "                        🔚 FINE PING 🔚")
    print(Fore.BLUE + "="*61 + Style.RESET_ALL)

if __name__ == "__main__":
    main()
