Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbjZN-0006M8-8C
 for ath10k@lists.infradead.org; Thu, 31 Oct 2013 04:09:18 +0000
Received: from [50.54.140.2] (50-54-140-2.evrt.wa.frontiernet.net
 [50.54.140.2]) (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id r9V48tK9018358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 30 Oct 2013 21:08:55 -0700
Message-ID: <5271D7D6.7000702@candelatech.com>
Date: Wed, 30 Oct 2013 21:08:54 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Hard lockup on module reload.
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

I think this might be a known problem, but just in case it
helps, here are the last logs I see before the system is
locked hard (ie, even sysrq over serial terminal does nothing)

This is with today's 'ath' tree, including the RFT patches posted
by Michal.

cfg80211: Regulatory domain changed to country: US
cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2700 mBm)
cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 1700 mBm)
cfg80211:   (5250000 KHz - 5330000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5490000 KHz - 5600000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5650000 KHz - 5710000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 3000 mBm)
cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 4000 mBm)
ieee80211 phy3: Atheros AR9300 Rev:3 mem=0xffffc90017cc0000, irq=18
ieee80211 phy4: Atheros AR9300 Rev:3 mem=0xffffc90017d40000, irq=19
ath10k_pci 0000:05:00.0: BAR 0: assigned [mem 0xf4400000-0xf45fffff 64bit]


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
