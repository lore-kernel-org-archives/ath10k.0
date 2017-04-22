Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1nPU-0005xH-3J
 for ath10k@lists.infradead.org; Sat, 22 Apr 2017 05:16:41 +0000
Received: by mail-vk0-x244.google.com with SMTP id q78so2738988vke.3
 for <ath10k@lists.infradead.org>; Fri, 21 Apr 2017 22:16:19 -0700 (PDT)
From: Xuebing Wang <xbing6@gmail.com>
Subject: [ath10k] [batman-adv] Robustness of batman-adv or IBSS/802.11s on
 ath9k (AR9331 chip)
Message-ID: <52905ff0-487f-f50f-797a-6f6f1740d1d4@gmail.com>
Date: Sat, 22 Apr 2017 13:16:11 +0800
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: b.a.t.m.a.n@lists.open-mesh.org, openwrt-devel@lists.openwrt.org, Sven Eckelmann <sven@narfation.org>, Simon Wunderlich <sw@simonwunderlich.de>

Hi ath10k community,

Does anyone use ath9k driver + 802.11s (or IBSS/adhoc) on commercial 
products?

Our setup is AR9331 + ath9k driver + OpenWRT 15.05 + batman-adv 2016.1 
(PKG_RELEASE:=3)

We are very serious about robustness of running batman-adv on AR9331, 
because we have 20+ commercial sites running, each site is with about 20 
nodes.
- batman-adv + ar9331 work almost (well almost) perfectly.
- Sometimes, one node drops off the mesh, occurrence rate is very low.
- For one time, when Node drops off the mesh, "rmmod ath9k" then 
"modprobe ath9k" can get both batman-adv (and ibss/adhoc on top of 
ath9k) recover. This seemingly points to that the issue is with ath9k 
driver (ibss/adhoc mode).

As this email is mainly addressed to ath10k community (rather than 
batman-adv or openwrt), does anyone commercially use 802.11s (or 
ibss/adhoc)+ ath9k/ath10k? Does 802.11s (or ibss/adhoc) + ath9k/ath10k 
work perfectly?

Thanks.
Xuebing Wang


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
