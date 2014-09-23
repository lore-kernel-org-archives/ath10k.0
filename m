Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWDqq-00044p-2t
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 00:21:04 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id DCBA440A0D9
 for <ath10k@lists.infradead.org>; Mon, 22 Sep 2014 17:20:42 -0700 (PDT)
Message-ID: <5420BCDA.5010701@candelatech.com>
Date: Mon, 22 Sep 2014 17:20:42 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Rate ctrl problem with 2x2 station.
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

While testing the previously posted patches that fix up the
transmit rate for 3x3 NICs configured for 2x2 chainmask, I
noticed that an ath10k configured as 3x3 AP will use only
1x1 rates when transmitting to a 2x2 station.

From debugging so far, it appears the root cause is that
the method ath10k_peer_assoc_h_ht in mac.c is passed an
sta with rx_nss set to 3, when in fact the station *should*
be showing up as 2x2.

Possibly station system is still messed up some how...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
