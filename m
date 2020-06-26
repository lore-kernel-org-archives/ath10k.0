Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jotU9-0006Qi-Ua
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 18:54:03 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
Date: Sat, 27 Jun 2020 00:23:51 +0530
Message-Id: <1593197633-9014-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

This patch series includes some fixes when the device
is in recovery mode, i.e. when the firmware goes down.

- Pausing TX queues when FW goes down
- Removed unwanted/extra error logging in pkt TX path
- Skipping wait for FW response for delete cmds
- Handling the -ESHUTDOWN error code in case of SSR.

Rakesh Pillai (2):
  ath10k: Pause the tx queues when firmware is down
  ath10k: Skip wait for delete response if firmware is down

 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 36 ++++++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
 3 files changed, 28 insertions(+), 12 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
