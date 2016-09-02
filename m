Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfvkU-0001M1-Re
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 21:11:52 +0000
Received: by mail-qk0-x231.google.com with SMTP id z190so133540415qkc.0
 for <ath10k@lists.infradead.org>; Fri, 02 Sep 2016 14:11:22 -0700 (PDT)
MIME-Version: 1.0
From: Alexis Green <agreen@cococorp.com>
Date: Fri, 2 Sep 2016 14:11:21 -0700
Message-ID: <CAAnMG+NUtOyxrzyXc4TyzPR8nuz2RcG80+GBwEZdfBFDknL2eQ@mail.gmail.com>
Subject: Throughput weirdness on 9984
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello,

As I was working with ath10k drivers, I have discovered that only CT
firmware/driver combination is able to report tx_info to mac80211
layer. I've built latest LEDE image for my hardware (Netgear Nighthawk
X4S R7800) with both ath10k-ct driver from Ben and CT firmware. This
combination of software provides the data I need, however, the
throughput is severely limited :/

All tests are performed between two of these devices in mesh mode with
no encryption. Here are some of the iperf results:

NODE 1 (QCA) ----- NODE 2 (CT)
Iperf server on NODE 2
Connecting to host 192.168.1.2, port 5201
[  4] local 192.168.1.1 port 41058 connected to 192.168.1.2 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  5.97 MBytes  50.0 Mbits/sec    0    242 KBytes
[  4]   1.00-2.00   sec  6.75 MBytes  56.6 Mbits/sec    0    454 KBytes
[  4]   2.00-3.00   sec  7.03 MBytes  58.9 Mbits/sec    0    734 KBytes
[  4]   3.00-4.00   sec  6.60 MBytes  55.4 Mbits/sec    0    973 KBytes
[  4]   4.00-5.00   sec  6.83 MBytes  57.3 Mbits/sec    0   1.13 MBytes
[  4]   5.00-6.00   sec  6.36 MBytes  53.3 Mbits/sec    0   1.39 MBytes
[  4]   6.00-7.00   sec  6.73 MBytes  56.6 Mbits/sec    0   1.65 MBytes
[  4]   7.00-8.00   sec  6.54 MBytes  54.9 Mbits/sec    0   1.76 MBytes
[  4]   8.00-9.00   sec  6.50 MBytes  54.4 Mbits/sec    0   1.76 MBytes
[  4]   9.00-10.00  sec  6.74 MBytes  56.5 Mbits/sec    0   1.76 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  66.0 MBytes  55.4 Mbits/sec    0             sender
[  4]   0.00-10.00  sec  65.3 MBytes  54.8 Mbits/sec                  receiver

----------------------------------------------------------------------------
NODE 1 (QCA) ----- NODE 2 (QCA)
Iperf server on NODE 2
Connecting to host 192.168.1.2, port 5201
[  4] local 192.168.1.1 port 58770 connected to 192.168.1.2 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  22.9 MBytes   191 Mbits/sec    0    157 KBytes
[  4]   1.00-2.02   sec  26.3 MBytes   217 Mbits/sec    0    296 KBytes
[  4]   2.02-3.05   sec  30.7 MBytes   251 Mbits/sec    0    622 KBytes
[  4]   3.05-4.02   sec  30.0 MBytes   260 Mbits/sec    0    930 KBytes
[  4]   4.02-5.02   sec  33.9 MBytes   283 Mbits/sec    0    930 KBytes
[  4]   5.02-6.04   sec  32.5 MBytes   269 Mbits/sec    0   1.00 MBytes
[  4]   6.04-7.02   sec  36.2 MBytes   310 Mbits/sec    0   1.11 MBytes
[  4]   7.02-8.06   sec  38.6 MBytes   312 Mbits/sec    0   1.28 MBytes
[  4]   8.06-9.01   sec  34.9 MBytes   307 Mbits/sec    0   1.42 MBytes
[  4]   9.01-10.04  sec  37.3 MBytes   304 Mbits/sec    0   1.49 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.04  sec   323 MBytes   270 Mbits/sec    0             sender
[  4]   0.00-10.04  sec   322 MBytes   269 Mbits/sec                  receiver

