Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zru3z-0004ZM-2J
 for ath10k@lists.infradead.org; Thu, 29 Oct 2015 20:44:49 +0000
Message-ID: <56328521.7030308@gmx.net>
Date: Thu, 29 Oct 2015 21:44:17 +0100
From: Michael Krupp <michaelkrupp@gmx.net>
MIME-Version: 1.0
Subject: Re: Support for QCA6174 [168c:003e]
References: <562C5328.4060002@gmx.net>
 <CA+BoTQ=BXTSB0ZMJ9v4kBoGN1MC3TjZvjkqx2ndn0hjbPM7z3A@mail.gmail.com>
 <562E98AC.9010208@gmx.net>
 <CA+BoTQm59x1KZGrkqXZAMfqoe5=Z03wszvWiNw+feqNinsa9Hw@mail.gmail.com>
 <562F5E5D.5090205@gmx.net>
 <CA+BoTQ=zyC4aGW+1HNG7d7Ae3yr6SCdt6YRYQ9rhK7iqokYMCg@mail.gmail.com>
 <562F6790.8070601@gmx.net>
In-Reply-To: <562F6790.8070601@gmx.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2770955616730572428=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: michal.kazior@tieto.com
Cc: ath10k@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2770955616730572428==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JES7MlGl8hU0PFbg4pNoshX8mt0ub4Jxi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JES7MlGl8hU0PFbg4pNoshX8mt0ub4Jxi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Micha=C5=82,

I did some more testing with iperf, two different APs:
 * TP-Link TL-WR941ND
 * Speedport W 723V B

I'm using my old notebook WiFi (AR9285, ath9k) as reference here. All of =
the
results below are reliably repeatable, with minimal deviation. Kernel ver=
sions
do not seem to have any meaningful impact, neither does setting the TCP/C=
C
algorithm. The following tests were run on 4.2 using "reno".

The numbers I get look very strange to me. I tried playing around with bu=
ffer
sizes, but with no effect (http://lists.infradead.org/pipermail/ath10k/20=
15-October/006160.html)

I also noted, that the QCA6174 does not seem to like close proximity to t=
he AP.
When I get any closer than about 3m to the AP, connection drops to less t=
han
1Mbit/s average. Same result with both APs vs the QCA6174 (TCP):

