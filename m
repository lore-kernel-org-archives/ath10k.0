Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDzkP-0001tY-7y
 for ath10k@lists.infradead.org; Tue, 09 Apr 2019 23:01:46 +0000
Date: Wed, 10 Apr 2019 07:01:20 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-bringup 89/93]
 drivers/net/wireless/ath/ath11k/qmi.c:505:22: sparse: symbol
 'qmi_wlanfw_ind_register_resp_msg_v01_ei' was not declared. Should it be
 static?
Message-ID: <201904100752.5BJhN5MD%lkp@intel.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
commit: 426598fdbef82ace7b4a728445f61ecf034f233c [89/93] ath11k: add qmi API support and rproc_boot for Q6
reproduce:
        # apt-get install sparse
        git checkout 426598fdbef82ace7b4a728445f61ecf034f233c
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/qmi.c:505:22: sparse: symbol 'qmi_wlanfw_ind_register_resp_msg_v01_ei' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/qmi.c:1799:41: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/ath/ath11k/qmi.c:1811:27: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/qmi.c:1811:27: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/qmi.c:1824:27: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/qmi.c:1824:27: sparse: expression using sizeof(void)
   drivers/net/wireless/ath/ath11k/qmi.c:1888:70: sparse: incorrect type in argument 4 (different address spaces) @@    expected void *bdf_addr @@    got void [noderef] <asn:2>*[assivoid *bdf_addr @@
   drivers/net/wireless/ath/ath11k/qmi.c:1888:70:    expected void *bdf_addr
   drivers/net/wireless/ath/ath11k/qmi.c:1888:70:    got void [noderef] <asn:2>*[assigned] bdf_addr

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
