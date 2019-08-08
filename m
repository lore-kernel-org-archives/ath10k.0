Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvf8K-0004lp-CH
 for ath10k@lists.infradead.org; Thu, 08 Aug 2019 09:54:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PULL] ath10k firmware 20190808
Date: Thu, 8 Aug 2019 09:54:48 +0000
Message-ID: <BYAPR02MB6006478A57983F5B4067F54392D70@BYAPR02MB6006.namprd02.prod.outlook.com>
Content-Language: en-US
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

Hi linux-firmware maintainers,

here's a pull request to update some ath10k firmware images. Please let me know if there are any problems.

Kalle

The following changes since commit dff98c6c57383fe343407bcb7b6e775e0b87274f:

  Merge branch 'master' of git://github.com/skeggsb/linux-firmware (2019-07-26 07:32:37 -0400)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20190808

for you to fetch changes up to 1f0a99f6b07e24449411ccf208836b6769a5a2a4:

  ath10k: QCA9984 hw1.0: update board-2.bin (2019-08-08 12:39:06 +0300)

----------------------------------------------------------------
Kalle Valo (8):
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00140-QCARMSWPZ-1
      ath10k: QCA9887 hw1.0: update firmware-5.bin to 10.2.4-1.0-00045
      ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00040
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00045
      ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00046
      ath10k: QCA9984 hw1.0: update board-2.bin

 WHENCE                              |  10 +++++-----
 ath10k/QCA4019/hw1.0/board-2.bin    | Bin 449316 -> 607304 bytes
 ath10k/QCA6174/hw3.0/firmware-6.bin | Bin 731276 -> 700988 bytes
 ath10k/QCA9887/hw1.0/firmware-5.bin | Bin 237660 -> 238484 bytes
 ath10k/QCA9888/hw2.0/board-2.bin    | Bin 84928 -> 84928 bytes
 ath10k/QCA9888/hw2.0/firmware-5.bin | Bin 688536 -> 686996 bytes
 ath10k/QCA988X/hw2.0/firmware-5.bin | Bin 248840 -> 248984 bytes
 ath10k/QCA9984/hw1.0/board-2.bin    | Bin 171916 -> 171916 bytes
 ath10k/QCA9984/hw1.0/firmware-5.bin | Bin 676316 -> 674940 bytes
 9 files changed, 5 insertions(+), 5 deletions(-)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
