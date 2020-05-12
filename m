Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYLLa-0004NS-KN
 for ath10k@lists.infradead.org; Tue, 12 May 2020 03:12:48 +0000
Date: Tue, 12 May 2020 11:11:56 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:pending 21/24] drivers/net/wireless/ath/ath11k/pci.c:49:34:
 warning: Local variable 'msi_config' shadows outer variable [shadowVariable]
Message-ID: <202005121153.gLRyf9Tw%lkp@intel.com>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: kbuild-all@lists.01.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   6303acc5b03a5fc3bf6cf5fa072ae0dc9aaa5dd0
commit: 398a800c183de17a49a5779550e72fbc3ba1e592 [21/24] ath11k: Add msi config init for QCA6390

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/pci.c:49:34: warning: Local variable 'msi_config' shadows outer variable [shadowVariable]
    const struct ath11k_msi_config *msi_config;
                                    ^
   drivers/net/wireless/ath/ath11k/pci.c:23:39: note: Shadowed declaration
   static const struct ath11k_msi_config msi_config = {
                                         ^
   drivers/net/wireless/ath/ath11k/pci.c:49:34: note: Shadow variable
    const struct ath11k_msi_config *msi_config;
                                    ^

vim +/msi_config +49 drivers/net/wireless/ath/ath11k/pci.c

    45	
    46	static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
    47	{
    48		struct ath11k_base *ab = ab_pci->ab;
  > 49		const struct ath11k_msi_config *msi_config;
    50		struct msi_desc *msi_desc;
    51		int num_vectors;
    52		int ret;
    53	
    54		ret = ath11k_pci_get_msi_assignment(ab_pci);
    55		if (ret) {
    56			ath11k_err(ab, "failed to get MSI assignment, err = %d\n", ret);
    57			goto out;
    58		}
    59	
    60		msi_config = ab_pci->msi_config;
    61		if (!msi_config) {
    62			ath11k_err(ab, "msi_config is NULL!\n");
    63			ret = -EINVAL;
    64			goto out;
    65		}
    66	
    67		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
    68						    msi_config->total_vectors,
    69						    msi_config->total_vectors,
    70						    PCI_IRQ_MSI);
    71		if (num_vectors != msi_config->total_vectors) {
    72			ath11k_err(ab, "failed to get enough MSI vectors (%d), available vectors = %d",
    73				   msi_config->total_vectors, num_vectors);
    74			if (num_vectors >= 0)
    75				ret = -EINVAL;
    76			goto reset_msi_config;
    77		}
    78	
    79		msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
    80		if (!msi_desc) {
    81			ath11k_err(ab, "msi_desc is NULL!\n");
    82			ret = -EINVAL;
    83			goto free_msi_vector;
    84		}
    85	
    86		ab_pci->msi_ep_base_data = msi_desc->msg.data;
    87	
    88		ath11k_dbg(ab, ATH11K_DBG_PCI, "msi base data is %d\n", ab_pci->msi_ep_base_data);
    89	
    90		return 0;
    91	
    92	free_msi_vector:
    93		pci_free_irq_vectors(ab_pci->pdev);
    94	reset_msi_config:
    95		ab_pci->msi_config = NULL;
    96	out:
    97		return ret;
    98	}
    99	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
