# .local/bin/eurjpy.sh
#!/bin/bash
rate=$(/usr/bin/curl -sL "https://api.frankfurter.app/latest?from=EUR&to=JPY" | /usr/bin/python3 -c "import sys,json; d=json.load(sys.stdin); print(f\"{d['rates']['JPY']:.0f}\")" 2>/dev/null)
echo "EURJPY ${rate:--}"
