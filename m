Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fE7JF-0001Yf-8B
 for ath10k@lists.infradead.org; Thu, 03 May 2018 06:01:46 +0000
From: Yu Wang <yyuwang@codeaurora.org>
Subject: [PATCH] ath10k: add quiet mode support for QCA6174/QCA9377
Date: Thu,  3 May 2018 14:01:24 +0800
Message-Id: <1525327285-15392-1-git-send-email-yyuwang@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

To enable thermal throttling for QCA6174 and QCA9377,
implement gen_pdev_set_quiet_mode for them.
With this change, quiet period for QCA6174/QCA9377 can
be also set/get via debugfs.
Usage:
To set quiet period:
	echo <period> > /sys/kernel/debug/ieee80211/phyX/ath10k/quiet_period
To get the current quiet period:
	cat /sys/kernel/debug/ieee80211/phyX/ath10k/quiet_period

Yu Wang (1):
  ath10k: add quiet mode support for QCA6174/QCA9377

 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 33 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 16 +++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
