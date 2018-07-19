Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg8xK-0000y4-2A
 for ath10k@lists.infradead.org; Thu, 19 Jul 2018 13:26:55 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH v2 0/3] cfg80211/mac80211/ath10k: Extend avg ack rssi support
 for mgmt frames
Date: Thu, 19 Jul 2018 18:56:26 +0530
Message-Id: <1532006789-32454-1-git-send-email-bpothuno@codeaurora.org>
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
To: johannes@sipsolutions.net, ath10k@lists.infradead.org
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, linux-wireless@vger.kernel.org

Adding ack signal support in station dump if the driver supports; also made changes to update 
"last ack signal" and "avg ack signal" for both data and management tx ack packet.

Balaji Pothunoori (3):
  cfg80211: Extend avg ack rssi support for mgmt frames
  mac80211: Extend avg ack rssi support for mgmt frames
  ath10k: management tx ack rssi capability check

 drivers/net/wireless/ath/ath10k/mac.c |  5 +++--
 include/uapi/linux/nl80211.h          |  7 +++++++
 net/mac80211/sta_info.c               | 26 +++++++++++++-------------
 net/wireless/nl80211.c                |  7 ++++---
 4 files changed, 27 insertions(+), 18 deletions(-)

--
v2 : Addressed Johannes comments 
     Modified subject and commit log 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
