Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eewkh-0005Lv-Vj
 for ath10k@lists.infradead.org; Fri, 26 Jan 2018 05:40:41 +0000
From: Yu Wang <yyuwang@codeaurora.org>
Subject: [PATCH] ath10k: correct the length of DRAM dump for QCA6174
 hw3.x/QCA9377 hw1.1
Date: Fri, 26 Jan 2018 13:40:20 +0800
Message-Id: <1516945221-4710-1-git-send-email-yyuwang@codeaurora.org>
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

The length of DRAM dump for QCA6174 hw3.0/hw3.2 and QCA9377 hw1.1
are less than the actual value, some coredump contents are missed.
To fix it, change the length from 0x90000 to 0xa8000.

Fixes: 703f261dd77f ("ath10k: add memory dump support for QCA6174/QCA9377")

Yu Wang (1):
  ath10k: correct the length of DRAM dump for QCA6174 hw3.x/QCA9377
    hw1.1

 drivers/net/wireless/ath/ath10k/coredump.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
