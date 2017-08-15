Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dha08-0000pO-Em
 for ath10k@lists.infradead.org; Tue, 15 Aug 2017 11:27:14 +0000
Date: Tue, 15 Aug 2017 19:26:20 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [ath6kl:pending 36/47]
 drivers/net/wireless/ath/ath10k/pci.c:1561:2-3: Unneeded semicolon
Message-ID: <201708151916.lDrZc3FC%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Alan Liu <alanliu@qca.qualcomm.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   7c1df2a9bb80c508345f3c5c430e02d16d86f5a3
commit: 3773d23328241a87ff65ad3714e078b5753ae891 [36/47] ath10k: add memory dump support for QCA6174/QCA9377


coccinelle warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/pci.c:1561:2-3: Unneeded semicolon
--
>> drivers/net/wireless/ath/ath10k/pci.c:1522:6-15: WARNING: Unsigned expression compared with zero: skip_size < 0

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
