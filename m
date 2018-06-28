Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYTCf-0006mW-FX
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 09:27:03 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 0/2] ath10k: Handle mgmt tx completion event
Date: Thu, 28 Jun 2018 14:48:55 +0530
Message-Id: <1530177537-18487-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

The transmitted management frame completion can be
sent by the firmware as one completion per event or it can
bundle the completion of a bunch of management frames and
send it in one single event.

Disable the bundle tx completion for management frames
and handle the tx completion event for management frames to
free these frames.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Rakesh Pillai (1):
  ath10k: Handle mgmt tx completion event

Surabhi Vishnoi (1):
  ath10k: Disable bundle mgmt tx completion event support

 drivers/net/wireless/ath/ath10k/core.c    |  1 +
 drivers/net/wireless/ath/ath10k/core.h    |  5 ++
 drivers/net/wireless/ath/ath10k/hw.h      |  1 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 12 +++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 70 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 17 +++++++
 drivers/net/wireless/ath/ath10k/wmi.c     | 84 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  7 +++
 8 files changed, 195 insertions(+), 2 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
