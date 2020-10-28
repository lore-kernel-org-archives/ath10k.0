Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXopm-0003Eo-28
 for ath10k@lists.infradead.org; Wed, 28 Oct 2020 17:02:09 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2] ath10k: Fix the parsing error in service available event
Date: Wed, 28 Oct 2020 22:31:09 +0530
Message-Id: <1603904469-598-1-git-send-email-pillair@codeaurora.org>
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
Cc: kuabhs@chromium.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>

The wmi service available event has been
extended to contain extra 128 bit for new services
to be indicated by firmware.

Currently the presence of any optional TLVs in
the wmi service available event leads to a parsing
error with the below error message:
ath10k_snoc 18800000.wifi: failed to parse svc_avail tlv: -71

The wmi service available event parsing should
not return error for the newly added optional TLV.
Fix this parsing for service available event message.

Tested-on: WCN3990 hw1.0 SNOC

Fixes: cea19a6ce8bf ("ath10k: add WMI_SERVICE_AVAILABLE_EVENT support")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
Changes from v1:
- Access service_map_ext only if this TLV was sent in service
  available event.
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 4 +++-
 drivers/net/wireless/ath/ath10k/wmi.c     | 5 +++--
 drivers/net/wireless/ath/ath10k/wmi.h     | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 932266d..7b58341 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1401,13 +1401,15 @@ static int ath10k_wmi_tlv_svc_avail_parse(struct ath10k *ar, u16 tag, u16 len,
 
 	switch (tag) {
 	case WMI_TLV_TAG_STRUCT_SERVICE_AVAILABLE_EVENT:
+		arg->service_map_ext_valid = true;
 		arg->service_map_ext_len = *(__le32 *)ptr;
 		arg->service_map_ext = ptr + sizeof(__le32);
 		return 0;
 	default:
 		break;
 	}
-	return -EPROTO;
+
+	return 0;
 }
 
 static int ath10k_wmi_tlv_op_pull_svc_avail(struct ath10k *ar,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 1fa7107..2e4b561 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5751,8 +5751,9 @@ void ath10k_wmi_event_service_available(struct ath10k *ar, struct sk_buff *skb)
 			    ret);
 	}
 
-	ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
-			       __le32_to_cpu(arg.service_map_ext_len));
+	if (arg.service_map_ext_valid)
+		ath10k_wmi_map_svc_ext(ar, arg.service_map_ext, ar->wmi.svc_map,
+				       __le32_to_cpu(arg.service_map_ext_len));
 }
 
 static int ath10k_wmi_event_temperature(struct ath10k *ar, struct sk_buff *skb)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 4898e19..66ecf09 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -6917,6 +6917,7 @@ struct wmi_svc_rdy_ev_arg {
 };
 
 struct wmi_svc_avail_ev_arg {
+	bool service_map_ext_valid;
 	__le32 service_map_ext_len;
 	const __le32 *service_map_ext;
 };
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
