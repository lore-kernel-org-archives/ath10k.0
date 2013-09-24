Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOSNR-000745-L2
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 13:10:06 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/5] ath10k: document decap modes
Date: Tue, 24 Sep 2013 15:09:15 +0200
Message-ID: <1380028158-861-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1380028158-861-1-git-send-email-michal.kazior@tieto.com>
References: <1380028158-861-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Clarify how each decap mode works in one place.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/rx_desc.h |   24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h b/drivers/net/wireless/ath/ath10k/rx_desc.h
index bfec6c8..1c584c4 100644
--- a/drivers/net/wireless/ath/ath10k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
@@ -422,10 +422,30 @@ struct rx_mpdu_end {
 #define RX_MSDU_START_INFO1_IP_FRAG             (1 << 14)
 #define RX_MSDU_START_INFO1_TCP_ONLY_ACK        (1 << 15)
 
+/* The decapped header (rx_hdr_status) contains the following:
+ *  a) 802.11 header
+ *  [padding to 4 bytes]
+ *  b) HW crypto parameter
+ *     - 0 bytes for no security
+ *     - 4 bytes for WEP
+ *     - 8 bytes for TKIP, AES
+ *  [padding to 4 bytes]
+ *  c) A-MSDU subframe header (14 bytes) if appliable
+ *  d) LLC/SNAP (RFC1042, 8 bytes)
+ *
+ * In case of A-MSDU only first frame in sequence contains (a) and (b). */
 enum rx_msdu_decap_format {
-	RX_MSDU_DECAP_RAW           = 0,
-	RX_MSDU_DECAP_NATIVE_WIFI   = 1,
+	RX_MSDU_DECAP_RAW = 0,
+
+	/* Note: QoS frames are reported as non-QoS. The rx_hdr_status in
+	 * htt_rx_desc contains the original decapped 802.11 header. */
+	RX_MSDU_DECAP_NATIVE_WIFI = 1,
+
+	/* Payload contains an ethernet header (struct ethhdr). */
 	RX_MSDU_DECAP_ETHERNET2_DIX = 2,
+
+	/* Payload contains two 48-bit addresses and 2-byte length (14 bytes
+	 * total), followed by an RFC1042 header (8 bytes). */
 	RX_MSDU_DECAP_8023_SNAP_LLC = 3
 };
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
