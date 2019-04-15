Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFvjQ-0005P9-FI
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 07:08:46 +0000
Date: Mon, 15 Apr 2019 10:07:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:ath11k-bringup 66/93]
 drivers/net/wireless/ath/ath11k/core.c:755 ath11k_core_restart() warn:
 inconsistent returns 'mutex:&sc->core_lock'.
Message-ID: <20190415070753.GK31633@kadam>
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
To: kbuild@01.org, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
commit: 3a7b4838b6f6f234239f263ef3dc02e612a083ad [66/93] ath11k: Add support for subsystem recovery
:::::: branch date: 4 days ago
:::::: commit date: 12 days ago

New smatch warnings:
drivers/net/wireless/ath/ath11k/core.c:755 ath11k_core_restart() warn: inconsistent returns 'mutex:&sc->core_lock'.
  Locked on:   line 722
  Unlocked on: line 755

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=3a7b4838b6f6f234239f263ef3dc02e612a083ad
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 3a7b4838b6f6f234239f263ef3dc02e612a083ad
vim +755 drivers/net/wireless/ath/ath11k/core.c

3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  683  static void ath11k_core_restart(struct work_struct *work)
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  684  {
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  685  	struct ath11k_base *sc = container_of(work, struct ath11k_base, restart_work);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  686  	struct ath11k *ar;
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  687  	struct ath11k_pdev *pdev;
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  688  	int i, ret = 0;
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  689  
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  690  	spin_lock_bh(&sc->data_lock);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  691  	sc->stats.fw_crash_counter++;
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  692  	spin_unlock_bh(&sc->data_lock);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  693  
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  694  	for (i = 0; i < sc->num_radios; i++) {
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  695  		pdev = &sc->pdevs[i];
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  696  		ar = pdev->ar;
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  697  		if (!ar || ar->state == ATH11K_STATE_OFF)
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  698  			continue;
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  699  
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  700  		ieee80211_stop_queues(ar->hw);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  701  		ath11k_drain_tx(ar);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  702  		complete(&ar->scan.started);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  703  		complete(&ar->scan.completed);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  704  		complete(&ar->peer_assoc_done);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  705  		complete(&ar->install_key_done);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  706  		complete(&ar->vdev_setup_done);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  707  		complete(&ar->bss_survey_done);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  708  
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  709  		wake_up(&ar->dp.tx_empty_waitq);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  710  		idr_for_each(&ar->txmgmt_idr,
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  711  			     ath11k_mac_tx_mgmt_pending_free, ar);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  712  		idr_destroy(&ar->txmgmt_idr);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  713  	}
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  714  
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  715  	wake_up(&sc->wmi_sc.tx_credits_wq);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  716  	wake_up(&sc->peer_mapping_wq);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  717  
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  718  	mutex_lock(&sc->core_lock);
                                                                   ^^^^^^^^^^^^^^

3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  719  	ret = ath11k_core_reconfigure_on_crash(sc);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  720  	if (ret) {
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  721  		ath11k_err(sc, "failed to reconfigure driver on crash recovery\n");
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  722  		return;
                                                                ^^^^^^^
Need to unlock.

3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  723  	}
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  724  	mutex_unlock(&sc->core_lock);
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  725  
3a7b4838 Pradeep Kumar Chitrapu 2019-03-21  726  	for (i = 0; i < sc->num_radios; i++) {

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