[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 1.0 sec   128 KBytes  1.05 Mbits/sec
[  3]  1.0- 2.0 sec   128 KBytes  1.05 Mbits/sec
[  3]  2.0- 3.0 sec  0.00 Bytes  0.00 bits/sec
[  3]  3.0- 4.0 sec  0.00 Bytes  0.00 bits/sec
[  3]  4.0- 5.0 sec   128 KBytes  1.05 Mbits/sec
[  3]  5.0- 6.0 sec  0.00 Bytes  0.00 bits/sec
[  3]  6.0- 7.0 sec   384 KBytes  3.15 Mbits/sec
[  3]  7.0- 8.0 sec   128 KBytes  1.05 Mbits/sec
[  3]  8.0- 9.0 sec   256 KBytes  2.10 Mbits/sec
[  3]  9.0-10.0 sec  0.00 Bytes  0.00 bits/sec
[  3] 10.0-11.0 sec  0.00 Bytes  0.00 bits/sec
[  3] 11.0-12.0 sec  0.00 Bytes  0.00 bits/sec
[  3] 12.0-13.0 sec  0.00 Bytes  0.00 bits/sec
[  3] 13.0-14.0 sec   128 KBytes  1.05 Mbits/sec
[  3] 14.0-15.0 sec   256 KBytes  2.10 Mbits/sec


UDP traffic at first is more or less stable around 40Mbit/s, but also ran=
domly
drops down to zero, quickly ramps up to 100M, drops again and finally
stabilizes at around 100M again (log cropped):

[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 1.0 sec  5.16 MBytes  43.3 Mbits/sec
[  3]  1.0- 2.0 sec  4.74 MBytes  39.8 Mbits/sec
[  3]  2.0- 3.0 sec  5.70 MBytes  47.8 Mbits/sec
[  3]  3.0- 4.0 sec  4.59 MBytes  38.5 Mbits/sec
[  3]  4.0- 5.0 sec  4.63 MBytes  38.8 Mbits/sec
=2E.. // seems stable at first, then drops and quickly ramps up
[  3] 53.0-54.0 sec  4.48 MBytes  37.6 Mbits/sec
[  3] 54.0-55.0 sec  2.67 MBytes  22.4 Mbits/sec
[  3] 55.0-56.0 sec   294 KBytes  2.41 Mbits/sec
[  3] 56.0-57.0 sec  2.13 MBytes  17.9 Mbits/sec
[  3] 57.0-58.0 sec  8.09 MBytes  67.9 Mbits/sec
[  3] 58.0-59.0 sec  12.2 MBytes   102 Mbits/sec
[  3] 59.0-60.0 sec  13.2 MBytes   110 Mbits/sec
=2E.. // stable for a couple of seconds, then drops again
[  3] 65.0-66.0 sec  13.2 MBytes   111 Mbits/sec
[  3] 66.0-67.0 sec  7.11 MBytes  59.7 Mbits/sec
[  3] 67.0-68.0 sec  4.24 MBytes  35.6 Mbits/sec
[  3] 68.0-69.0 sec  2.30 MBytes  19.3 Mbits/sec
[  3] 69.0-70.0 sec  3.20 MBytes  26.8 Mbits/sec
[  3] 70.0-71.0 sec  1.93 MBytes  16.2 Mbits/sec
[  3] 71.0-72.0 sec  1.92 MBytes  16.1 Mbits/sec
[  3] 72.0-73.0 sec  2.80 MBytes  23.5 Mbits/sec
[  3] 73.0-74.0 sec  4.11 MBytes  34.5 Mbits/sec
[  3] 74.0-75.0 sec  3.11 MBytes  26.1 Mbits/sec
[  3] 75.0-76.0 sec  2.47 MBytes  20.7 Mbits/sec
[  3] 76.0-77.0 sec   678 KBytes  5.55 Mbits/sec
[  3] 77.0-78.0 sec   589 KBytes  4.82 Mbits/sec
[  3] 78.0-79.0 sec  68.9 KBytes   564 Kbits/sec
[  3] 79.0-80.0 sec  0.00 Bytes  0.00 bits/sec
[  3] 80.0-81.0 sec  68.9 KBytes   564 Kbits/sec
=2E.. // peaks and drops between 0 and around 580k
[  3] 107.0-108.0 sec   138 KBytes  1.13 Mbits/sec
[  3] 108.0-109.0 sec   586 KBytes  4.80 Mbits/sec
[  3] 109.0-110.0 sec   597 KBytes  4.89 Mbits/sec
[  3] 110.0-111.0 sec   350 KBytes  2.87 Mbits/sec
[  3] 111.0-112.0 sec   212 KBytes  1.74 Mbits/sec
[  3] 112.0-113.0 sec   741 KBytes  6.07 Mbits/sec
[  3] 113.0-114.0 sec  1.48 MBytes  12.4 Mbits/sec
[  3] 114.0-115.0 sec  2.19 MBytes  18.4 Mbits/sec
=2E.. // now slowly ramps up again
[  3] 131.0-132.0 sec  5.06 MBytes  42.4 Mbits/sec
[  3] 132.0-133.0 sec  9.00 MBytes  75.5 Mbits/sec
[  3] 133.0-134.0 sec  10.8 MBytes  90.7 Mbits/sec
[  3] 134.0-135.0 sec  12.8 MBytes   108 Mbits/sec
=2E.. // and stabilizes
[  3] 169.0-170.0 sec  11.1 MBytes  93.2 Mbits/sec
[  3] 170.0-171.0 sec  11.6 MBytes  97.3 Mbits/sec
[  3] 171.0-172.0 sec  10.4 MBytes  87.6 Mbits/sec
[  3] 172.0-173.0 sec  11.7 MBytes  97.9 Mbits/sec

This behavior is reproducible with both APs. Only difference is that the
W 723V B only reaches about 45Mbit/s.

My old AR9285 remains stable between 40 and 50Mbit/s, with both APs.



I'm really reaching a point here, where I do not know enough about WiFi t=
o debug
this any further... Would more test data (maybe nstat, tcpdump, etc...) b=
e of
any use for you or someone else to help fix this problem?



Greetings,
Michael

---

Some more TCP-tests with iperf. Parallelization (ipef -P X) does not seem=
 to
have any effect on total average throughput. I cropped the logs for bette=
r
clarity, when there were no significant changes anymore.

1) TL-WR941ND <-> AR9285 (TCP):

It slowly ramps up and stabilizes around 45Mbit/s:

[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 1.0 sec  2.50 MBytes  21.0 Mbits/sec
[  3]  1.0- 2.0 sec  2.38 MBytes  19.9 Mbits/sec
[  3]  2.0- 3.0 sec  2.38 MBytes  19.9 Mbits/sec
[  3]  3.0- 4.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3]  4.0- 5.0 sec  2.00 MBytes  16.8 Mbits/sec
[  3]  5.0- 6.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3]  6.0- 7.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3]  7.0- 8.0 sec  2.75 MBytes  23.1 Mbits/sec
[  3]  8.0- 9.0 sec  2.38 MBytes  19.9 Mbits/sec
[  3]  9.0-10.0 sec  2.25 MBytes  18.9 Mbits/sec
[  3] 10.0-11.0 sec  2.00 MBytes  16.8 Mbits/sec
[  3] 11.0-12.0 sec  2.62 MBytes  22.0 Mbits/sec
[  3] 12.0-13.0 sec  2.50 MBytes  21.0 Mbits/sec
[  3] 13.0-14.0 sec  2.88 MBytes  24.1 Mbits/sec
[  3] 14.0-15.0 sec  2.62 MBytes  22.0 Mbits/sec
[  3] 15.0-16.0 sec  2.62 MBytes  22.0 Mbits/sec
[  3] 16.0-17.0 sec  2.62 MBytes  22.0 Mbits/sec
[  3] 17.0-18.0 sec  2.62 MBytes  22.0 Mbits/sec
[  3] 18.0-19.0 sec  2.88 MBytes  24.1 Mbits/sec
[  3] 19.0-20.0 sec  2.75 MBytes  23.1 Mbits/sec
[  3] 20.0-21.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 21.0-22.0 sec  5.25 MBytes  44.0 Mbits/sec
[  3] 22.0-23.0 sec  5.25 MBytes  44.0 Mbits/sec
[  3] 23.0-24.0 sec  5.12 MBytes  43.0 Mbits/sec
[  3] 24.0-25.0 sec  5.38 MBytes  45.1 Mbits/sec
[  3] 25.0-26.0 sec  5.25 MBytes  44.0 Mbits/sec
[  3] 26.0-27.0 sec  5.12 MBytes  43.0 Mbits/sec
[  3] 27.0-28.0 sec  5.25 MBytes  44.0 Mbits/sec
[  3] 28.0-29.0 sec  5.12 MBytes  43.0 Mbits/sec
[  3] 29.0-30.0 sec  5.25 MBytes  44.0 Mbits/sec
[  3] 30.0-31.0 sec  5.38 MBytes  45.1 Mbits/sec
=2E..

