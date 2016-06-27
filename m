Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHSPu-0007Vf-PU
 for ath10k@lists.infradead.org; Mon, 27 Jun 2016 09:01:19 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCHV2 0/3] Add testmode support for 10.4
Date: Mon, 27 Jun 2016 14:36:11 +0530
Message-ID: <1467018371-24416-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

*The below patches add testmode support for 10.4.

*Some of the codeswap related code in ath10k for example code
which  initializes the code swap segment works only on normal fw,
below patches  make such code generic so that it can be used
for utf binary as well.

Tamizh chelvam (3):
  ath10k: move firmware_swap_code_seg_info to ath10k_fw_file
  ath10k: handle testmode events for 10.2 and 10.4 based firmware
  ath10k: add testmode support for 10.4 firmware

V2:
  * changed author and signed off mail id.

 drivers/net/wireless/ath/ath10k/core.c     |    6 +++---
 drivers/net/wireless/ath/ath10k/core.h     |    6 ++----
 drivers/net/wireless/ath/ath10k/swap.c     |   26 ++++++++++++++------------
 drivers/net/wireless/ath/ath10k/swap.h     |   11 ++++++++---
 drivers/net/wireless/ath/ath10k/testmode.c |   23 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c      |   26 ++++++++++++++++++++++++++
 6 files changed, 76 insertions(+), 22 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
