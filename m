Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpah3-00037r-VW
 for ath10k@lists.infradead.org; Sun, 28 Jun 2020 17:02:16 +0000
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 0/4] ath10k: Add support for TID specific configuration
Date: Sun, 28 Jun 2020 22:31:54 +0530
Message-Id: <1593363718-5148-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>

Add TID specific configuration for noack, retry count, aggregation, Tx rate
and RTS_CTS control. Here if noack is enabled for the TID then aggregation
should be disabled and Tx rate should be and retry count will be 0.
Also add support for reset TID configuration.

Tamizh Chelvam (4):
  ath10k: Add wmi command support for station specific TID config
  ath10k: Move rate mask validation function up in the file
  ath10k: Add new api to support TID specific configuration
  ath10k: Add new api to support reset TID config

 drivers/net/wireless/ath/ath10k/core.c    |   4 +
 drivers/net/wireless/ath/ath10k/core.h    |  20 +
 drivers/net/wireless/ath/ath10k/mac.c     | 839 ++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/txrx.c    |  11 +-
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  19 +
 drivers/net/wireless/ath/ath10k/wmi.c     |  35 ++
 drivers/net/wireless/ath/ath10k/wmi.h     |  72 +++
 7 files changed, 907 insertions(+), 93 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