2) TL-WR941ND <-> QCA6174 (TCP):

Connection is mostly stable around 5.2Mbit/s, but seems to randomy drop t=
o
1.05Mbit/s.

[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 1.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3]  1.0- 2.0 sec   640 KBytes  5.24 Mbits/sec
[  3]  2.0- 3.0 sec   768 KBytes  6.29 Mbits/sec
[  3]  3.0- 4.0 sec   640 KBytes  5.24 Mbits/sec
[  3]  4.0- 5.0 sec   768 KBytes  6.29 Mbits/sec
[  3]  5.0- 6.0 sec   768 KBytes  6.29 Mbits/sec
[  3]  6.0- 7.0 sec   768 KBytes  6.29 Mbits/sec
[  3]  7.0- 8.0 sec   768 KBytes  6.29 Mbits/sec
[  3]  8.0- 9.0 sec   640 KBytes  5.24 Mbits/sec
[  3]  9.0-10.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 10.0-11.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 11.0-12.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 12.0-13.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 13.0-14.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 14.0-15.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 15.0-16.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 16.0-17.0 sec   384 KBytes  3.15 Mbits/sec
[  3] 17.0-18.0 sec   384 KBytes  3.15 Mbits/sec
[  3] 18.0-19.0 sec   128 KBytes  1.05 Mbits/sec
[  3] 19.0-20.0 sec   128 KBytes  1.05 Mbits/sec
[  3] 20.0-21.0 sec   128 KBytes  1.05 Mbits/sec
[  3] 21.0-22.0 sec   256 KBytes  2.10 Mbits/sec
[  3] 22.0-23.0 sec   256 KBytes  2.10 Mbits/sec
[  3] 23.0-24.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 24.0-25.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 25.0-26.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 26.0-27.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 27.0-28.0 sec   512 KBytes  4.19 Mbits/sec
[  3] 28.0-29.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 29.0-30.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 30.0-31.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 31.0-32.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 32.0-33.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 33.0-34.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 34.0-35.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 35.0-36.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 36.0-37.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 37.0-38.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 38.0-39.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 39.0-40.0 sec   640 KBytes  5.24 Mbits/sec
[  3] 40.0-41.0 sec   640 KBytes  5.24 Mbits/sec
=2E..

