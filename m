Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFgWm-0005Rd-7i
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 09:32:00 +0000
Received: by mail-wg0-f43.google.com with SMTP id l18so5392100wgh.14
 for <ath10k@lists.infradead.org>; Fri, 08 Aug 2014 02:31:38 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 2/3] ath10k: dont duplicate service-pipe mapping
Date: Fri,  8 Aug 2014 11:22:14 +0200
Message-Id: <1407489735-28091-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407489735-28091-1-git-send-email-michal.kazior@tieto.com>
References: <1407489735-28091-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>

The mapping is already defined in a structure. It
makes little sense to duplicate information stored
in it within a function.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 77 +++++++++++++++--------------------
 1 file changed, 33 insertions(+), 44 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 38a9546..fee875b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1056,68 +1056,57 @@ static void ath10k_pci_kill_tasklet(struct ath10k *ar)
 		tasklet_kill(&ar_pci->pipe_info[i].intr);
 }
 
-/* TODO - temporary mapping while we have too few CE's */
 static int ath10k_pci_hif_map_service_to_pipe(struct ath10k *ar,
 					      u16 service_id, u8 *ul_pipe,
 					      u8 *dl_pipe, int *ul_is_polled,
 					      int *dl_is_polled)
 {
-	int ret = 0;
+	const struct service_to_pipe *entry;
+	bool ul_set = false, dl_set = false;
+	int i;
 
 	ath10k_dbg(ATH10K_DBG_PCI, "pci hif map service\n");
 
 	/* polling for received messages not supported */
 	*dl_is_polled = 0;
 
-	switch (service_id) {
-	case ATH10K_HTC_SVC_ID_HTT_DATA_MSG:
-		/*
-		 * Host->target HTT gets its own pipe, so it can be polled
-		 * while other pipes are interrupt driven.
-		 */
-		*ul_pipe = 4;
-		/*
-		 * Use the same target->host pipe for HTC ctrl, HTC raw
-		 * streams, and HTT.
-		 */
-		*dl_pipe = 1;
-		break;
-
-	case ATH10K_HTC_SVC_ID_RSVD_CTRL:
-	case ATH10K_HTC_SVC_ID_TEST_RAW_STREAMS:
-		/*
-		 * Note: HTC_RAW_STREAMS_SVC is currently unused, and
-		 * HTC_CTRL_RSVD_SVC could share the same pipe as the
-		 * WMI services.  So, if another CE is needed, change
-		 * this to *ul_pipe = 3, which frees up CE 0.
-		 */
-		/* *ul_pipe = 3; */
-		*ul_pipe = 0;
-		*dl_pipe = 1;
-		break;
+	for (i = 0; i < ARRAY_SIZE(target_service_to_ce_map_wlan); i++) {
+		entry = &target_service_to_ce_map_wlan[i];
 
-	case ATH10K_HTC_SVC_ID_WMI_DATA_BK:
-	case ATH10K_HTC_SVC_ID_WMI_DATA_BE:
-	case ATH10K_HTC_SVC_ID_WMI_DATA_VI:
-	case ATH10K_HTC_SVC_ID_WMI_DATA_VO:
+		if (entry->service_id != service_id)
+			continue;
 
-	case ATH10K_HTC_SVC_ID_WMI_CONTROL:
-		*ul_pipe = 3;
-		*dl_pipe = 2;
-		break;
+		switch (entry->pipedir) {
+		case PIPEDIR_NONE:
+			break;
+		case PIPEDIR_IN:
+			WARN_ON(dl_set);
+			*dl_pipe = entry->pipenum;
+			dl_set = true;
+			break;
+		case PIPEDIR_OUT:
+			WARN_ON(ul_set);
+			*ul_pipe = entry->pipenum;
+			ul_set = true;
+			break;
+		case PIPEDIR_INOUT:
+			WARN_ON(dl_set);
+			WARN_ON(ul_set);
+			*dl_pipe = entry->pipenum;
+			*ul_pipe = entry->pipenum;
+			dl_set = true;
+			ul_set = true;
+			break;
+		}
+	}
 
-		/* pipe 5 unused   */
-		/* pipe 6 reserved */
-		/* pipe 7 reserved */
+	if (WARN_ON(!ul_set || !dl_set))
+		return -ENOENT;
 
-	default:
-		ret = -1;
-		break;
-	}
 	*ul_is_polled =
 		(host_ce_config_wlan[*ul_pipe].flags & CE_ATTR_DIS_INTR) != 0;
 
-	return ret;
+	return 0;
 }
 
 static void ath10k_pci_hif_get_default_pipe(struct ath10k *ar,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
