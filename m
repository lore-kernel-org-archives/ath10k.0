Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgYck-0005Ub-WF
 for ath10k@lists.infradead.org; Wed, 13 Nov 2013 11:28:44 +0000
Subject: [PATCH] ath10k: remove htt rx amsdu clear retry bit hack
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 13 Nov 2013 13:28:10 +0200
Message-ID: <20131113112810.5221.69685.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

With commit 0cfcefef1 ("mac80211: support reporting A-MSDU subframes
individually") there's no need to have the hack to clear the retry bit in
ath10k_htt_rx_amsdu(), mac80211 can handle this properly now.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 90d4f74..76c152b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -659,23 +659,6 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 	memcpy(hdr_buf, hdr, hdr_len);
 	hdr = (struct ieee80211_hdr *)hdr_buf;
 
-	/* FIXME: Hopefully this is a temporary measure.
-	 *
-	 * Reporting individual A-MSDU subframes means each reported frame
-	 * shares the same sequence number.
-	 *
-	 * mac80211 drops frames it recognizes as duplicates, i.e.
-	 * retransmission flag is set and sequence number matches sequence
-	 * number from a previous frame (as per IEEE 802.11-2012: 9.3.2.10
-	 * "Duplicate detection and recovery")
-	 *
-	 * To avoid frames being dropped clear retransmission flag for all
-	 * received A-MSDUs.
-	 *
-	 * Worst case: actual duplicate frames will be reported but this should
-	 * still be handled gracefully by other OSI/ISO layers. */
-	hdr->frame_control &= cpu_to_le16(~IEEE80211_FCTL_RETRY);
-
 	first = skb;
 	while (skb) {
 		void *decap_hdr;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