3) W 723V B <-> AR9285 (TCP):

Almost immediately reaches max throughput of around 35Mbit/s, then drops
repeatedly, and finally stabilizes at around 35Mbit/s:

[  3] local 192.168.1.153 port 39623 connected with 192.168.1.2 port 5001=

[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 1.0 sec  3.50 MBytes  29.4 Mbits/sec
[  3]  1.0- 2.0 sec  3.00 MBytes  25.2 Mbits/sec
[  3]  2.0- 3.0 sec  3.12 MBytes  26.2 Mbits/sec
[  3]  3.0- 4.0 sec  1.62 MBytes  13.6 Mbits/sec
[  3]  4.0- 5.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3]  5.0- 6.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3]  6.0- 7.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3]  7.0- 8.0 sec  2.38 MBytes  19.9 Mbits/sec
[  3]  8.0- 9.0 sec  4.00 MBytes  33.6 Mbits/sec
[  3]  9.0-10.0 sec  4.00 MBytes  33.6 Mbits/sec
[  3] 10.0-11.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3] 11.0-12.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3] 12.0-13.0 sec  4.62 MBytes  38.8 Mbits/sec
[  3] 13.0-14.0 sec  4.50 MBytes  37.7 Mbits/sec
[  3] 14.0-15.0 sec  4.50 MBytes  37.7 Mbits/sec
[  3] 15.0-16.0 sec  4.62 MBytes  38.8 Mbits/sec
[  3] 16.0-17.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 17.0-18.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 18.0-19.0 sec  4.00 MBytes  33.6 Mbits/sec
[  3] 19.0-20.0 sec  3.88 MBytes  32.5 Mbits/sec
[  3] 20.0-21.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 21.0-22.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 22.0-23.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3] 23.0-24.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 24.0-25.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 25.0-26.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 26.0-27.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 27.0-28.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 28.0-29.0 sec  4.00 MBytes  33.6 Mbits/sec
[  3] 29.0-30.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 30.0-31.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 31.0-32.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 32.0-33.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 33.0-34.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3] 34.0-35.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 35.0-36.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 36.0-37.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 37.0-38.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 38.0-39.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 39.0-40.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 40.0-41.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 41.0-42.0 sec  4.62 MBytes  38.8 Mbits/sec
[  3] 42.0-43.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3] 43.0-44.0 sec  3.88 MBytes  32.5 Mbits/sec
[  3] 44.0-45.0 sec  3.12 MBytes  26.2 Mbits/sec
[  3] 45.0-46.0 sec  3.12 MBytes  26.2 Mbits/sec
[  3] 46.0-47.0 sec  2.75 MBytes  23.1 Mbits/sec
[  3] 47.0-48.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 48.0-49.0 sec  3.75 MBytes  31.5 Mbits/sec
[  3] 49.0-50.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 50.0-51.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3] 51.0-52.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3] 52.0-53.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 53.0-54.0 sec  4.00 MBytes  33.6 Mbits/sec
[  3] 54.0-55.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 55.0-56.0 sec  4.12 MBytes  34.6 Mbits/sec
[  3] 56.0-57.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 57.0-58.0 sec  4.38 MBytes  36.7 Mbits/sec
[  3] 58.0-59.0 sec  4.25 MBytes  35.7 Mbits/sec
[  3] 59.0-60.0 sec  4.25 MBytes  35.7 Mbits/sec
=2E..

