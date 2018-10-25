Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFYZj-0000Tf-4N
 for ath10k@lists.infradead.org; Thu, 25 Oct 2018 05:52:57 +0000
Date: Thu, 25 Oct 2018 08:52:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:pending 46/46] drivers/net/wireless/ath/ath10k/pci.c:3687
 ath10k_pci_remove() warn: variable dereferenced before check 'ar' (see line
 3685)
Message-ID: <20181025055223.da5sp7b2jayezmrb@mwanda>
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
To: kbuild@01.org, Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Kan Yan <kyan@chromium.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   9fb5f44c1dff6c461f0ceaf3e6665cedc99cc1b4
commit: 9fb5f44c1dff6c461f0ceaf3e6665cedc99cc1b4 [46/46] ath10k: Add wrapper function to ath10k debug

smatch warnings:
drivers/net/wireless/ath/ath10k/pci.c:3687 ath10k_pci_remove() warn: variable dereferenced before check 'ar' (see line 3685)

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=9fb5f44c1dff6c461f0ceaf3e6665cedc99cc1b4
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 9fb5f44c1dff6c461f0ceaf3e6665cedc99cc1b4
vim +/ar +3687 drivers/net/wireless/ath/ath10k/pci.c

5e3dd157 Kalle Valo    2013-06-12  3679  
5e3dd157 Kalle Valo    2013-06-12  3680  static void ath10k_pci_remove(struct pci_dev *pdev)
5e3dd157 Kalle Valo    2013-06-12  3681  {
5e3dd157 Kalle Valo    2013-06-12  3682  	struct ath10k *ar = pci_get_drvdata(pdev);
5e3dd157 Kalle Valo    2013-06-12  3683  	struct ath10k_pci *ar_pci;
5e3dd157 Kalle Valo    2013-06-12  3684  
7aa7a72a Michal Kazior 2014-08-25 @3685  	ath10k_dbg(ar, ATH10K_DBG_PCI, "pci remove\n");
                                                           ^^
The ath10k_dbg() function dereferences "ar".

5e3dd157 Kalle Valo    2013-06-12  3686  
5e3dd157 Kalle Valo    2013-06-12 @3687  	if (!ar)
                                                    ^^^
Too late.

5e3dd157 Kalle Valo    2013-06-12  3688  		return;
5e3dd157 Kalle Valo    2013-06-12  3689  
5e3dd157 Kalle Valo    2013-06-12  3690  	ar_pci = ath10k_pci_priv(ar);
5e3dd157 Kalle Valo    2013-06-12  3691  
5e3dd157 Kalle Valo    2013-06-12  3692  	if (!ar_pci)
5e3dd157 Kalle Valo    2013-06-12  3693  		return;
5e3dd157 Kalle Valo    2013-06-12  3694  
5e3dd157 Kalle Valo    2013-06-12  3695  	ath10k_core_unregister(ar);
5c771e74 Michal Kazior 2014-08-22  3696  	ath10k_pci_free_irq(ar);
403d627b Michal Kazior 2014-08-22  3697  	ath10k_pci_deinit_irq(ar);
90188f80 Raja Mani     2016-01-27  3698  	ath10k_pci_release_resource(ar);
77258d40 Michal Kazior 2015-05-18  3699  	ath10k_pci_sleep_sync(ar);
2986e3ef Michal Kazior 2014-08-07  3700  	ath10k_pci_release(ar);
5e3dd157 Kalle Valo    2013-06-12  3701  	ath10k_core_destroy(ar);
5e3dd157 Kalle Valo    2013-06-12  3702  }
5e3dd157 Kalle Valo    2013-06-12  3703  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
