Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBcff-0000ne-Av
 for ath10k@lists.infradead.org; Tue, 10 Mar 2020 11:03:37 +0000
Date: Tue, 10 Mar 2020 14:03:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:pending 32/34] drivers/net/wireless/ath/ath11k/mac.c:2431
 ath11k_mac_op_set_key() error: we previously assumed 'peer' could be null
 (see line 2406)
Message-ID: <20200310110313.GC11561@kadam>
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
To: kbuild@lists.01.org, Sriram R <srirrama@codeaurora.org>
Cc: Tamizh Chelvam Raja <tamizhr@codeaurora.org>, kbuild-all@lists.01.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   8098994ce0e3684547d874966af5d4c27c11f855
commit: a0ad1ebe9632f7077f8a827ea23fa1508383c6b0 [32/34] ath11k: Perform per-msdu rx processing

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:2431 ath11k_mac_op_set_key() error: we previously assumed 'peer' could be null (see line 2406)

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=a0ad1ebe9632f7077f8a827ea23fa1508383c6b0
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout a0ad1ebe9632f7077f8a827ea23fa1508383c6b0
vim +/peer +2431 drivers/net/wireless/ath/ath11k/mac.c

5c65159f28953 Kalle Valo           2019-11-23  2320  static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
d5c65159f28953 Kalle Valo           2019-11-23  2321  				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
d5c65159f28953 Kalle Valo           2019-11-23  2322  				 struct ieee80211_key_conf *key)
d5c65159f28953 Kalle Valo           2019-11-23  2323  {
d5c65159f28953 Kalle Valo           2019-11-23  2324  	struct ath11k *ar = hw->priv;
d5c65159f28953 Kalle Valo           2019-11-23  2325  	struct ath11k_base *ab = ar->ab;
d5c65159f28953 Kalle Valo           2019-11-23  2326  	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
d5c65159f28953 Kalle Valo           2019-11-23  2327  	struct ath11k_peer *peer;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2328  	struct ath11k_sta *arsta;
d5c65159f28953 Kalle Valo           2019-11-23  2329  	const u8 *peer_addr;
d5c65159f28953 Kalle Valo           2019-11-23  2330  	int ret = 0;
d5c65159f28953 Kalle Valo           2019-11-23  2331  	u32 flags = 0;
d5c65159f28953 Kalle Valo           2019-11-23  2332  
d5c65159f28953 Kalle Valo           2019-11-23  2333  	/* BIP needs to be done in software */
d5c65159f28953 Kalle Valo           2019-11-23  2334  	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
d5c65159f28953 Kalle Valo           2019-11-23  2335  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
d5c65159f28953 Kalle Valo           2019-11-23  2336  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
d5c65159f28953 Kalle Valo           2019-11-23  2337  	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
d5c65159f28953 Kalle Valo           2019-11-23  2338  		return 1;
d5c65159f28953 Kalle Valo           2019-11-23  2339  
d5c65159f28953 Kalle Valo           2019-11-23  2340  	if (key->keyidx > WMI_MAX_KEY_INDEX)
d5c65159f28953 Kalle Valo           2019-11-23  2341  		return -ENOSPC;
d5c65159f28953 Kalle Valo           2019-11-23  2342  
d5c65159f28953 Kalle Valo           2019-11-23  2343  	mutex_lock(&ar->conf_mutex);
d5c65159f28953 Kalle Valo           2019-11-23  2344  
d5c65159f28953 Kalle Valo           2019-11-23  2345  	if (sta)
d5c65159f28953 Kalle Valo           2019-11-23  2346  		peer_addr = sta->addr;
d5c65159f28953 Kalle Valo           2019-11-23  2347  	else if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
d5c65159f28953 Kalle Valo           2019-11-23  2348  		peer_addr = vif->bss_conf.bssid;
d5c65159f28953 Kalle Valo           2019-11-23  2349  	else
d5c65159f28953 Kalle Valo           2019-11-23  2350  		peer_addr = vif->addr;
d5c65159f28953 Kalle Valo           2019-11-23  2351  
d5c65159f28953 Kalle Valo           2019-11-23  2352  	key->hw_key_idx = key->keyidx;
d5c65159f28953 Kalle Valo           2019-11-23  2353  
d5c65159f28953 Kalle Valo           2019-11-23  2354  	/* the peer should not disappear in mid-way (unless FW goes awry) since
d5c65159f28953 Kalle Valo           2019-11-23  2355  	 * we already hold conf_mutex. we just make sure its there now.
d5c65159f28953 Kalle Valo           2019-11-23  2356  	 */
d5c65159f28953 Kalle Valo           2019-11-23  2357  	spin_lock_bh(&ab->base_lock);
d5c65159f28953 Kalle Valo           2019-11-23  2358  	peer = ath11k_peer_find(ab, arvif->vdev_id, peer_addr);
d5c65159f28953 Kalle Valo           2019-11-23  2359  	spin_unlock_bh(&ab->base_lock);
d5c65159f28953 Kalle Valo           2019-11-23  2360  
d5c65159f28953 Kalle Valo           2019-11-23  2361  	if (!peer) {
d5c65159f28953 Kalle Valo           2019-11-23  2362  		if (cmd == SET_KEY) {
d5c65159f28953 Kalle Valo           2019-11-23  2363  			ath11k_warn(ab, "cannot install key for non-existent peer %pM\n",
d5c65159f28953 Kalle Valo           2019-11-23  2364  				    peer_addr);
d5c65159f28953 Kalle Valo           2019-11-23  2365  			ret = -EOPNOTSUPP;
d5c65159f28953 Kalle Valo           2019-11-23  2366  			goto exit;
d5c65159f28953 Kalle Valo           2019-11-23  2367  		} else {
d5c65159f28953 Kalle Valo           2019-11-23  2368  			/* if the peer doesn't exist there is no key to disable
d5c65159f28953 Kalle Valo           2019-11-23  2369  			 * anymore
d5c65159f28953 Kalle Valo           2019-11-23  2370  			 */
d5c65159f28953 Kalle Valo           2019-11-23  2371  			goto exit;
d5c65159f28953 Kalle Valo           2019-11-23  2372  		}
d5c65159f28953 Kalle Valo           2019-11-23  2373  	}
d5c65159f28953 Kalle Valo           2019-11-23  2374  
d5c65159f28953 Kalle Valo           2019-11-23  2375  	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
d5c65159f28953 Kalle Valo           2019-11-23  2376  		flags |= WMI_KEY_PAIRWISE;
d5c65159f28953 Kalle Valo           2019-11-23  2377  	else
d5c65159f28953 Kalle Valo           2019-11-23  2378  		flags |= WMI_KEY_GROUP;
d5c65159f28953 Kalle Valo           2019-11-23  2379  
d5c65159f28953 Kalle Valo           2019-11-23  2380  	ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
d5c65159f28953 Kalle Valo           2019-11-23  2381  	if (ret) {
d5c65159f28953 Kalle Valo           2019-11-23  2382  		ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
d5c65159f28953 Kalle Valo           2019-11-23  2383  		goto exit;
d5c65159f28953 Kalle Valo           2019-11-23  2384  	}
d5c65159f28953 Kalle Valo           2019-11-23  2385  
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2386  	ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2387  	if (ret) {
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2388  		ath11k_warn(ab, "failed to offload PN replay detection %d\n", ret);
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2389  		goto exit;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2390  	}
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2391  
d5c65159f28953 Kalle Valo           2019-11-23  2392  	spin_lock_bh(&ab->base_lock);
d5c65159f28953 Kalle Valo           2019-11-23  2393  	peer = ath11k_peer_find(ab, arvif->vdev_id, peer_addr);
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2394  	if (peer && cmd == SET_KEY) {
d5c65159f28953 Kalle Valo           2019-11-23  2395  		peer->keys[key->keyidx] = key;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2396  		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2397  			peer->ucast_keyidx = key->keyidx;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2398  		else
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2399  			peer->mcast_keyidx = key->keyidx;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2400  	} else if (peer && cmd == DISABLE_KEY) {
d5c65159f28953 Kalle Valo           2019-11-23  2401  		peer->keys[key->keyidx] = NULL;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2402  		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2403  			peer->ucast_keyidx = 0;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2404  		else
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2405  			peer->mcast_keyidx = 0;
481e5890884c05 Manikanta Pubbisetty 2020-02-14 @2406  	} else if (!peer)
d5c65159f28953 Kalle Valo           2019-11-23  2407  		/* impossible unless FW goes crazy */
d5c65159f28953 Kalle Valo           2019-11-23  2408  		ath11k_warn(ab, "peer %pM disappeared!\n", peer_addr);

return?

4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2409  
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2410  	if (sta) {
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2411  		arsta = (struct ath11k_sta *)sta->drv_priv;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2412  
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2413  		switch (key->cipher) {
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2414  		case WLAN_CIPHER_SUITE_TKIP:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2415  		case WLAN_CIPHER_SUITE_CCMP:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2416  		case WLAN_CIPHER_SUITE_CCMP_256:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2417  		case WLAN_CIPHER_SUITE_GCMP:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2418  		case WLAN_CIPHER_SUITE_GCMP_256:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2419  			if (cmd == SET_KEY)
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2420  				arsta->pn_type = HAL_PN_TYPE_WPA;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2421  			else
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2422  				arsta->pn_type = HAL_PN_TYPE_NONE;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2423  			break;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2424  		default:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2425  			arsta->pn_type = HAL_PN_TYPE_NONE;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2426  			break;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2427  		}
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2428  	}
a0ad1ebe9632f7 Sriram R             2020-02-17  2429  
a0ad1ebe9632f7 Sriram R             2020-02-17  2430  	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
a0ad1ebe9632f7 Sriram R             2020-02-17 @2431  		peer->sec_type = ath11k_dp_tx_get_encrypt_type(key->cipher);
                                                                ^^^^^^^^^^^^^^

a0ad1ebe9632f7 Sriram R             2020-02-17  2432  	else
a0ad1ebe9632f7 Sriram R             2020-02-17  2433  		peer->sec_type_grp = ath11k_dp_tx_get_encrypt_type(key->cipher);
a0ad1ebe9632f7 Sriram R             2020-02-17  2434  
d5c65159f28953 Kalle Valo           2019-11-23  2435  	spin_unlock_bh(&ab->base_lock);
d5c65159f28953 Kalle Valo           2019-11-23  2436  
d5c65159f28953 Kalle Valo           2019-11-23  2437  exit:
d5c65159f28953 Kalle Valo           2019-11-23  2438  	mutex_unlock(&ar->conf_mutex);
d5c65159f28953 Kalle Valo           2019-11-23  2439  	return ret;
d5c65159f28953 Kalle Valo           2019-11-23  2440  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
