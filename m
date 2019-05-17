Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRZjv-00083O-Sl
 for ath10k@lists.infradead.org; Fri, 17 May 2019 10:05:25 +0000
From: Abhishek Ambure <aambure@codeaurora.org>
Subject: [PATCH 0/2] correction in pktlog service connect and pktlog enable
 command
Date: Fri, 17 May 2019 15:35:14 +0530
Message-Id: <1558087516-666-1-git-send-email-aambure@codeaurora.org>
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

WCN3990 firmware supports htc pktlog service through which host driver
gets pktlog information. Pktlog service should be connected before htc
start command, hence pktlog connect is moved before htc start. 

WCN3990 firwmare expects pdev_id along with filter and reserved params to
enable pktlog htc service. So adding pdev_id in pktlog enable comamnd
params.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00963-QCAHLSWMTPL-1


Abhishek Ambure (2):
  ath10k: move pktlog connect service before htc start
  ath10k: correct wmi_tlv command params to enable pktlog for WCN3990

 drivers/net/wireless/ath/ath10k/htc.c     | 16 ++++++++--------
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  2 ++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  1 +
 3 files changed, 11 insertions(+), 8 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
