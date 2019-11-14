Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVNxn-00080w-6N
 for ath10k@lists.infradead.org; Thu, 14 Nov 2019 22:51:44 +0000
Received: by mail-ot1-x333.google.com with SMTP id m15so6385241otq.7
 for <ath10k@lists.infradead.org>; Thu, 14 Nov 2019 14:51:42 -0800 (PST)
MIME-Version: 1.0
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Thu, 14 Nov 2019 23:51:41 +0100
Message-ID: <CAKR_QVLaRKOc0OapvhppCZzYYO+w8h8t+B1amiWGGEiH6FmnjQ@mail.gmail.com>
Subject: [BUG] ath10k: CPU scaling related performance issue
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>

network topology:
80211g uplink - 30Mbps is brought into litebeam-5AC that is running AP
(WDS) mode on 5GHz radio. client device is a laptop (dualcore 2.4GHz)
running QCA9880 card on ubuntu 10.04 with kernel 4.9.

description:
booting ubuntu defaults to performance governor (personal
modification), opening speedtest.net upon boot and measuring
throughput gets me about 25Mbps download speed.
setting lowest CPU scaling freq of both cores (600MHz) and repeating
the speedtest gets about 29-30Mbps in download. i have verified these
speed differences while downloading several iso files.

confirmation:
identical results have been observed on a live booted ubuntu 19.10
identical results have been observed on ubuntu 10.04, but using
ethernet connection from archer c7 that was connected in client mode
to litebeam5

ruled out so far:
-using regular AP-STA instead of APWDS-STAWDS interfaces does not change a thing
-switching to Ben's CT driver and firmware had no impact, the bug is
present with it too
-using different card QCA9862/QCA9880 behavior is the same

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
