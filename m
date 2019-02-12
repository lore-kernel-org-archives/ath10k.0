Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtXM6-0000Xh-Ln
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 12:40:09 +0000
From: Abhishek Ambure <aambure@codeaurora.org>
Subject: [PATCH v2 0/2] Add support for ack rssi values of all data and
Date: Tue, 12 Feb 2019 18:09:49 +0530
Message-Id: <1549975191-20912-1-git-send-email-aambure@codeaurora.org>
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
Cc: Abhishek Ambure <aambure@codeaurora.org>, linux-wireless@vger.kernel.org

WCN3990 firmware supporting WMI_TLV_SERVICE_TX_DATA_MGMT_ACK_RSSI sends
ack rssi value of all data and management tx packets to host through tx
completion event.

If WMI_RSRC_CFG_FLAG_TX_ACK_RSSI is set in host capability then firmware
sends RSSI value in tx completion events of data and management packets.
Host driver extracts ack rssi values of tx packets from their tx
completion event.

Applications gets ack rssi value of data and managent tx packets using
below commands,
For Data ack rssi command: - iw dev <interface-name> station dump
O/P: - check last_ack_rssi value in output

For Management ack rssi command: - 
hostapd_cli POLL_STA <MAC-ADDR-OF-STA>
O/P: - OK

hostapd_cli STA <MAC-ADDR-OF-STA>
O/P: - check last_ack_rssi value in output

V2: Tested firmware and Tested hardware added

Abhishek Ambure (2):
  ath10k: Add support for ack rssi value of management tx packets
  ath10k: Add support for ack rssi value of data tx packets

 drivers/net/wireless/ath/ath10k/htt.h     | 86 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htt_rx.c  | 12 +++--
 drivers/net/wireless/ath/ath10k/hw.c      | 32 +++++++++++-
 drivers/net/wireless/ath/ath10k/hw.h      | 22 ++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 26 +++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 25 +++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     | 40 +++++++++-----
 drivers/net/wireless/ath/ath10k/wmi.h     | 11 ++++
 8 files changed, 234 insertions(+), 20 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
