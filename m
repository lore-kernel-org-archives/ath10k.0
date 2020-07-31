Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Zl9-0003Vp-TQ
 for ath10k@lists.infradead.org; Fri, 31 Jul 2020 18:28:02 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 0/3] 
Date: Fri, 31 Jul 2020 23:57:19 +0530
Message-Id: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

The history recording will be compiled only if
ATH10K_DEBUG is enabled, and also enabled via
the module parameter. Once the history recording
is enabled via module parameter, it can be enabled
or disabled runtime via debugfs.

---
Changes from v1:
- Add module param and debugfs to enable/disable history recording.

Rakesh Pillai (3):
  ath10k: Add history for tracking certain events
  ath10k: Add module param to enable history
  ath10k: Add debugfs support to enable event history

 drivers/net/wireless/ath/ath10k/ce.c      |   1 +
 drivers/net/wireless/ath/ath10k/core.c    |   3 +
 drivers/net/wireless/ath/ath10k/core.h    |  82 ++++++++++++
 drivers/net/wireless/ath/ath10k/debug.c   | 207 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/debug.h   |  75 +++++++++++
 drivers/net/wireless/ath/ath10k/snoc.c    |  15 ++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |   1 +
 drivers/net/wireless/ath/ath10k/wmi.c     |  10 ++
 8 files changed, 393 insertions(+), 1 deletion(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
