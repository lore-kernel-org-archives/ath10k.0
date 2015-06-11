Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x243.google.com ([2a00:1450:400c:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3ALt-0008Bm-Kk
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 21:49:34 +0000
Received: by wivr20 with SMTP id r20so7531512wiv.3
 for <ath10k@lists.infradead.org>; Thu, 11 Jun 2015 14:49:11 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 11 Jun 2015 14:49:11 -0700
Message-ID: <CAH3pVZP4KNrRSUqfLk1dEOGVTBZK27VOWMVBfL1+49ygC8oOTQ@mail.gmail.com>
Subject: ath10k fw_stats rx_frame/rx_clear counters
From: Sergey Naumov <sknaumov@gmail.com>
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

Hi all.

I'm using barrier breaker OpenWRT on TP-link Archer C7 v2.0 router and
looking at /sys/kernel/debug/ieee80211/phy0/ath10k/fw_stats content.
As far as I understand "RX frame" accounts just rx of our and all the
other APs on the same channel, while "RX clear" also accounts tx of
our AP and non-wifi interference.
At least it is true for ath9k with 2.4GHz chip on the same router,
where "channel busy time" from survey report is always greater than
"channel receive time".

But for ath10k I see that with absense of the traffic to/from our AP,
"RX frame" register value is always increased a little bit more than a
value of "RX clear" register, and it is strange.

Do you know what could be a reason?

P.S. I tried new Chaos Calmer RC1 OpenWRT release with updated ath10k
driver and binary firmware and there these low-level stats are
unavaiable (file /sys/kernel/debug/ieee80211/phy0/ath10k/fw_stats
exists but read returns error).

Thanks in advance,
Sergey.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
