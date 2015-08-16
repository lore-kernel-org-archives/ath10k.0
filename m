Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZQzy5-00088X-EN
 for ath10k@lists.infradead.org; Sun, 16 Aug 2015 15:35:29 +0000
Received: by igfj19 with SMTP id j19so41539032igf.0
 for <ath10k@lists.infradead.org>; Sun, 16 Aug 2015 08:34:23 -0700 (PDT)
Received: from hash ([2001:470:1d:6db:230:48ff:fe9d:9c89])
 by smtp.gmail.com with ESMTPSA id vk8sm8230850igb.4.2015.08.16.08.26.19
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Aug 2015 08:26:19 -0700 (PDT)
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH 0/3] ath10k mesh support
Date: Sun, 16 Aug 2015 11:25:54 -0400
Message-Id: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Bob Copeland <me@bobcopeland.com>

Hi,

This patchset implements mesh support for ath10k.  In the end there aren't
too many changes required now that raw mode is upstream.

When the module is loaded with (newly implemented) modparam rawmode=1, it
will enable operating an open mesh STA via something like the following:

    if=wlan0
    meship=10.10.1.10
    ip link set $if down
    ip addr flush $if
    iw dev $if set type mp
    ip link set $if up
    ip addr add $meship/24 dev $if
    iw dev $if set freq 5745 80 5775
    iw dev $if mesh join mesh-vht

Prerequisites:

* latest mac80211-next is needed to ensure that a valid AID is supplied with
stations, without which firmware will crash.

* another mac80211 patch is needed to enable VHT mesh; I'll be sending this
separately to linux-wireless, but you can find it here:

http://bobcopeland.com/kernel/wl/20150816/

Notes:
* Even with 80 MHz VHT enabled, performance is not great: I get about 65 Mbps
OTA.  It looks like we only send 1 frame per a-mpdu; any thoughts on how
to fix would be welcome.

* I'm not crazy about requiring a modparam and advertising mesh interfaces
that are only really usable when the modparam is set, but I'm not sure how
to set rx decap mode on the fly and whether we can do that on a per-vif
basis.

* monitor vdev for getting all multicasts is a bit heavy handed, would
be nice if there was something like ath9k's all mcast filter flag.

Bob Copeland (3):
  ath10k: enable monitor when OTHER_BSS requested
  ath10k: check for encryption before adding MIC_LEN
  ath10k: implement mesh support

 drivers/net/wireless/ath/ath10k/core.c   |  6 ++++++
 drivers/net/wireless/ath/ath10k/htt_tx.c |  3 ++-
 drivers/net/wireless/ath/ath10k/mac.c    | 34 +++++++++++++++++++++++++++-----
 3 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
