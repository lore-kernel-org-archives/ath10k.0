Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kklzY-0005qq-0h
 for ath10k@lists.infradead.org; Thu, 03 Dec 2020 10:37:41 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH v4 0/3] add common API to configure SAR
Date: Thu,  3 Dec 2020 05:37:25 -0500
Message-Id: <20201203103728.3034-1-cjhuang@codeaurora.org>
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
Cc: briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org

This patchset is to add common API to configure SAR.
The mechanism is wlan driver registers sar capability
to wiphy and userspace queries it. Userspace then sets
power limiation to wlan driver.

v4:
- add "Reviewed-by:" tag

v3:
- check index duplicates. If index duplicates, returns error

v2:
- rebased on ToT
- fix comments by Johannes and Abhishek
- change sar_power to s32 and range_index to u32
 
Carl Huang (3):
  nl80211: add common API to configure SAR power limitations.
  mac80211: add ieee80211_set_sar_specs
  ath10k: allow dynamic SAR power limits via common API

 drivers/net/wireless/ath/ath10k/core.c |  16 +++
 drivers/net/wireless/ath/ath10k/core.h |   3 +
 drivers/net/wireless/ath/ath10k/hw.h   |   2 +
 drivers/net/wireless/ath/ath10k/mac.c  | 225 ++++++++++++++++++++++++---------
 include/net/cfg80211.h                 |  51 ++++++++
 include/net/mac80211.h                 |   2 +
 include/uapi/linux/nl80211.h           | 102 +++++++++++++++
 net/mac80211/cfg.c                     |  12 ++
 net/wireless/nl80211.c                 | 185 +++++++++++++++++++++++++++
 net/wireless/rdev-ops.h                |  12 ++
 net/wireless/trace.h                   |  19 +++
 11 files changed, 570 insertions(+), 59 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
