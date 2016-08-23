Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcGjn-0007IW-Mu
 for ath10k@lists.infradead.org; Tue, 23 Aug 2016 18:47:52 +0000
Subject: [PATCH 0/6] linux-firmware: ath10k: update and add various firmware
 files
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 23 Aug 2016 21:47:19 +0300
Message-ID: <20160823184644.21587.95655.stgit@potku.adurom.net>
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

here's a bigger ath10k firmware update. Support for four new hardware
and smaller updates for existing hardware.

Kalle

---

Kalle Valo (6):
      ath10k: QCA4019 hw1.0: add firmware and board files
      ath10k: QCA9887 hw1.0: add firmware and board files
      ath10k: QCA9888 hw2.0: add firmware and board files
      ath10k: QCA9984 hw1.0: add firmware and board files
      ath10k: QCA988X hw2.0: update firmware to 10.2.4.70.54
      ath10k: QCA6174: update board files


 WHENCE                                            |   18 +
 ath10k/QCA4019/hw1.0/board-2.bin                  |  Bin
 ath10k/QCA4019/hw1.0/firmware-5.bin               |  Bin
 ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt |  589 +++++++++++++++++++++
 ath10k/QCA6174/hw2.1/board-2.bin                  |  Bin
 ath10k/QCA6174/hw3.0/board-2.bin                  |  Bin
 ath10k/QCA9887/hw1.0/board.bin                    |  Bin
 ath10k/QCA9887/hw1.0/firmware-5.bin               |  Bin
 ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt |  328 ++++++++++++
 ath10k/QCA9888/hw2.0/board-2.bin                  |  Bin
 ath10k/QCA9888/hw2.0/firmware-5.bin               |  Bin
 ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt |  589 +++++++++++++++++++++
 ath10k/QCA988X/hw2.0/firmware-5.bin               |  Bin
 ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt |   44 +-
 ath10k/QCA9984/hw1.0/board-2.bin                  |  Bin
 ath10k/QCA9984/hw1.0/firmware-5.bin               |  Bin
 ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt |  589 +++++++++++++++++++++
 17 files changed, 2134 insertions(+), 23 deletions(-)
 create mode 100644 ath10k/QCA4019/hw1.0/board-2.bin
 create mode 100644 ath10k/QCA4019/hw1.0/firmware-5.bin
 create mode 100644 ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt
 create mode 100644 ath10k/QCA9887/hw1.0/board.bin
 create mode 100644 ath10k/QCA9887/hw1.0/firmware-5.bin
 create mode 100644 ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt
 create mode 100644 ath10k/QCA9888/hw2.0/board-2.bin
 create mode 100644 ath10k/QCA9888/hw2.0/firmware-5.bin
 create mode 100644 ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt
 create mode 100644 ath10k/QCA9984/hw1.0/board-2.bin
 create mode 100644 ath10k/QCA9984/hw1.0/firmware-5.bin
 create mode 100644 ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
