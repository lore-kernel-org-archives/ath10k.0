Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTqRI-0000Pp-DW
 for ath10k@lists.infradead.org; Fri, 06 Mar 2015 11:29:08 +0000
From: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
Subject: [PATCH V3 2/2] ath10k: Enable encryption of ADDBA request in PMF
 configuration
Date: Fri, 6 Mar 2015 16:57:50 +0530
Message-ID: <1425641270-4059-2-git-send-email-sjegadee@qti.qualcomm.com>
In-Reply-To: <1425641270-4059-1-git-send-email-sjegadee@qti.qualcomm.com>
References: <1425641270-4059-1-git-send-email-sjegadee@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>

In HT mode, firmware is not encrypting ADDBA request as PMF
configuration is not set in peer flags during association.

Set peer flags for MFP enabled station in ath10k driver.

This change depends on mac80211 patch "[PATCH] mac80211: send
station PMF configuration to driver".

Signed-off-by: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0c69687..83baed7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1759,6 +1759,9 @@ static int ath10k_peer_assoc_prepare(struct ath10k *ar,
 	ath10k_peer_assoc_h_qos(ar, vif, sta, arg);
 	ath10k_peer_assoc_h_phymode(ar, vif, sta, arg);

+	if (sta->mfp)
+		arg->peer_flags |= ar->wmi.peer_flags->wmi_peer_pmf;
+
 	return 0;
 }

--
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
