Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzua2-0000ga-Jg
 for ath10k@lists.infradead.org; Mon, 27 Jul 2020 04:17:40 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v2 0/2] ath10k: SAR power limit vendor command
Date: Mon, 27 Jul 2020 12:17:36 +0800
Message-Id: <1595823458-3926-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

v2: change description of "nl80211: vendor-cmd: qca: add dynamic SAR power limits"
remove ATH10K_WMI_SAR_*G_0_MASK of wmi.h

here's a patchset adding dynamic SAR power limit vendor command to
ath10k. This follows the new process documented in the wiki:

https://wireless.wiki.kernel.org/en/developers/documentation/nl80211#vendor-specific_api

Wen Gong (2):
  nl80211: vendor-cmd: qca: add dynamic SAR power limits
  ath10k: allow dynamic SAR power limits to be configured

 drivers/net/wireless/ath/ath10k/Makefile |   1 +
 drivers/net/wireless/ath/ath10k/core.c   |   2 +
 drivers/net/wireless/ath/ath10k/core.h   |   2 +
 drivers/net/wireless/ath/ath10k/hw.h     |   3 +
 drivers/net/wireless/ath/ath10k/mac.c    |  64 +++++++++++++
 drivers/net/wireless/ath/ath10k/mac.h    |   2 +-
 drivers/net/wireless/ath/ath10k/vendor.c | 114 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/vendor.h |  13 +++
 include/uapi/nl80211-vnd-qca.h           |  68 ++++++++++++++
 9 files changed, 268 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/vendor.c
 create mode 100644 drivers/net/wireless/ath/ath10k/vendor.h
 create mode 100644 include/uapi/nl80211-vnd-qca.h

-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
