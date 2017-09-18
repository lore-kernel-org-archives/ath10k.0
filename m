Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dtxYL-0004bp-LI
 for ath10k@lists.infradead.org; Mon, 18 Sep 2017 15:01:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH 0/3] linux-firmware: ath10k update 20170918
Date: Mon, 18 Sep 2017 18:00:54 +0300
Message-ID: <1505746857-31938-1-git-send-email-kvalo@qca.qualcomm.com>
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
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Few firmware fixes to user reported issues for ath10k, but the other "fix"
being a revert back to older firmware. Also a small board-2.bin update.

Kalle Valo (3):
  ath10k: QCA6174 hw3.0: update firmware-6.bin to
    WLAN.RM.4.4.1-00051-QCARMSWP-1
  ath10k: QCA6174 hw3.0: update board-2.bin
  Revert "ath10k: QCA988X hw2.0: update firmware to 10.2.4.70.63-2"

 WHENCE                                            |   4 +-
 ath10k/QCA6174/hw3.0/board-2.bin                  | Bin 477060 -> 501748 bytes
 ath10k/QCA6174/hw3.0/firmware-6.bin               | Bin 711408 -> 727776 bytes
 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt |  97 +++++-----------------
 ath10k/QCA988X/hw2.0/firmware-5.bin               | Bin 249384 -> 248188 bytes
 5 files changed, 25 insertions(+), 76 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
