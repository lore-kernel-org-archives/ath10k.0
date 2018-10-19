Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDTbY-0004fF-So
 for ath10k@lists.infradead.org; Fri, 19 Oct 2018 12:10:14 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] ath10k: remove set but not used variable 'tlv_len'
Date: Fri, 19 Oct 2018 12:20:26 +0000
Message-ID: <1539951626-185764-1-git-send-email-yuehaibing@huawei.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, ath10k@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/ath/ath10k/wmi-tlv.c: In function 'ath10k_wmi_tlv_op_gen_config_pno_start':
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3455:6: warning:
 variable 'tlv_len' set but not used [-Wunused-but-set-variable]

It never used since inroduction in commit
ce834e280f2f ("ath10k: support NET_DETECT WoWLAN feature")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index bab8b25..bcd80e1 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3452,7 +3452,6 @@ static u32 ath10k_wmi_tlv_prepare_peer_qos(u8 uapsd_queues, u8 sp)
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;
 	__le32 *channel_list;
-	u16 tlv_len;
 	size_t len;
 	void *ptr;
 	u32 i;
@@ -3510,8 +3509,6 @@ static u32 ath10k_wmi_tlv_prepare_peer_qos(u8 uapsd_queues, u8 sp)
 	/* nlo_configured_parameters(nlo_list) */
 	cmd->no_of_ssids = __cpu_to_le32(min_t(u8, pno->uc_networks_count,
 					       WMI_NLO_MAX_SSIDS));
-	tlv_len = __le32_to_cpu(cmd->no_of_ssids) *
-		sizeof(struct nlo_configured_parameters);
 
 	tlv = ptr;
 	tlv->tag = __cpu_to_le16(WMI_TLV_TAG_ARRAY_STRUCT);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
