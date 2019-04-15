Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFwhg-00043X-2B
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 08:11:01 +0000
Date: Mon, 15 Apr 2019 11:10:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:ath11k-bringup 89/93]
 drivers/net/wireless/ath/ath11k/core.c:621 ath11k_qmi_firmware_indication()
 warn: inconsistent returns 'mutex:&ab->core_lock'.
Message-ID: <20190415081003.GL31633@kadam>
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
To: kbuild@01.org, Anilkumar Kolli <akolli@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
commit: 426598fdbef82ace7b4a728445f61ecf034f233c [89/93] ath11k: add qmi API support and rproc_boot for Q6

New smatch warnings:
drivers/net/wireless/ath/ath11k/core.c:621 ath11k_qmi_firmware_indication() warn: inconsistent returns 'mutex:&ab->core_lock'.
  Locked on:   line 621
  Unlocked on: line 591
  Locked on:   line 714
  Unlocked on: line 747

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=426598fdbef82ace7b4a728445f61ecf034f233c
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 426598fdbef82ace7b4a728445f61ecf034f233c
vim +621 drivers/net/wireless/ath/ath11k/core.c

426598fd Anilkumar Kolli 2019-04-04  584  int ath11k_qmi_firmware_indication(struct ath11k_base *ab)
426598fd Anilkumar Kolli 2019-04-04  585  {
426598fd Anilkumar Kolli 2019-04-04  586  	int ret;
426598fd Anilkumar Kolli 2019-04-04  587  
426598fd Anilkumar Kolli 2019-04-04  588  	ret = ath11k_ce_init_pipes(ab);
426598fd Anilkumar Kolli 2019-04-04  589  	if (ret) {
426598fd Anilkumar Kolli 2019-04-04  590  		ath11k_err(ab, "failed to initialize CE: %d\n", ret);
426598fd Anilkumar Kolli 2019-04-04  591  		return ret;
426598fd Anilkumar Kolli 2019-04-04  592  	}
426598fd Anilkumar Kolli 2019-04-04  593  
426598fd Anilkumar Kolli 2019-04-04  594  	ret = ath11k_dp_alloc(ab);
426598fd Anilkumar Kolli 2019-04-04  595  	if (ret) {
426598fd Anilkumar Kolli 2019-04-04  596  		ath11k_err(ab, "failed to init DP: %d\n", ret);
426598fd Anilkumar Kolli 2019-04-04  597  		return ret;
426598fd Anilkumar Kolli 2019-04-04  598  	}
426598fd Anilkumar Kolli 2019-04-04  599  
426598fd Anilkumar Kolli 2019-04-04  600  	mutex_lock(&ab->core_lock);
                                                           ^^^^^^^^^^^^^^

The static checker doesn't complain but is this a double lock actually?
It looks like we took the lock eaerlier in ath11k_core_restart().  This
is restart code so it's probably hard to test.

426598fd Anilkumar Kolli 2019-04-04  601  	ret = ath11k_core_start(ab, ATH11K_FIRMWARE_MODE_NORMAL);
426598fd Anilkumar Kolli 2019-04-04  602  	if (ret) {
426598fd Anilkumar Kolli 2019-04-04  603  		ath11k_err(ab, "failed to start core: %d\n", ret);
426598fd Anilkumar Kolli 2019-04-04  604  		goto err_dp_free;
                                                        ^^^^^^^^^^^^^^^^
426598fd Anilkumar Kolli 2019-04-04  605  	}
426598fd Anilkumar Kolli 2019-04-04  606  
426598fd Anilkumar Kolli 2019-04-04  607  	ret = ath11k_core_pdev_create(ab);
426598fd Anilkumar Kolli 2019-04-04  608  	if (ret) {
426598fd Anilkumar Kolli 2019-04-04  609  		ath11k_err(ab, "failed to create pdev core: %d\n", ret);
426598fd Anilkumar Kolli 2019-04-04  610  		goto err_core_stop;
426598fd Anilkumar Kolli 2019-04-04  611  	}
426598fd Anilkumar Kolli 2019-04-04  612  	ath11k_ahb_ext_irq_enable(ab);
426598fd Anilkumar Kolli 2019-04-04  613  	mutex_unlock(&ab->core_lock);
426598fd Anilkumar Kolli 2019-04-04  614  
426598fd Anilkumar Kolli 2019-04-04  615  	return 0;
426598fd Anilkumar Kolli 2019-04-04  616  
426598fd Anilkumar Kolli 2019-04-04  617  err_core_stop:
426598fd Anilkumar Kolli 2019-04-04  618  	ath11k_core_stop(ab);
426598fd Anilkumar Kolli 2019-04-04  619  err_dp_free:
426598fd Anilkumar Kolli 2019-04-04  620  	ath11k_dp_free(ab);
426598fd Anilkumar Kolli 2019-04-04 @621  	return ret;
426598fd Anilkumar Kolli 2019-04-04  622  }

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
