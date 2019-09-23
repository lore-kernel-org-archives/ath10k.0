Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCNHj-0004L7-Qw
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 12:17:45 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v3 0/2] add fw coredump for sdio when firmware assert
Date: Mon, 23 Sep 2019 20:17:33 +0800
Message-Id: <1569241055-30816-1-git-send-email-wgong@codeaurora.org>
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

add fw coredump for sdio when firmware assert

Wen Gong (2):
  ath10k: add bus type for each layout of coredump
v2: change code style
v3: split bus type to another patch, 
remove ATH10K_BUS_ANY, 
add bus type for each layout
  ath10k: add fw coredump for sdio when firmware assert
v2: change code style
v3: add commit log for fastdump, 
add commit log for ath10k_sdio_hif_diag_read,
change ath10k_err to dbg log

 drivers/net/wireless/ath/ath10k/bmi.c       |   1 +
 drivers/net/wireless/ath/ath10k/core.c      |   4 +
 drivers/net/wireless/ath/ath10k/coredump.c  | 348 +++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/coredump.h  |   1 +
 drivers/net/wireless/ath/ath10k/sdio.c      | 338 ++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/targaddrs.h |  10 +
 6 files changed, 697 insertions(+), 5 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
