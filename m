Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ai0QR-0004Ho-9i
 for ath10k@lists.infradead.org; Mon, 21 Mar 2016 14:03:20 +0000
Received: from xue.liu@dks-koeln.de ([87.79.65.72]) by
 mrelayeu.kundenserver.de (mreue102) with ESMTPSA (Nemesis) id
 0MIe7s-1afnUv0jou-002CoZ for <ath10k@lists.infradead.org>; Mon, 21 Mar 2016
 15:02:57 +0100
From: Xue Liu <xue.liu@dks-koeln.de>
Subject: throughout loss using WDS and UDP
Message-ID: <56EFFF10.6010507@dks-koeln.de>
Date: Mon, 21 Mar 2016 15:02:56 +0100
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

Now I am doing point to point throughput using  and ath10k. The 
hardwares are clearfog A1 board with armada 388 and WLE900VX (QCA9880). 
The OpenWRT trunk is running on it.

At first I did UDP throughput test ( WDS AP <---> WDS Client ) with 
iperf3. In the same situation, I did UDP throughput test from PC to WDS 
AP ( PC <---->WDS Client <----> WDS AP ) . I found the performance has 
about 150Mbps loss.

I would like to know that what is the reason ? Can anyone give me some 
hints and some suggestions about how to reduce the performance loss. 
Thank you.

Regards,

Xue Liu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
