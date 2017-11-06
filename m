Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eBcU6-0004NF-55
 for ath10k@lists.infradead.org; Mon, 06 Nov 2017 08:10:19 +0000
From: <mpubbise@qti.qualcomm.com>
Subject: [PATCHv2 0/2] ath10k: more on tdls support for 10.4 firmwares
Date: Mon, 6 Nov 2017 13:39:30 +0530
Message-ID: <1509955772-4941-1-git-send-email-mpubbise@qti.qualcomm.com>
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
Cc: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>

This patchset includes a bug fix and an enhancement of tdls functionality for 10.4 firmwares.

First patch in this series is a bug fix, second one is an enhancement.

Manikanta Pubbisetty (2):
  ath10k: update tdls teardown state to target
  ath10k: handle tdls peer events

v2:
  - Corrected the warnings reported by ath10k-check

 drivers/net/wireless/ath/ath10k/mac.c |   10 +++++
 drivers/net/wireless/ath/ath10k/wmi.c |   72 +++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
