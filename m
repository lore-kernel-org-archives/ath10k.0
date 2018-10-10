Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAEGh-0001fG-80
 for ath10k@lists.infradead.org; Wed, 10 Oct 2018 13:11:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PULL] ath10k firmware 2018-10-10
Date: Wed, 10 Oct 2018 16:10:59 +0300
Message-ID: <87ftxevtek.fsf@codeaurora.org>
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

Hi linux-firmware maintainers,

here are ath10k firmware updates which have been accumulating the last 6
months or so. Please let me know if there are any problems.

Kalle

The following changes since commit c6b6265d718d118e28e1ce8f91769aa886b54c94:

  Merge tag 'iwlwifi-fw-2018-10-03' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (2018-10-08 09:23:53 -0400)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20181010

for you to fetch changes up to eaceb79a5a27ef37f85d1a5585b209361330b4bb:

  ath10k: QCA9984 hw1.0: update board-2.bin (2018-10-10 15:14:05 +0300)

----------------------------------------------------------------
Kalle Valo (10):
      ath10k: QCA4019 hw1.0: update firmware-5.bin to 10.4-3.6-00140
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA6174 hw3.0: update firmware-6.bin to RM.4.4.1.c2-00057-QCARMSWP-1
      ath10k: QCA9377 hw1.0: add firmware-6.bin to WLAN.TF.2.1-00021-QCARMSWP-1
      ath10k: QCA9887 hw1.0: update firmware-5.bin to 10.2.4-1.0-00041
      ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.6-00140
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00041
      ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.6.0.1-00003
      ath10k: QCA9984 hw1.0: update board-2.bin

 WHENCE                                            |   15 +-
 ath10k/QCA4019/hw1.0/board-2.bin                  |  Bin 133452 -> 449316 bytes
 ath10k/QCA4019/hw1.0/firmware-5.bin               |  Bin 568636 -> 583344 bytes
 ath10k/QCA6174/hw3.0/firmware-6.bin               |  Bin 730788 -> 731276 bytes
 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt |  502 +-------
 ath10k/QCA9377/hw1.0/firmware-6.bin               |  Bin 0 -> 751436 bytes
 ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt | 1352 +++++++++++++++++++++
 ath10k/QCA9887/hw1.0/firmware-5.bin               |  Bin 237584 -> 237660 bytes
 ath10k/QCA9888/hw2.0/board-2.bin                  |  Bin 72788 -> 84928 bytes
 ath10k/QCA9888/hw2.0/firmware-5.bin               |  Bin 659708 -> 675492 bytes
 ath10k/QCA988X/hw2.0/firmware-5.bin               |  Bin 248108 -> 248200 bytes
 ath10k/QCA9984/hw1.0/board-2.bin                  |  Bin 121264 -> 171916 bytes
 ath10k/QCA9984/hw1.0/firmware-5.bin               |  Bin 647380 -> 662084 bytes
 13 files changed, 1423 insertions(+), 446 deletions(-)
 create mode 100644 ath10k/QCA9377/hw1.0/firmware-6.bin
 create mode 100644 ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
