Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f85RF-00042V-Kd
 for ath10k@lists.infradead.org; Mon, 16 Apr 2018 14:49:12 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCHv2 0/3]: cfg80211/mac80211/ath10k: average ack rssi support for
 data frames
Date: Mon, 16 Apr 2018 20:18:39 +0530
Message-Id: <1523890122-23952-1-git-send-email-bpothuno@codeaurora.org>
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
Cc: bpothuno@codeaurora.org, linux-wireless@vger.kernel.org

This patchset introduces the average ack rssi for data frames. 


Balaji Pothunoori (3):
  ath10k: average ack rssi support for data frames.
  mac80211: average ack rssi support for data frames
  cfg80211: average ack rssi support for data frames  

v2:
	Addressed ath10k-check warnings

 drivers/net/wireless/ath/ath10k/core.c   |  4 ++++
 drivers/net/wireless/ath/ath10k/htt.h    |  6 +++++-
 drivers/net/wireless/ath/ath10k/htt_rx.c | 21 +++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c    |  4 ++++
 drivers/net/wireless/ath/ath10k/wmi.h    |  8 ++++++++
 net/mac80211/sta_info.c | 10 ++++++++++
 net/mac80211/sta_info.h |  2 ++
 net/mac80211/status.c   |  2 ++
 include/net/cfg80211.h       | 3 +++
 include/uapi/linux/nl80211.h | 7 +++++++
 net/wireless/nl80211.c       | 3 +++

 11 files changed, 69 insertions(+), 1 deletion(-)

--
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
