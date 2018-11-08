Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKYNo-0004jm-Sd
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 00:41:18 +0000
Received: by mail-pl1-x642.google.com with SMTP id w22-v6so5335920plk.0
 for <ath10k@lists.infradead.org>; Wed, 07 Nov 2018 16:41:06 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 4.20] ath10k: don't assume 'vif' is non-NULL in flush()
Date: Wed,  7 Nov 2018 16:40:35 -0800
Message-Id: <20181108004035.136050-1-briannorris@chromium.org>
MIME-Version: 1.0
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
Cc: Grant Grundler <grundler@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Wen Gong <wgong@codeaurora.org>

mac80211 may call us with vif == NULL, if the station is not currently
active (e.g., not associated). It is trivially easy to reproduce a crash
by suspending the system when not connected to an AP:

[   65.533934] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
...
[   65.574521] pc : ath10k_flush+0x30/0xd0 [ath10k_core]
[   65.574538] lr : __ieee80211_flush_queues+0x180/0x244 [mac80211]
[   65.599680] Process kworker/u12:1 (pid: 57, stack limit = 0x(____ptrval____))
[   65.599682] Call trace:
[   65.599695]  ath10k_flush+0x30/0xd0 [ath10k_core]
[   65.642064]  __ieee80211_flush_queues+0x180/0x244 [mac80211]
[   65.642079]  ieee80211_flush_queues+0x34/0x40 [mac80211]
[   65.642095]  __ieee80211_suspend+0xfc/0x47c [mac80211]
[   65.658611]  ieee80211_suspend+0x30/0x3c [mac80211]
[   65.658627]  wiphy_suspend+0x15c/0x3a8 [cfg80211]
[   65.672810]  dpm_run_callback+0xf0/0x1f0
[   65.672814]  __device_suspend+0x3ac/0x4f8
[   65.672819]  async_suspend+0x34/0xbc
[   65.684096]  async_run_entry_fn+0x54/0x104
[   65.684099]  worker_thread+0x4cc/0x72c
[   65.684102]  kthread+0x134/0x13c
[   65.684105]  ret_from_fork+0x10/0x18

Fixes: 9de4162f0999 ("ath10k: add peer flush in ath10k_flush for STATION")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a1c2801ded10..7e49342bae38 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6867,7 +6867,7 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	u32 bitmap;
 
 	if (drop) {
-		if (vif->type == NL80211_IFTYPE_STATION) {
+		if (vif && vif->type == NL80211_IFTYPE_STATION) {
 			bitmap = ~(1 << WMI_MGMT_TID);
 			list_for_each_entry(arvif, &ar->arvifs, list) {
 				if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
-- 
2.19.1.930.g4563a0d9d0-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
