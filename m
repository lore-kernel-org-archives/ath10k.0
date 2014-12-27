Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y4xIg-00055Y-2m
 for ath10k@lists.infradead.org; Sat, 27 Dec 2014 19:45:22 +0000
Received: by mail-lb0-f172.google.com with SMTP id z12so1691531lbi.3
 for <ath10k@lists.infradead.org>; Sat, 27 Dec 2014 11:44:59 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 27 Dec 2014 21:44:58 +0200
Message-ID: <CABhs+6kTguLdmgrqQ7UUYwQyM=0iTwWU0Msxg1+_tLNhd0dFRA@mail.gmail.com>
Subject: TX statistics
From: Ilias Syrigos <ilias013@gmail.com>
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

I am trying to calculate the PDR (Packet Delivery Ratio) statistic
while operating with ac wifi cards supported by ath10k driver, but
without success.

With ath9k driver I was able to calculate PDR through mac80211 debugFS
stats and specifically through tx_packets counter and tx_retry_count.

However, with ath10k, firmware doesn't seem to update retry counter
and I couldn't get relevant statistics through fw_stats.

Can you suggest any other way to get tx attempts and retries in ath10k?

Thank you in advance,
Ilias

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
