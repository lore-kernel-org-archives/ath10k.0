Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esk5M-0001yv-Sl
 for ath10k@lists.infradead.org; Mon, 05 Mar 2018 06:59:03 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 0/2] FWTEST command support in debugfs
Date: Mon,  5 Mar 2018 12:29:06 +0530
Message-Id: <1520233148-26050-1-git-send-email-akolli@codeaurora.org>
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
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org

Add WMI_FWTEST_CMD support.
This command is used to configure tx parameters

Sathishkumar Muruganandam (2):
  ath10k: Add WMI FWTEST command support
  ath10k: add debugfs support to configure fwtest parameters

 drivers/net/wireless/ath/ath10k/core.h    |    2 +
 drivers/net/wireless/ath/ath10k/debug.c   |   81 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h |   17 ++++++
 drivers/net/wireless/ath/ath10k/wmi.c     |   23 +++++++-
 drivers/net/wireless/ath/ath10k/wmi.h     |    6 +++
 5 files changed, 128 insertions(+), 1 deletion(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