4) W 723V B <-> QCA6174 (TCP):

Connection seems stable at around 14Mbit/s at first, then starts jumping =
between
7 and 14 Mbit/s:

[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 1.0 sec  1.62 MBytes  13.6 Mbits/sec
[  3]  1.0- 2.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3]  2.0- 3.0 sec  1.62 MBytes  13.6 Mbits/sec
[  3]  3.0- 4.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3]  4.0- 5.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3]  5.0- 6.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3]  6.0- 7.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3]  7.0- 8.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3]  8.0- 9.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3]  9.0-10.0 sec  1.62 MBytes  13.6 Mbits/sec
[  3] 10.0-11.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 11.0-12.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 12.0-13.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 13.0-14.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 14.0-15.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 15.0-16.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 16.0-17.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 17.0-18.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 18.0-19.0 sec  1.62 MBytes  13.6 Mbits/sec
[  3] 19.0-20.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 20.0-21.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 21.0-22.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 22.0-23.0 sec  1.62 MBytes  13.6 Mbits/sec
[  3] 23.0-24.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 24.0-25.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 25.0-26.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3] 26.0-27.0 sec  1.38 MBytes  11.5 Mbits/sec
[  3] 27.0-28.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 28.0-29.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 29.0-30.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 30.0-31.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 31.0-32.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 32.0-33.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 33.0-34.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 34.0-35.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 35.0-36.0 sec  1.38 MBytes  11.5 Mbits/sec
[  3] 36.0-37.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 37.0-38.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 38.0-39.0 sec  1.50 MBytes  12.6 Mbits/sec
[  3] 39.0-40.0 sec  1.50 MBytes  12.6 Mbits/sec
[  3] 40.0-41.0 sec  1.50 MBytes  12.6 Mbits/sec
[  3] 41.0-42.0 sec  1.38 MBytes  11.5 Mbits/sec
[  3] 42.0-43.0 sec  1.62 MBytes  13.6 Mbits/sec
[  3] 43.0-44.0 sec  1.38 MBytes  11.5 Mbits/sec
[  3] 44.0-45.0 sec  1.50 MBytes  12.6 Mbits/sec
[  3] 45.0-46.0 sec  1.38 MBytes  11.5 Mbits/sec
[  3] 46.0-47.0 sec  1.38 MBytes  11.5 Mbits/sec
[  3] 47.0-48.0 sec  1.38 MBytes  11.5 Mbits/sec
[  3] 48.0-49.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3] 49.0-50.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 50.0-51.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 51.0-52.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3] 52.0-53.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3] 53.0-54.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 54.0-55.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3] 55.0-56.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3] 56.0-57.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 57.0-58.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 58.0-59.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 59.0-60.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 60.0-61.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 61.0-62.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 62.0-63.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 63.0-64.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 64.0-65.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 65.0-66.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 66.0-67.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 67.0-68.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 68.0-69.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 69.0-70.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 70.0-71.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 71.0-72.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 72.0-73.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 73.0-74.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 74.0-75.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 75.0-76.0 sec  1.88 MBytes  15.7 Mbits/sec
[  3] 76.0-77.0 sec  1.75 MBytes  14.7 Mbits/sec
[  3] 77.0-78.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 78.0-79.0 sec  1.50 MBytes  12.6 Mbits/sec
[  3] 79.0-80.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3] 80.0-81.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 81.0-82.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 82.0-83.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 83.0-84.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 84.0-85.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 85.0-86.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 86.0-87.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 87.0-88.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 88.0-89.0 sec   768 KBytes  6.29 Mbits/sec
[  3] 89.0-90.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 90.0-91.0 sec   896 KBytes  7.34 Mbits/sec
[  3] 91.0-92.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 92.0-93.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 93.0-94.0 sec  1.00 MBytes  8.39 Mbits/sec
[  3] 94.0-95.0 sec  1.25 MBytes  10.5 Mbits/sec
[  3] 95.0-96.0 sec  1.12 MBytes  9.44 Mbits/sec
[  3] 96.0-97.0 sec  1.00 MBytes  8.39 Mbits/sec
=2E..

