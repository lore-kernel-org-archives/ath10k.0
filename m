Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aigPt-0001xR-Ee
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 10:53:34 +0000
Received: from xue.liu@dks-koeln.de ([87.79.65.72]) by
 mrelayeu.kundenserver.de (mreue002) with ESMTPSA (Nemesis) id
 0MFDEx-1aXMoW2Gvz-00GGte for <ath10k@lists.infradead.org>; Wed, 23 Mar 2016
 11:53:11 +0100
From: Xue Liu <xue.liu@dks-koeln.de>
Subject: UDP throughput problems with WDS and ath10k
Message-ID: <56F27596.3080506@dks-koeln.de>
Date: Wed, 23 Mar 2016 11:53:10 +0100
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello everyone,

Now I am doing point to point  throughput test using  and ath10k. The 
hardwares are clearfog A1 board with armada 388 and WLE900VX (QCA9880). 
The OpenWRT trunk is running on it.

At first I did UDP throughput test ( WDS AP <---> WDS Client ) with 
iperf3 server on the WDS AP. The throughput is approx 630 Mbps.  But if 
the server sends the data, the throughput will rise to 700 Mbps.  I did 
the bidirectional test for many times. The UDP data transferring from AP 
side always has 70 - 80 Mbps more throughput.

In the same situation, I did UDP throughput test between PC and WDS AP ( 
PC <---->WDS Client <----> WDS AP ) . The PC is connected with the WDS 
client via GbE port.  I have found a more interesting result. The data 
throughput is about 678 Mbps when the data is transmitted from AP to PC. 
There is almost no performance loss. But the throughput is only about 
425 Mpbs from PC to AP.

Can anyone give me some advises or some info about the reason and how to 
improve the transmitting performance from PC to AP side. Thank you.

Regards,

Xue Liu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