-----------------------------------------------------------------------------
NODE 1 (CT) ----- NODE 2 (QCA)
Iperf server on NODE 2
Connecting to host 192.168.1.2, port 5201
[  4] local 192.168.1.1 port 36820 connected to 192.168.1.2 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  2.09 MBytes  17.5 Mbits/sec    0   22.6 KBytes
[  4]   1.00-2.00   sec  1.16 MBytes  9.71 Mbits/sec    0   22.6 KBytes
[  4]   2.00-3.00   sec  1.12 MBytes  9.43 Mbits/sec    0   22.6 KBytes
[  4]   3.00-4.00   sec  1.13 MBytes  9.45 Mbits/sec    0   22.6 KBytes
[  4]   4.00-5.00   sec  1.12 MBytes  9.38 Mbits/sec    0   22.6 KBytes
[  4]   5.00-6.00   sec  1.12 MBytes  9.36 Mbits/sec    0   22.6 KBytes
[  4]   6.00-7.00   sec  1.16 MBytes  9.73 Mbits/sec    0   22.6 KBytes
[  4]   7.00-8.00   sec  1.16 MBytes  9.71 Mbits/sec    0   22.6 KBytes
[  4]   8.00-9.00   sec  1.13 MBytes  9.48 Mbits/sec    0   22.6 KBytes
[  4]   9.00-10.00  sec  1.12 MBytes  9.41 Mbits/sec    0   22.6 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  12.3 MBytes  10.3 Mbits/sec    0             sender
[  4]   0.00-10.00  sec  12.3 MBytes  10.3 Mbits/sec                  receiver

-----------------------------------------------------------------------------
NODE 1 (CT) ----- NODE 2 (CT)
Iperf server on NODE 2
*Unable to establish peering until I add monitor mode devices on both sides.*
Connecting to host 192.168.1.2, port 5201
[  4] local 192.168.1.1 port 41328 connected to 192.168.1.2 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  1.51 MBytes  12.7 Mbits/sec    0   31.1 KBytes
[  4]   1.00-2.00   sec  1.47 MBytes  12.4 Mbits/sec    0   31.1 KBytes
[  4]   2.00-3.00   sec  1.46 MBytes  12.2 Mbits/sec    0   31.1 KBytes
[  4]   3.00-4.00   sec  1.49 MBytes  12.5 Mbits/sec    0   31.1 KBytes
[  4]   4.00-5.00   sec  1.55 MBytes  13.0 Mbits/sec    0   31.1 KBytes
[  4]   5.00-6.00   sec  1.49 MBytes  12.5 Mbits/sec    0   31.1 KBytes
[  4]   6.00-7.00   sec  1.59 MBytes  13.3 Mbits/sec    0   31.1 KBytes
[  4]   7.00-8.00   sec  1.36 MBytes  11.4 Mbits/sec    0   31.1 KBytes
[  4]   8.00-9.00   sec  1.77 MBytes  14.9 Mbits/sec    0   48.1 KBytes
[  4]   9.00-10.00  sec  2.92 MBytes  24.5 Mbits/sec    0   48.1 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  16.6 MBytes  13.9 Mbits/sec    0             sender
[  4]   0.00-10.00  sec  16.5 MBytes  13.9 Mbits/sec                  receiver

Another strange thing I noticed was inability to mesh two devices
running CT firmware until I created monitor mode devices - this leads
me to believe that there's some kind of filtering bug.

I've tried several different CT firmware versions -
http://www.candelatech.com/downloads/ath10k-9984-10-4/ath10k-fw-beta/firmware-5-ct-full-community.bin
http://www.candelatech.com/downloads/ath10k-9984-10-4/firmware-5-ct-full-community-7.bin-lede.001
http://www.candelatech.com/downloads/ath10k-9984-10-4/firmware-5-ct-full-community-7.bin-lede.004
 - all of them behave in similar ways.

P.S. Both devices are running in VHT80 mode on channel 36 and
generally report very good connection (-30dBm-ish).

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
