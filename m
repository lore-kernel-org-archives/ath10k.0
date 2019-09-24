Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCfF9-0004BF-S1
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 07:28:17 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v4 0/2] add fw coredump for sdio when firmware assert
Date: Tue, 24 Sep 2019 15:27:08 +0800
Message-Id: <1569310030-834-1-git-send-email-wgong@codeaurora.org>
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

v2: change code style

v3: split bus type to another patch, 
remove ATH10K_BUS_ANY, 
add bus type for each layout

v4: rebase to latest commit

Wen Gong (2):
  ath10k: add bus type for each layout of coredump
  ath10k: add fw coredump for sdio when firmware assert

 drivers/net/wireless/ath/ath10k/bmi.c       |   1 +
 drivers/net/wireless/ath/ath10k/core.c      |  10 +
 drivers/net/wireless/ath/ath10k/coredump.c  | 349 +++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/coredump.h  |   1 +
 drivers/net/wireless/ath/ath10k/sdio.c      | 338 ++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/targaddrs.h |  10 +
 6 files changed, 704 insertions(+), 5 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
