Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuVkY-00070B-SM
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 04:37:08 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 0/2] ath10k: Enable pktlog for WCN3990 chipset
Date: Tue, 28 Aug 2018 10:06:40 +0530
Message-Id: <20180828043642.14890-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

WCN3990 target uses separate htc service(ATH10K_HTC_SVC_ID_HTT_LOG_MSG)
for pktlog. Add pktlog service request and support for pktlog
rx path handling.

Tested HW: WCN3990 and QCA6174.
Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1,
           WLAN.RM.4.4.1-00109-QCARMSWPZ-1

Govind Singh (2):
  ath10k: Introduce CE_ATTR_POLL attribute for polling pipe
  ath10k: Enable pktlog for WCN3990 target

 drivers/net/wireless/ath/ath10k/ce.c   | 18 ++++++--
 drivers/net/wireless/ath/ath10k/ce.h   | 11 +++--
 drivers/net/wireless/ath/ath10k/htc.c  | 63 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/pci.c  |  4 +-
 drivers/net/wireless/ath/ath10k/snoc.c | 13 +++++-
 5 files changed, 96 insertions(+), 13 deletions(-)

-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
