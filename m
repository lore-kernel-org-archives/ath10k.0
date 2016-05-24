Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b50AZ-0005yH-OG
 for ath10k@lists.infradead.org; Tue, 24 May 2016 00:26:00 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 24E9A40A339
 for <ath10k@lists.infradead.org>; Mon, 23 May 2016 17:19:29 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Memory leak under certain loads.
Message-ID: <57439E10.4040106@candelatech.com>
Date: Mon, 23 May 2016 17:19:28 -0700
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
To: ath10k <ath10k@lists.infradead.org>

I spent the day looking for memory leaks, and made little progress.

I'm posting this in case someone has a suggestion.

Kernel is 4.4.10+, lots of local patches, and probably ath10k driver is close to
4.4.6 code (it has wave-2 10.4.3 firmware support, for instance).

I modified mac80211 to limit the backlog queue in the method below, so it should
not be this.

static bool ieee80211_tx_frags(struct ieee80211_local *local,
			       struct ieee80211_vif *vif,
			       struct ieee80211_sta *sta,
			       struct sk_buff_head *skbs,
			       bool txpending)

and, fixed pktgen to not crash on skb overrun when used on wlanX


ath10k Firmware is CT firmware.


I start pktgen trying to send 100kpps from station device to another AP
device.

ath9k:  No problems
ath10k-wave1:  Appears to be fairly fast memory leak.  Memory is not reclaimed when
     pktgen is stopped.
ath10k-wave2:  Consumes lots of memory (4G and rising after 20-30 seconds), but at least most comes
     back when pktgen is stopped.  This very much looks like there are lots of pkts buffered somewhere.

In all cases, if I use 'kmemleak', system runs a lot slower (tries to send around 35kpps instead of 99kpps),
and I detect no excessive memory usage as seen with 'top', nor does kmemleak find anything that looks related
to this.

Perhaps related, an OpenWRT variant reports OOM bugs with ath10k wave-1 systems too,
but seems their instability is on the order of 1-2 days between crashes.  They suspect
this came down with a recent backport, but I did not dig into exactly what they have.


https://github.com/freifunk-gluon/gluon/issues/690

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
