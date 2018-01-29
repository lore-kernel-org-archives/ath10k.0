Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eg4MS-0002oG-5v
 for ath10k@lists.infradead.org; Mon, 29 Jan 2018 08:00:24 +0000
From: Yu Wang <yyuwang@codeaurora.org>
Subject: [PATCH] ath10k: fix kernel panic issue during pci probe
Date: Mon, 29 Jan 2018 16:00:00 +0800
Message-Id: <1517212801-7523-1-git-send-email-yyuwang@codeaurora.org>
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

If device gone during chip reset, ar->normal_mode_fw.board is not
initialized, but ath10k_debug_print_hwfw_info() will try to access its
member, which will cause 'kernel NULL pointer' issue. This was found
using a faulty device (pci link went down sometimes) in a random
insmod/rmmod/other-op test.
To fix it, check ar->normal_mode_fw.board before accessing the member.

Yu Wang (1):
  ath10k: fix kernel panic issue during pci probe

 drivers/net/wireless/ath/ath10k/debug.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