On 10/27/2015 01:01 PM, Michael Krupp wrote:
> Hello Micha=C5=82,
>=20
> thank you for pointing me to those discussions.
>=20
>=20
> I will repeat my tests using iperf to also cover UDP, and will also try=
 some
> older kernel releases, pre-dating 3.19. Also I'll try another AP as men=
tioned
> earlier.
>=20
>=20
> Michael
>=20
> On 10/27/2015 12:27 PM, Michal Kazior wrote:
>> On 27 October 2015 at 12:22, Michael Krupp <michaelkrupp@gmx.net> wrot=
e:
>>> Hello Micha=C5=82
>>>
>>> yes, I checked the actual performance via netcat, scp and rsync. I'll=
 report
>>> back once I have tested against another AP.
>>
>> TCP performance is known to be tricky/poor in various scenarios. There=

>> were some discussions in the past:
>>
>>  - http://lists.infradead.org/pipermail/ath10k/2015-October/006160.htm=
l
>>  - http://thread.gmane.org/gmane.linux.network/348420
>>
>>
>> Micha=C5=82
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>=20
>=20
>=20
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>=20


--JES7MlGl8hU0PFbg4pNoshX8mt0ub4Jxi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWMoUkAAoJEEI+U8JQBNx3Fk0P/3ERVYCLkAHLpJUArLKVzsI2
ScupdEnR7H2jye5kCYlphQq8mZ8rIC0G4eiugLQFnWOp0X2GpgE53ISGHHYvLRb9
zUrtPc7M5PQ4+5wTw/STE5mackNidNBT3uW8FkZiY5BvQ5x0yxCJZn1nhISHI5uf
w7MhG2smpMKeXcir8AcFKA+bwJ4FVggKWYNW2UxdnnNmseJWjIUMdielqbFNJz61
bOJGe71hI76SQh4HDajtpytPwet5aYIEBcuhHNgZuEQ4f0IWCbdz+1lZ2xoGP71K
D15he10CHyw/o/PXrCdmTPdLzSfovkzPmvv0LQAbYNGPQ3w2RWIs/9jgV8/P9Jg4
yNQ3qD/d9TK57j8KVa1NFa3XCkzbfEY3WJMFfVqkEPutkcbm7e0s49zNlxCLPqTR
PFCnscSD7wBbltUE0jkIHfjnFJJZZXqle/eVlltOq05k7KgS2DYvDQEZ1Old4KSE
SM30gGNVJlB/LVKNbmiVrKMJcxFwhh/BQ+tRkM19Ed4Gk8chS40RwK4+K/Sc1rLX
6n2TLeK1926RCz2xec356CKHfquATnsxJ464hOR+OBCIWz1LijIHVW9Ma30zoGSd
MTMum4uZF3URnW7/d0tQj9ulp5WWcPSWybNxvSY78VUpy4U+m5M+sXAPgXAZlLdg
kaPbzCJYKQXdqGhfM6IV
=d4d9
-----END PGP SIGNATURE-----

--JES7MlGl8hU0PFbg4pNoshX8mt0ub4Jxi--


--===============2770955616730572428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2770955616730572428==--
