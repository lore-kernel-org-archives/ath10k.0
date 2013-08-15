Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9pqs-0006KN-GC
 for ath10k@lists.infradead.org; Thu, 15 Aug 2013 05:12:03 +0000
Received: by mail-pa0-f52.google.com with SMTP id kq13so405767pab.11
 for <ath10k@lists.infradead.org>; Wed, 14 Aug 2013 22:11:40 -0700 (PDT)
Received: from RYANEL-LT ([203.18.50.4])
 by mx.google.com with ESMTPSA id 7sm57539739paf.22.2013.08.14.22.11.37
 for <ath10k@lists.infradead.org>
 (version=TLSv1 cipher=RC4-SHA bits=128/128);
 Wed, 14 Aug 2013 22:11:39 -0700 (PDT)
Date: Thu, 15 Aug 2013 13:11:16 +0800
From: "Ryane Luo" <luoqiwen1984@gmail.com>
Subject: Did ath9k/ath10k support AR9388?
Mime-Version: 1.0
Message-ID: <2013081513111459004272@gmail.com>
Reply-To: luoqiwen1984 <luoqiwen1984@gmail.com>
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
To: ath10k <ath10k@lists.infradead.org>

Dear, all.

I got an Apple original WIFI module which chip is AR9388.
Plug it to my latop, it doesn't recognize by Ubuntu 12.04 .

And try to plug it to my router(base on Linux--DD-WRT ). ath9k doesn't work for it.

Module works fine on Win7 PC, so HW is ok.

AR9388 module is cheap and with 450M performance, very familar at AR9380.

Anyone know howto support it by ath9k and ath10k ?

Try lspci at the router, got this:
#lspci
00:00.0 Class 0200:168c:abcd
When manual add Device Id to the src code, it failure again.

Here is the boot log:
[ 12.626252] cfg80211: Calling CRDA to update world regulatory domain 
[ 12.632616] cfg80211: World regulatory domain updated:
[ 12.637747] cfg80211: (start_freq - end_freq @ bandwidth),(max_antenna_gain, max_eirp)
[ 12.645875] cfg80211: (2402000 KHz - 2472000 KHz @ 40000 KHz), (300mBi, 2000 mBm)
[ 12.653564] cfg80211: (2457000 KHz - 2482000 KHz @ 20000 KHz), (300mBi, 2000 mBm)
[ 12.661258] cfg80211: (2474000 KHz - 2494000 KHz @ 20000 KHz), (300mBi, 2000 mBm)
[ 12.668952] cfg80211: (5170000 KHz - 5250000 KHz @ 40000 KHz), (300mBi, 2000 mBm)
[ 12.676646] cfg80211: (5735000 KHz - 5835000 KHz @ 40000 KHz), (300mBi, 2000 mBm)
[ 12.953229] ath: phy0: Couldn't reset chip
[ 12.957311] ath: phy0: Unable to initialize hardware; initialization status: -5
[ 12.964574] ath9k 0000:00:00.0: Failed to initialize device
[ 12.970146] ath9k: probe of 0000:00:00.0 failed with error -5
[ 12.981140] ath: phy1: Unable to initialize hardware; initialization status: -5
[ 12.988414] ath9k 0000:01:00.0: Failed to initialize device
[ 12.993971] ath9k: probe of 0000:01:00.0 failed with error -5
[ 13.036432] Error: Driver 'gpio-keys-polled' is already registered, aborting...
[ 13.086955] NET: Registered protocol family 24
[ 14.843825] Port 0: Link-down
[ 14.849334] eth0: link up
[ 14.851937] Port 1: Link-up, Full-duplex, Speed-100Mbps.
[ 14.859691] Port 2: Link-down
[ 14.864999] Port 3: Link-down
[ 14.870559] pool #1: pkt_size=1536, buf_size=1632 - 2048 of 2048 buffers added
[ 14.879821] eth0: started (on switch)
[ 15.010912] device eth0 entered promiscuous mode
[ 15.024688] br-lan: port 1(eth0) entering forwarding state
[ 15.030148] br-lan: port 1(eth0) entering forwarding state
[ 15.047146] eth1: link up
[ 15.049757] Port 4: Link-up, Full-duplex, Speed-100Mbps.
[ 15.056644] eth1: started (on switch)
[ 15.834567] ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[ 17.024320] br-lan: port 1(eth0) entering forwarding state

Here is the ebay link.
http://www.ebay.com/itm/Apple-Original-NEW-AirPort-MINI-PCI-E-Card-AR9388-WIFI-iMac-450Mbps-AR5BXB112-/330778442954

-----------------------
Ryane Luo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
