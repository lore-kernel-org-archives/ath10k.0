Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1u7U-0000wq-Fp
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 10:17:29 +0000
Date: Mon, 8 Jun 2015 18:16:37 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [ath6kl:pending 13/20] drivers/net/wireless/ath/ath10k/core.c:34:14:
 sparse: symbol 'ath10k_cryptmode_param' was not declared. Should it be
 static?
Message-ID: <201506081858.50qhbeJJ%fengguang.wu@intel.com>
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
To: Liu CF/TW <cfliu.tw@gmail.com>
Cc: "Kalle Valo <kvalo@adurom.com> Kalle Valo" <kvalo@adurom.com>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   git://github.com/kvalo/ath pending
head:   b05648495f19ba2cff2662ec06e059f4d3ef70a5
commit: 1c5277383bef3c7c9fc73c33d3dea4255e4919b6 [13/20] ath10k: add 'cryptmode' param to support raw tx injection and sw crypto.
reproduce:
  # apt-get install sparse
  git checkout 1c5277383bef3c7c9fc73c33d3dea4255e4919b6
  make ARCH=x86_64 allmodconfig
  make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/core.c:34:14: sparse: symbol 'ath10k_cryptmode_param' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
