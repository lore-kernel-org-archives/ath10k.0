Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXR8c-0002iV-6s
 for ath10k@lists.infradead.org; Tue, 18 Jul 2017 11:58:03 +0000
From: <mpubbise@qti.qualcomm.com>
Subject: [PATCHv2 0/3] TDLS support on 10.4 firmware
Date: Tue, 18 Jul 2017 17:28:11 +0530
Message-ID: <1500379094-2373-1-git-send-email-mpubbise@qti.qualcomm.com>
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

From: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>

This patchset adds TDLS support on 10.4 firmwares.

Manikanta Pubbisetty (3):
  ath10k: extend wmi service map to accommodate new services
  ath10k: add tdls support for 10.4 firmwares
  ath10k: push peer type to target for TDLS peers

V2:
  - Commit log corrections
  - Some spellcheck corrections

 drivers/net/wireless/ath/ath10k/core.c |    9 ++
 drivers/net/wireless/ath/ath10k/hw.h   |    5 +
 drivers/net/wireless/ath/ath10k/mac.c  |    5 +-
 drivers/net/wireless/ath/ath10k/wmi.c  |  162 +++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h  |  270 +++++++++++++++++++++++++++++++-
 5 files changed, 449 insertions(+), 2 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
