```
sudo docker run --rm -it -v$PWD:/output livekit/generate
```

Sample:
Generating config for production LiveKit deployment
This deployment will utilize docker-compose and Caddy. It'll set up a secure LiveKit installation with built-in TURN/TLS
SSL Certificates for HTTPS and TURN/TLS will be generated automatically via LetsEncrypt or ZeroSSL.

✔ with both Egress and Ingress
Primary domain name (i.e. livekit.myhost.com): livekit.local
TURN domain name (i.e. livekit-turn.myhost.com): livekit-turn.local
Ingress WHIP domain name (optional, i.e. livekit-whip.myhost.com): livekit-whip.local
✔ Let's Encrypt (no account required)
✔ latest
✔ yes
✔ Skip
Your production config files are generated in directory: livekit.local

Please point update DNS for the following domains to the IP address of your server.
 * livekit.local
 * livekit-turn.local
 * livekit-whip.local
Once started, Caddy will automatically acquire TLS certificates for the domains.

You can copy the folder to your server and run: "docker-compose up"

Since you've enabled Egress/Ingress, we recommend running it on a machine with at least 4 cores

Please ensure the following ports are accessible on the server
 * 443 - primary HTTPS and TURN/TLS
 * 80 - for TLS issuance
 * 7881 - for WebRTC over TCP
 * 3478/UDP - for TURN/UDP
 * 50000-60000/UDP - for WebRTC over UDP
 * 1935 - for RTMP Ingress
 * 7885/UDP - for WHIP Ingress WebRTC

Server URL: wss://livekit.local
RTMP Ingress URL: rtmp://livekit.local/x
WHIP Ingress URL: https://livekit-whip.local/w
API Key: APIiWXGfvH4CXVu
API Secret: cfVu3xm4duPQGVWEmqyBasdtAT8ndchxo2KpjqylP3T

Here's a test token generated with your keys: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDYzOTE4NzUsImlzcyI6IkFQSWlXWEdmdkg0Q1hWdSIsIm5hbWUiOiJUZXN0IFVzZXIiLCJuYmYiOjE3MTAzOTE4NzUsInN1YiI6InRlc3QtdXNlciIsInZpZGVvIjp7InJvb20iOiJteS1maXJzdC1yb29tIiwicm9vbUpvaW4iOnRydWV9fQ.axs11y0q3wYOk7Vxxfzqyra4JGNsAkcmqZIfSJRXBPE

An access token identifies the participant as well as the room it's connecting to

Reference: https://www.linode.com/docs/guides/live-streaming-with-livekit-and-obs/