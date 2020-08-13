Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69ov-0005ui-Gc
 for ath10k@lists.infradead.org; Thu, 13 Aug 2020 09:46:54 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 1/3] ath10k: add wmi service peer stat info for wmi tlv
Date: Thu, 13 Aug 2020 17:47:07 +0800
Message-Id: <1597312029-32348-2-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1597312029-32348-1-git-send-email-wgong@codeaurora.org>
References: <1597312029-32348-1-git-send-email-wgong@codeaurora.org>
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

ath10k_sta_statistics is used to report info for iw wlan0 link,
it check ath10k_peer_stats_enabled, and ath10k_peer_stats_enabled
check WMI_SERVICE_PEER_STATS bit of ar->wmi.svc_map. SVCMAP() for
WMI_SERVICE_PEER_STATS was defined only for wmi_10x_svc_map and
wmi_10_4_svc_map interfaces, it missed in wmi_tlv_svc_map, so it is
not usable for iw wlan0 link for wmi tlv interface.

If firmware report WMI_TLV_SERVICE_PEER_STATS_INFO for wmi tlv, then
enable the WMI_SERVICE_PEER_STATS bit in ath10k, and then it pass check
in ath10k_peer_stats_enabled and ath10k_sta_statistics pass check.

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048
Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index e77b97ca5c7f..b39c9b78b32b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1614,6 +1614,8 @@ wmi_tlv_svc_map(const __le32 *in, unsigned long *out, size_t len)
 	       WMI_SERVICE_MESH_11S, len);
 	SVCMAP(WMI_TLV_SERVICE_SYNC_DELETE_CMDS,
 	       WMI_SERVICE_SYNC_DELETE_CMDS, len);
+	SVCMAP(WMI_TLV_SERVICE_PEER_STATS_INFO,
+	       WMI_SERVICE_PEER_STATS, len);
 }
 
 static inline void
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
