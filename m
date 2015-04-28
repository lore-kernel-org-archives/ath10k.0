Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn4aj-0005Jd-Gw
 for ath10k@lists.infradead.org; Tue, 28 Apr 2015 12:26:22 +0000
Received: by igbpi8 with SMTP id pi8so87253401igb.0
 for <ath10k@lists.infradead.org>; Tue, 28 Apr 2015 05:25:59 -0700 (PDT)
Date: Tue, 28 Apr 2015 08:25:55 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150428122554.GA4527@localhost>
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
 <553AEFFA.6010709@candelatech.com>
 <20150426141552.GA25938@localhost>
 <20150427130016.GA28926@localhost>
 <CA+BoTQmrboeJOw0J67PWkbjteh38xrWntivvBKSWY1MBQ=B6Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQmrboeJOw0J67PWkbjteh38xrWntivvBKSWY1MBQ=B6Dg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Apr 28, 2015 at 07:47:40AM +0200, Michal Kazior wrote:
> > Perhaps there is a BSSID filter enabled or something like that (in mesh
> > there's no BSSID, just individual addresses on group addressed frames).
> 
> In that case try creating a monitor interface and bring it up. This
> should prompt ath10k to create monitor vdev and subsequently disable
> most Rx filters in firmware.

Indeed, that did the trick, thanks!  So mesh is functional now with raw mode
patch and a few hacks:

root@archer:~# iw dev
phy#0
        Interface mon0
                ifindex 8
                wdev 0x2
                addr e8:de:27:d6:9c:d0
                type monitor
        Interface wlan0
                ifindex 4
                wdev 0x1
                addr e8:de:27:d6:9c:d0
                type mesh point
                channel 149 (5745 MHz), width: 20 MHz (no HT), center1: 5745 MHz

root@archer:~# ping 10.10.10.13
PING 10.10.10.13 (10.10.10.13): 56 data bytes
64 bytes from 10.10.10.13: seq=0 ttl=64 time=10.031 ms
64 bytes from 10.10.10.13: seq=1 ttl=64 time=1.074 ms
64 bytes from 10.10.10.13: seq=2 ttl=64 time=1.074 ms
64 bytes from 10.10.10.13: seq=3 ttl=64 time=1.082 ms
64 bytes from 10.10.10.13: seq=4 ttl=64 time=1.032 ms
64 bytes from 10.10.10.13: seq=5 ttl=64 time=2.905 ms
64 bytes from 10.10.10.13: seq=6 ttl=64 time=1.093 ms
64 bytes from 10.10.10.13: seq=7 ttl=64 time=1.205 ms
64 bytes from 10.10.10.13: seq=8 ttl=64 time=1.057 ms
64 bytes from 10.10.10.13: seq=9 ttl=64 time=1.039 ms
64 bytes from 10.10.10.13: seq=10 ttl=64 time=1.107 ms
64 bytes from 10.10.10.13: seq=11 ttl=64 time=1.040 ms
^C
--- 10.10.10.13 ping statistics ---
12 packets transmitted, 12 packets received, 0% packet loss
round-trip min/avg/max = 1.032/1.978/10.031 ms

root@archer:~# iw dev wlan0 mpath dump
DEST ADDR         NEXT HOP          IFACE       SN      METRIC  QLEN
EXPTIME         DTIM    DRET    FLAGS
00:03:7f:10:4e:2d 00:03:7f:10:4e:2d wlan0       2427    1366    0
0       100     0       0x4

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
