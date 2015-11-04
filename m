Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtwpU-0007lL-IO
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 12:06:17 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V2 0/3] Fix few WMI/HTT interfaces
Date: Wed, 4 Nov 2015 17:35:34 +0530
Message-ID: <1446638737-7953-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

This patch set fixes mismatch in peer_assoc complete wmi command for
version 10.4 and peer_id configuration for HTT version < 3.4.

V2:
	- Add cover letter
	- Rename ath10k_mac_need_offchan_tx_work() to
	  ath10k_mac_tx_frm_has_freq(). Add htt-op-version check
	  to the helper and use it in ath10k_htt_tx() while configuring
	  peerid.

Vasanthakumar Thiagarajan (3):
  ath10k: Fix peer assoc complete WMI command for 10.4
  ath10k: Rename the helper which is used for off-channel tx
  ath10k: Fix peerid configuration in htt tx desc for htt version < 3.4

 drivers/net/wireless/ath/ath10k/htt.h    |  9 ++++++--
 drivers/net/wireless/ath/ath10k/htt_tx.c | 11 ++++++++--
 drivers/net/wireless/ath/ath10k/mac.c    |  9 ++++----
 drivers/net/wireless/ath/ath10k/mac.h    |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c    | 37 +++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h    |  5 +++++
 6 files changed, 63 insertions(+), 9 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
