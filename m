Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guk9X-0002pL-G6
 for ath10k@lists.infradead.org; Fri, 15 Feb 2019 20:32:10 +0000
Date: Fri, 15 Feb 2019 21:19:06 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: [ath6kl:pending 31/37] drivers/net/wireless/ath/ath10k/mac.c:5516:3-9:
 preceding lock on line 5476 (fwd)
Message-ID: <alpine.DEB.2.21.1902152118100.2572@hadrien>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-223285465-1550261946=:2572"
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, kbuild-all@01.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-223285465-1550261946=:2572
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

It looks like a mutex_unlock(&ar->conf_mutex); may be needed before ilne
5516.

julia

---------- Forwarded message ----------
Date: Sat, 16 Feb 2019 04:08:51 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: [ath6kl:pending 31/37] drivers/net/wireless/ath/ath10k/mac.c:5516:3-9:
    preceding lock on line 5476

CC: kbuild-all@01.org
CC: ath10k@lists.infradead.org
TO: Rakesh Pillai <pillair@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   7ff96b1d00528bf0492cfb5fefbaa7c34b0425e9
commit: 3644c844ef3e956164213b145d8ef49691b700ac [31/37] ath10k: wait for vdev delete response from firmware
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago

>> drivers/net/wireless/ath/ath10k/mac.c:5516:3-9: preceding lock on line 5476

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=3644c844ef3e956164213b145d8ef49691b700ac
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 3644c844ef3e956164213b145d8ef49691b700ac
vim +5516 drivers/net/wireless/ath/ath10k/mac.c

