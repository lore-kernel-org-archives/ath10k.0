Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-02.qualcomm.com ([185.23.61.163])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpauQ-0007s7-Ao
 for ath10k@lists.infradead.org; Fri, 01 Feb 2019 15:39:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PULL] ath10k firmware 2019-02-01
Date: Fri, 1 Feb 2019 15:39:07 +0000
Message-ID: <1549035547599.95403@qca.qualcomm.com>
Content-Language: en-GB
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
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

here are few ath10k firmware updates, please pull.

Kalle

The following changes since commit a8b75cac06f80dc1500ba385680ac5b5c1d1c4f8:

  Merge tag 'add-rpi-fw' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux-firmware (2019-01-18 07:04:02 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20190201

for you to fetch changes up to 6b5e23a113704867df5205f31f02ffbc3ec4453e:

  ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00021 (2019-02-01 17:22:55 +0200)

----------------------------------------------------------------
Kalle Valo (4):
      ath10k: QCA6174 hw3.0: update board-2.bin
      ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00024
      ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00043
      ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00021

 WHENCE                              |   6 +++---
 ath10k/QCA6174/hw3.0/board-2.bin    | Bin 551128 -> 567608 bytes
 ath10k/QCA9888/hw2.0/firmware-5.bin | Bin 675492 -> 688536 bytes
 ath10k/QCA988X/hw2.0/firmware-5.bin | Bin 248200 -> 248840 bytes
 ath10k/QCA9984/hw1.0/firmware-5.bin | Bin 662084 -> 676316 bytes
 5 files changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
