Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmsot-0001sv-Ks
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 04:10:20 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 0/2] ath10k: Handle bundle tx completion for management pkts
Date: Fri, 25 Jan 2019 09:40:00 +0530
Message-Id: <1548389402-10083-1-git-send-email-pillair@codeaurora.org>
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

WCN3990 sends the tx completion for management frames via wmi.
The tx completion for the multiple management frames can also
be bundled in a single wmi event and sent to the host driver.
This reduces the number of WMI events sent to the host driver
by the target.

Enable the support in firmware to send tx completion for
management frames, bundled in a single event, by setting the
proper flag in wmi init command.
Handle the bundled management tx completion event in host driver.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Changes from v1:
 - Addressed comments to remove tricky typecasting.
 - Fixed compilation warnings.

Rakesh Pillai (2):
  ath10k: Handle bundled tx completion for management frames
  ath10k: Enable bundle tx compl for management frames in WCN3990

 drivers/net/wireless/ath/ath10k/wmi-ops.h | 13 +++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 65 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  3 ++
 drivers/net/wireless/ath/ath10k/wmi.c     | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |  7 ++++
 5 files changed, 110 insertions(+), 1 deletion(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
