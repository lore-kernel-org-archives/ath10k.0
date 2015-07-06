Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCDtl-0007OY-SJ
 for ath10k@lists.infradead.org; Mon, 06 Jul 2015 21:25:58 +0000
Received: by igcqs7 with SMTP id qs7so19546954igc.0
 for <ath10k@lists.infradead.org>; Mon, 06 Jul 2015 14:25:36 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 6 Jul 2015 14:25:36 -0700
Message-ID: <CAN+ZWYEK5TpXVsQom5RBxZ1=XCGn9Cq47w1rQdonWNx-ec88vA@mail.gmail.com>
Subject: Re: attempting mesh on ath10k
From: Freddy Lee <flee@cococorp.com>
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
To: me@bobcopeland.com
Cc: ath10k@lists.infradead.org

Hi Bob,

I applied the mesh fix to OpenWRT (r45590 and r62020). It works great
(thanks, Bob!), but with a potentially unforeseen consequence: When an
Archer C7 with these changes is configured to be a 5GHz AP, clients
are unable to connect normally. Experiments show that the client is
registered as a station, but pings don't complete (in many cases, not
even DHCP completes). Tested clients include one commercial phone
(Samsung Galaxy S5 running Lollipop) and another Archer C7.

Without these changes, these same clients can connect to the AP all day long.

Below are sections of verbose output of an access point test script
both without and with the mesh fix.
======= Without ath10k mesh fix =======
+ iw dev wlan0 station dump
Station 30:b5:c2:b2:69:14 (on wlan0)
        inactive time:  1390 ms
        rx bytes:       1106
        rx packets:     3
        tx bytes:       1168
        tx packets:     4
        tx retries:     0
        tx failed:      0
        signal:         -31 dBm
        signal avg:     -32 dBm
        tx bitrate:     6.0 MBit/s
        rx bitrate:     156.0 MBit/s VHT-MCS 5 VHT-NSS 3
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
+ cat /tmp/dhcp.leases
+ dhcp_lease=1434658717 30:b5:c2:b2:69:14 192.168.1.104 * *
+ cut -d  -f 3
+ echo 1434658717 30:b5:c2:b2:69:14 192.168.1.104 bcopeland_test.sh
bcopeland_test.sh
+ ip=192.168.1.104
+ echo Client IP = 192.168.1.104
Client IP = 192.168.1.104
+ ping -c 10 192.168.1.104
PING 192.168.1.104 (192.168.1.104) 56(84) bytes of data.
64 bytes from 192.168.1.104: icmp_req=1 ttl=64 time=1.50 ms
64 bytes from 192.168.1.104: icmp_req=2 ttl=64 time=0.673 ms
64 bytes from 192.168.1.104: icmp_req=3 ttl=64 time=0.888 ms
64 bytes from 192.168.1.104: icmp_req=4 ttl=64 time=0.694 ms
64 bytes from 192.168.1.104: icmp_req=5 ttl=64 time=0.662 ms
64 bytes from 192.168.1.104: icmp_req=6 ttl=64 time=0.670 ms
64 bytes from 192.168.1.104: icmp_req=7 ttl=64 time=0.664 ms
64 bytes from 192.168.1.104: icmp_req=8 ttl=64 time=0.759 ms
64 bytes from 192.168.1.104: icmp_req=9 ttl=64 time=1.29 ms
64 bytes from 192.168.1.104: icmp_req=10 ttl=64 time=0.665 ms

--- 192.168.1.104 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9003ms
rtt min/avg/max/mdev = 0.662/0.847/1.508/0.290 ms

======= With ath10k mesh fix =======
+ iw dev wlan0 station dump
Station 30:b5:c2:b2:69:14 (on wlan0)
        inactive time:  2560 ms
        rx bytes:       382
        rx packets:     1
        tx bytes:       444
        tx packets:     2
        tx retries:     0
        tx failed:      0
        signal:         -29 dBm
        signal avg:     -33 dBm
        tx bitrate:     6.0 MBit/s
        rx bitrate:     156.0 MBit/s VHT-MCS 5 VHT-NSS 3
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
+ cat /tmp/dhcp.leases
+ dhcp_lease=
+ cut -d  -f 3
+ echo
+ ip=
+ echo Client IP =
Client IP =
+ ping -c 10
Usage: ping [-LRUbdfnqrvVaAD] [-c count] [-i interval] [-w deadline]
            [-p pattern] [-s packetsize] [-t ttl] [-I interface]
            [-M pmtudisc-hint] [-m mark] [-S sndbuf]
            [-T tstamp-options] [-Q tos] [hop1 ...] destination

Does this work on your end? If not, is there a patch that will fix it?
Please advise.

Thanks in advance,

Freddy Lee

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
