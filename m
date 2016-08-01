Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUAMg-0007cC-J7
 for ath10k@lists.infradead.org; Mon, 01 Aug 2016 10:22:31 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv2 0/2] ath10k: Allow setting coverage class
Date: Mon,  1 Aug 2016 12:21:43 +0200
Message-Id: <1470046905-17449-1-git-send-email-benjamin@sipsolutions.net>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Michal Kazior <michal.kazior@tieto.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

Hi,

a new version of the patch which is based on top of the wake_tx_queue work
and also the work from Vasanthakumar which adds the rx descriptor
abstraction. The patch set is incomplete in the sense that it doesn't
update the later patches from Vasanthakumar and would break them as is.

Benjamin Berg (2):
  ath10k: Rename hw_rx_desc_ops to hw_ops to use it for other purposes
  ath10k: Allow setting coverage class

 drivers/net/wireless/ath/ath10k/core.c |  24 +++----
 drivers/net/wireless/ath/ath10k/core.h |  10 +++
 drivers/net/wireless/ath/ath10k/hw.c   | 116 ++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/hw.h   |  30 +++++++--
 drivers/net/wireless/ath/ath10k/mac.c  |  19 ++++++
 drivers/net/wireless/ath/ath10k/wmi.c  |  29 +++++++++
 6 files changed, 209 insertions(+), 19 deletions(-)

-- 
2.8.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
