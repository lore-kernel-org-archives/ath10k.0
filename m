Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.mediaspot.net ([185.37.180.5])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze7FU-0006g6-IF
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 19:59:41 +0000
Received: from localhost ([127.0.0.1])
 by mail.mediaspot.net (Kerio Connect 8.4.1)
 (using TLSv1 with cipher AES256-SHA (256 bits))
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 21:59:18 +0200
From: Alessandro Bolletta <alessandro@mediaspot.net>
Subject: Link can't get estabilished over RB911AC boards
Date: Mon, 21 Sep 2015 19:57:11 +0000
Message-ID: <F52F175DFC537F48A43937B50B44BCA2820826A4@EXCHANGE.mediaspot.local>
Content-Language: it-IT
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

I have two Mikrotik RB911AC boards (radio based on QCA9882) in which I injected OpenWRT 15.05 and ath10k. 

I managed to get them connected in AP/STA configuration in a very short (2 meters) distance, but when I try to connect them on 5 kilometers, even if I set the distance parameter on OpenWRT's UCI config files properly, it tries to connect but after 3 retries, it declares unauthenticated.

No problem with the same firmware on ath9k, for example.
Signal is stable at -62 dbm, I also tried to change channels and push tx power, but nothing helped to do the trick.
Also tried with every firmware combination (10.2.4, CT firmware, 999.999.0.636, 10.1.467.2-1), without success.

Is there anybody who can tell me why? Could it be due to the kernel version (i'm running on 3.18.21)?

Thanks in advance,

--
Alessandro Bolletta
Mediaspot Srl




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
