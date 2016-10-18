Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwQit-0000oW-P3
 for ath10k@lists.infradead.org; Tue, 18 Oct 2016 09:30:17 +0000
From: <akolli@qti.qualcomm.com>
Subject: [PATCHv2 0/2] ath10k: add support for tx bitrate
Date: Tue, 18 Oct 2016 14:59:40 +0530
Message-ID: <1476782982-10683-1-git-send-email-akolli@qti.qualcomm.com>
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
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org

From: Anilkumar Kolli <akolli@codeaurora.org>

This patch series adds support for tx bitrate using 
.sta_statistics callback.

tx bitrate tested on QCA4019 using iw.

Anilkumar Kolli (2):
  ath10k: add per peer htt tx stats support for 10.4
  ath10k: add support for per sta tx bitrate

 drivers/net/wireless/ath/ath10k/core.h        |   17 ++++
 drivers/net/wireless/ath/ath10k/debugfs_sta.c |   13 +++
 drivers/net/wireless/ath/ath10k/htt.c         |    2 +
 drivers/net/wireless/ath/ath10k/htt.h         |   25 +++++
 drivers/net/wireless/ath/ath10k/htt_rx.c      |  125 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h         |   10 +-
 6 files changed, 191 insertions(+), 1 deletion(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
