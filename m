Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awCRp-00016I-D2
 for ath10k@lists.infradead.org; Fri, 29 Apr 2016 17:43:26 +0000
Subject: [PATCH 0/4] linux-firmware: ath10k: add QCA9377 and update QCA6174
 images
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 29 Apr 2016 20:42:53 +0300
Message-ID: <20160429173841.9072.66852.stgit@potku.adurom.net>
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

Hi,

here are firmware images for the new QCA9377 chip and updates for QCA6174.

Kalle

---

Kalle Valo (4):
      ath10k: QCA6174 hw2.1: update firmware-5.bin to SW_RM.1.1.1-00157-QCARMSWPZ-1
      ath10k: QCA6174 hw2.1: add board-2.bin
      ath10k: QCA6174 hw3.0: add board-2.bin
      ath10k: QCA9377 hw1.0: add firmware and board files


 WHENCE                                            |    9 
 ath10k/QCA6174/hw2.1/board-2.bin                  |  Bin
 ath10k/QCA6174/hw2.1/firmware-5.bin               |  Bin
 ath10k/QCA6174/hw3.0/board-2.bin                  |  Bin
 ath10k/QCA9377/hw1.0/board-2.bin                  |  Bin
 ath10k/QCA9377/hw1.0/board.bin                    |  Bin
 ath10k/QCA9377/hw1.0/firmware-5.bin               |  Bin
 ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt | 1128 +++++++++++++++++++++
 8 files changed, 1136 insertions(+), 1 deletion(-)
 create mode 100644 ath10k/QCA6174/hw2.1/board-2.bin
 create mode 100644 ath10k/QCA6174/hw3.0/board-2.bin
 create mode 100644 ath10k/QCA9377/hw1.0/board-2.bin
 create mode 100644 ath10k/QCA9377/hw1.0/board.bin
 create mode 100644 ath10k/QCA9377/hw1.0/firmware-5.bin
 create mode 100644 ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