b4aa539dd Michal Kazior             2015-03-31  5462
5e3dd157d Kalle Valo                2013-06-12  5463  static void ath10k_remove_interface(struct ieee80211_hw *hw,
5e3dd157d Kalle Valo                2013-06-12  5464  				    struct ieee80211_vif *vif)
5e3dd157d Kalle Valo                2013-06-12  5465  {
5e3dd157d Kalle Valo                2013-06-12  5466  	struct ath10k *ar = hw->priv;
56ac13bfc Amadeusz Sławiński        2017-02-13  5467  	struct ath10k_vif *arvif = (void *)vif->drv_priv;
6942726f7 Michal Kazior             2016-03-06  5468  	struct ath10k_peer *peer;
3644c844e Rakesh Pillai             2019-02-15  5469  	unsigned long time_left;
5e3dd157d Kalle Valo                2013-06-12  5470  	int ret;
6942726f7 Michal Kazior             2016-03-06  5471  	int i;
5e3dd157d Kalle Valo                2013-06-12  5472
81a9a17db Michal Kazior             2015-03-05  5473  	cancel_work_sync(&arvif->ap_csa_work);
cc9904e69 Michal Kazior             2015-03-10  5474  	cancel_delayed_work_sync(&arvif->connection_loss_work);
81a9a17db Michal Kazior             2015-03-05  5475
5d011f5c1 Sujith Manoharan          2014-11-25 @5476  	mutex_lock(&ar->conf_mutex);
5d011f5c1 Sujith Manoharan          2014-11-25  5477
ed54388a3 Michal Kazior             2013-09-13  5478  	spin_lock_bh(&ar->data_lock);
64badcb6d Michal Kazior             2014-09-18  5479  	ath10k_mac_vif_beacon_cleanup(arvif);
ed54388a3 Michal Kazior             2013-09-13  5480  	spin_unlock_bh(&ar->data_lock);
ed54388a3 Michal Kazior             2013-09-13  5481
855aed122 Simon Wunderlich          2014-08-02  5482  	ret = ath10k_spectral_vif_stop(arvif);
855aed122 Simon Wunderlich          2014-08-02  5483  	if (ret)
7aa7a72a2 Michal Kazior             2014-08-25  5484  		ath10k_warn(ar, "failed to stop spectral for vdev %i: %d\n",
855aed122 Simon Wunderlich          2014-08-02  5485  			    arvif->vdev_id, ret);
855aed122 Simon Wunderlich          2014-08-02  5486
16c111767 Ben Greear                2014-09-23  5487  	ar->free_vdev_map |= 1LL << arvif->vdev_id;
ebaa4b162 Vasanthakumar Thiagarajan 2016-10-10  5488  	spin_lock_bh(&ar->data_lock);
0579119f7 Michal Kazior             2013-10-16  5489  	list_del(&arvif->list);
ebaa4b162 Vasanthakumar Thiagarajan 2016-10-10  5490  	spin_unlock_bh(&ar->data_lock);
5e3dd157d Kalle Valo                2013-06-12  5491
e57e05716 Michal Kazior             2015-03-24  5492  	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
e57e05716 Michal Kazior             2015-03-24  5493  	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
2c512059b Michal Kazior             2015-02-15  5494  		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
2c512059b Michal Kazior             2015-02-15  5495  					     vif->addr);
5e3dd157d Kalle Valo                2013-06-12  5496  		if (ret)
e57e05716 Michal Kazior             2015-03-24  5497  			ath10k_warn(ar, "failed to submit AP/IBSS self-peer removal on vdev %i: %d\n",
69244e565 Ben Greear                2014-02-27  5498  				    arvif->vdev_id, ret);
5e3dd157d Kalle Valo                2013-06-12  5499
5e3dd157d Kalle Valo                2013-06-12  5500  		kfree(arvif->u.ap.noa_data);
5e3dd157d Kalle Valo                2013-06-12  5501  	}
5e3dd157d Kalle Valo                2013-06-12  5502
7aa7a72a2 Michal Kazior             2014-08-25  5503  	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev %i delete (remove interface)\n",
60c3daa88 Kalle Valo                2013-09-08  5504  		   arvif->vdev_id);
60c3daa88 Kalle Valo                2013-09-08  5505
5e3dd157d Kalle Valo                2013-06-12  5506  	ret = ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
5e3dd157d Kalle Valo                2013-06-12  5507  	if (ret)
7aa7a72a2 Michal Kazior             2014-08-25  5508  		ath10k_warn(ar, "failed to delete WMI vdev %i: %d\n",
69244e565 Ben Greear                2014-02-27  5509  			    arvif->vdev_id, ret);
5e3dd157d Kalle Valo                2013-06-12  5510
3644c844e Rakesh Pillai             2019-02-15  5511  	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map)) {
3644c844e Rakesh Pillai             2019-02-15  5512  		time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
3644c844e Rakesh Pillai             2019-02-15  5513  							ATH10K_VDEV_DELETE_TIMEOUT_HZ);
3644c844e Rakesh Pillai             2019-02-15  5514  		if (time_left == 0) {
3644c844e Rakesh Pillai             2019-02-15  5515  			ath10k_warn(ar, "Timeout in receiving vdev delete response\n");
3644c844e Rakesh Pillai             2019-02-15 @5516  			return;
3644c844e Rakesh Pillai             2019-02-15  5517  		}
3644c844e Rakesh Pillai             2019-02-15  5518  	}
3644c844e Rakesh Pillai             2019-02-15  5519
2c512059b Michal Kazior             2015-02-15  5520  	/* Some firmware revisions don't notify host about self-peer removal
2c512059b Michal Kazior             2015-02-15  5521  	 * until after associated vdev is deleted.
2c512059b Michal Kazior             2015-02-15  5522  	 */
e57e05716 Michal Kazior             2015-03-24  5523  	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
e57e05716 Michal Kazior             2015-03-24  5524  	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
2c512059b Michal Kazior             2015-02-15  5525  		ret = ath10k_wait_for_peer_deleted(ar, arvif->vdev_id,
2c512059b Michal Kazior             2015-02-15  5526  						   vif->addr);
2c512059b Michal Kazior             2015-02-15  5527  		if (ret)
2c512059b Michal Kazior             2015-02-15  5528  			ath10k_warn(ar, "failed to remove AP self-peer on vdev %i: %d\n",
2c512059b Michal Kazior             2015-02-15  5529  				    arvif->vdev_id, ret);
2c512059b Michal Kazior             2015-02-15  5530
2c512059b Michal Kazior             2015-02-15  5531  		spin_lock_bh(&ar->data_lock);
2c512059b Michal Kazior             2015-02-15  5532  		ar->num_peers--;
2c512059b Michal Kazior             2015-02-15  5533  		spin_unlock_bh(&ar->data_lock);
2c512059b Michal Kazior             2015-02-15  5534  	}
2c512059b Michal Kazior             2015-02-15  5535
6942726f7 Michal Kazior             2016-03-06  5536  	spin_lock_bh(&ar->data_lock);
6942726f7 Michal Kazior             2016-03-06  5537  	for (i = 0; i < ARRAY_SIZE(ar->peer_map); i++) {
6942726f7 Michal Kazior             2016-03-06  5538  		peer = ar->peer_map[i];
6942726f7 Michal Kazior             2016-03-06  5539  		if (!peer)
6942726f7 Michal Kazior             2016-03-06  5540  			continue;
6942726f7 Michal Kazior             2016-03-06  5541
6942726f7 Michal Kazior             2016-03-06  5542  		if (peer->vif == vif) {
6942726f7 Michal Kazior             2016-03-06  5543  			ath10k_warn(ar, "found vif peer %pM entry on vdev %i after it was supposedly removed\n",
6942726f7 Michal Kazior             2016-03-06  5544  				    vif->addr, arvif->vdev_id);
6942726f7 Michal Kazior             2016-03-06  5545  			peer->vif = NULL;
6942726f7 Michal Kazior             2016-03-06  5546  		}
6942726f7 Michal Kazior             2016-03-06  5547  	}
6942726f7 Michal Kazior             2016-03-06  5548  	spin_unlock_bh(&ar->data_lock);
6942726f7 Michal Kazior             2016-03-06  5549
5e3dd157d Kalle Valo                2013-06-12  5550  	ath10k_peer_cleanup(ar, arvif->vdev_id);
dd4717b6f Michal Kazior             2016-03-06  5551  	ath10k_mac_txq_unref(ar, vif->txq);
5e3dd157d Kalle Valo                2013-06-12  5552
500ff9f93 Michal Kazior             2015-03-31  5553  	if (vif->type == NL80211_IFTYPE_MONITOR) {
500ff9f93 Michal Kazior             2015-03-31  5554  		ar->monitor_arvif = NULL;
500ff9f93 Michal Kazior             2015-03-31  5555  		ret = ath10k_monitor_recalc(ar);
500ff9f93 Michal Kazior             2015-03-31  5556  		if (ret)
500ff9f93 Michal Kazior             2015-03-31  5557  			ath10k_warn(ar, "failed to recalc monitor: %d\n", ret);
500ff9f93 Michal Kazior             2015-03-31  5558  	}
500ff9f93 Michal Kazior             2015-03-31  5559
d679fa1b3 Ryan Hsu                  2016-12-22  5560  	ret = ath10k_mac_txpower_recalc(ar);
d679fa1b3 Ryan Hsu                  2016-12-22  5561  	if (ret)
d679fa1b3 Ryan Hsu                  2016-12-22  5562  		ath10k_warn(ar, "failed to recalc tx power: %d\n", ret);
d679fa1b3 Ryan Hsu                  2016-12-22  5563
b4aa539dd Michal Kazior             2015-03-31  5564  	spin_lock_bh(&ar->htt.tx_lock);
b4aa539dd Michal Kazior             2015-03-31  5565  	ath10k_mac_vif_tx_unlock_all(arvif);
b4aa539dd Michal Kazior             2015-03-31  5566  	spin_unlock_bh(&ar->htt.tx_lock);
b4aa539dd Michal Kazior             2015-03-31  5567
299468782 Michal Kazior             2016-03-06  5568  	ath10k_mac_txq_unref(ar, vif->txq);
299468782 Michal Kazior             2016-03-06  5569
5e3dd157d Kalle Valo                2013-06-12  5570  	mutex_unlock(&ar->conf_mutex);
5e3dd157d Kalle Valo                2013-06-12  5571  }
5e3dd157d Kalle Valo                2013-06-12  5572

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--8323329-223285465-1550261946=:2572
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--8323329-223285465-1550261946=:2572--
