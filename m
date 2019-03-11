Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3F7a-0005RS-VD
 for ath10k@lists.infradead.org; Mon, 11 Mar 2019 07:13:17 +0000
Date: Mon, 11 Mar 2019 10:11:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:ath11k-bringup 3/44]
 drivers/net/wireless/ath/ath11k/mac.c:2186 ath11k_set_key() warn: impossible
 condition '(arvif->def_wep_key_index == -1) => (0-255 == (-1))'
Message-ID: <20190311071150.GB2412@kadam>
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
To: kbuild@01.org, Kalle Valo <kvalo@codeaurora.org>
Cc: kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   e495d474d12aaf6e6288bf7cb3ba0eab4888f27f
commit: 258bbf525e652e244aa8b2331f55fda573fbe926 [3/44] ath11k: add driver

New smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:2186 ath11k_set_key() warn: impossible condition '(arvif->def_wep_key_index == -1) => (0-255 == (-1))'
drivers/net/wireless/ath/ath11k/mac.c:2304 ath11k_mac_set_peer_vht_fixed_rate() error: uninitialized symbol 'ar'.
drivers/net/wireless/ath/ath11k/mac.c:2390 ath11k_station_assoc() warn: always true condition '(arvif->def_wep_key_index != -1) => (0-255 != (-1))'
drivers/net/wireless/ath/ath11k/dp_tx.c:641 ath11k_dp_htt_srng_setup() warn: unsigned 'ring_entry_sz' is never less than zero.
drivers/net/wireless/ath/ath11k/dp_rx.c:278 ath11k_dp_rx_tid_del_func() error: not allocating enough data 36 vs 4
drivers/net/wireless/ath/ath11k/dp_rx.c:620 ath11k_dp_peer_rx_pn_replay_config() warn: inconsistent returns 'spin_lock:&ar->ab->data_lock'.
  Locked on:   line 571
  Unlocked on: line 620
drivers/net/wireless/ath/ath11k/dp_rx.c:620 ath11k_dp_peer_rx_pn_replay_config() warn: inconsistent returns 'spin_lock:&ab->data_lock'.
  Locked on:   line 620
  Unlocked on: line 571
drivers/net/wireless/ath/ath11k/dp_rx.c:976 ath11k_dp_htt_get_ppdu_desc() error: we previously assumed 'ppdu_info' could be null (see line 977)
drivers/net/wireless/ath/ath11k/ce.c:193 ath11k_ce_rx_post_pipe() error: we previously assumed 'pipe->dest_ring' could be null (see line 168)
drivers/net/wireless/ath/ath11k/debugfs_sta.c:170 ath11k_update_per_peer_stats_from_txcompl() error: uninitialized symbol 'rate_idx'.

Old smatch warnings:
drivers/net/wireless/ath/ath11k/dp_rx.c:2051 ath11k_dp_process_rx_err() warn: was && intended here instead of ||?

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=258bbf525e652e244aa8b2331f55fda573fbe926
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 258bbf525e652e244aa8b2331f55fda573fbe926
vim +2186 drivers/net/wireless/ath/ath11k/mac.c

258bbf52 Kalle Valo 2019-02-05  2128  
258bbf52 Kalle Valo 2019-02-05  2129  static int ath11k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
258bbf52 Kalle Valo 2019-02-05  2130  			  struct ieee80211_vif *vif, struct ieee80211_sta *sta,
258bbf52 Kalle Valo 2019-02-05  2131  			  struct ieee80211_key_conf *key)
258bbf52 Kalle Valo 2019-02-05  2132  {
258bbf52 Kalle Valo 2019-02-05  2133  	struct ath11k *ar = hw->priv;
258bbf52 Kalle Valo 2019-02-05  2134  	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
258bbf52 Kalle Valo 2019-02-05  2135  	struct ath11k_peer *peer;
258bbf52 Kalle Valo 2019-02-05  2136  	struct ath11k_sta *arsta;
258bbf52 Kalle Valo 2019-02-05  2137  	const u8 *peer_addr;
258bbf52 Kalle Valo 2019-02-05  2138  	bool is_wep = key->cipher == WLAN_CIPHER_SUITE_WEP40 ||
258bbf52 Kalle Valo 2019-02-05  2139  		key->cipher == WLAN_CIPHER_SUITE_WEP104;
258bbf52 Kalle Valo 2019-02-05  2140  	int ret = 0;
258bbf52 Kalle Valo 2019-02-05  2141  	u32 flags = 0;
258bbf52 Kalle Valo 2019-02-05  2142  
258bbf52 Kalle Valo 2019-02-05  2143  	if (key->keyidx > WMI_MAX_KEY_INDEX)
258bbf52 Kalle Valo 2019-02-05  2144  		return -ENOSPC;
258bbf52 Kalle Valo 2019-02-05  2145  
258bbf52 Kalle Valo 2019-02-05  2146  	mutex_lock(&ar->conf_mutex);
258bbf52 Kalle Valo 2019-02-05  2147  
258bbf52 Kalle Valo 2019-02-05  2148  	if (sta)
258bbf52 Kalle Valo 2019-02-05  2149  		peer_addr = sta->addr;
258bbf52 Kalle Valo 2019-02-05  2150  	else if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
258bbf52 Kalle Valo 2019-02-05  2151  		peer_addr = vif->bss_conf.bssid;
258bbf52 Kalle Valo 2019-02-05  2152  	else
258bbf52 Kalle Valo 2019-02-05  2153  		peer_addr = vif->addr;
258bbf52 Kalle Valo 2019-02-05  2154  
258bbf52 Kalle Valo 2019-02-05  2155  	key->hw_key_idx = key->keyidx;
258bbf52 Kalle Valo 2019-02-05  2156  
258bbf52 Kalle Valo 2019-02-05  2157  	/* the peer should not disappear in mid-way (unless FW goes awry) since
258bbf52 Kalle Valo 2019-02-05  2158  	 * we already hold conf_mutex. we just make sure its there now.
258bbf52 Kalle Valo 2019-02-05  2159  	 */
258bbf52 Kalle Valo 2019-02-05  2160  	spin_lock_bh(&ar->data_lock);
258bbf52 Kalle Valo 2019-02-05  2161  	peer = ath11k_peer_find(ar->ab, arvif->vdev_id, peer_addr);
258bbf52 Kalle Valo 2019-02-05  2162  	spin_unlock_bh(&ar->data_lock);
258bbf52 Kalle Valo 2019-02-05  2163  
258bbf52 Kalle Valo 2019-02-05  2164  	if (!peer) {
258bbf52 Kalle Valo 2019-02-05  2165  		if (cmd == SET_KEY) {
258bbf52 Kalle Valo 2019-02-05  2166  			ath11k_warn(ar->ab, "cannot install key for non-existent peer %pM\n",
258bbf52 Kalle Valo 2019-02-05  2167  				    peer_addr);
258bbf52 Kalle Valo 2019-02-05  2168  			ret = -EOPNOTSUPP;
258bbf52 Kalle Valo 2019-02-05  2169  			goto exit;
258bbf52 Kalle Valo 2019-02-05  2170  		} else {
258bbf52 Kalle Valo 2019-02-05  2171  			/* if the peer doesn't exist there is no key to disable
258bbf52 Kalle Valo 2019-02-05  2172  			 * anymore
258bbf52 Kalle Valo 2019-02-05  2173  			 */
258bbf52 Kalle Valo 2019-02-05  2174  			goto exit;
258bbf52 Kalle Valo 2019-02-05  2175  		}
258bbf52 Kalle Valo 2019-02-05  2176  	}
258bbf52 Kalle Valo 2019-02-05  2177  
258bbf52 Kalle Valo 2019-02-05  2178  	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
258bbf52 Kalle Valo 2019-02-05  2179  		flags |= WMI_KEY_PAIRWISE;
258bbf52 Kalle Valo 2019-02-05  2180  	else
258bbf52 Kalle Valo 2019-02-05  2181  		flags |= WMI_KEY_GROUP;
258bbf52 Kalle Valo 2019-02-05  2182  
258bbf52 Kalle Valo 2019-02-05  2183  	if (is_wep) {
258bbf52 Kalle Valo 2019-02-05  2184  		if (cmd == SET_KEY) {
258bbf52 Kalle Valo 2019-02-05  2185  			arvif->wep_keys[key->keyidx] = key;
258bbf52 Kalle Valo 2019-02-05 @2186  			if (arvif->def_wep_key_index == -1)
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

258bbf52 Kalle Valo 2019-02-05  2187  				flags |= WMI_KEY_TX_USAGE;
258bbf52 Kalle Valo 2019-02-05  2188  		} else {
258bbf52 Kalle Valo 2019-02-05  2189  			arvif->wep_keys[key->keyidx] = NULL;
258bbf52 Kalle Valo 2019-02-05  2190  			ath11k_clear_vdev_key(arvif, key);
258bbf52 Kalle Valo 2019-02-05  2191  		}
258bbf52 Kalle Valo 2019-02-05  2192  		/* TODO mcast fix(ath10k) for fw applicable? */
258bbf52 Kalle Valo 2019-02-05  2193  	}
258bbf52 Kalle Valo 2019-02-05  2194  
258bbf52 Kalle Valo 2019-02-05  2195  	ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
258bbf52 Kalle Valo 2019-02-05  2196  	if (ret) {
258bbf52 Kalle Valo 2019-02-05  2197  		ath11k_warn(ar->ab, "ath11k_install_key failed (%d)\n", ret);
258bbf52 Kalle Valo 2019-02-05  2198  		goto exit;
258bbf52 Kalle Valo 2019-02-05  2199  	}
258bbf52 Kalle Valo 2019-02-05  2200  
258bbf52 Kalle Valo 2019-02-05  2201  	ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
258bbf52 Kalle Valo 2019-02-05  2202  	if (ret) {
258bbf52 Kalle Valo 2019-02-05  2203  		/* No need to fail because we can still perform PN replay
258bbf52 Kalle Valo 2019-02-05  2204  		 * detection check in mac80211.
258bbf52 Kalle Valo 2019-02-05  2205  		 */
258bbf52 Kalle Valo 2019-02-05  2206  		ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
258bbf52 Kalle Valo 2019-02-05  2207  			   "failed to enable PN replay detection offload support %d\n",
258bbf52 Kalle Valo 2019-02-05  2208  			   ret);
258bbf52 Kalle Valo 2019-02-05  2209  	}
258bbf52 Kalle Valo 2019-02-05  2210  
258bbf52 Kalle Valo 2019-02-05  2211  	spin_lock_bh(&ar->data_lock);
258bbf52 Kalle Valo 2019-02-05  2212  	peer = ath11k_peer_find(ar->ab, arvif->vdev_id, peer_addr);
258bbf52 Kalle Valo 2019-02-05  2213  	if (peer && cmd == SET_KEY)
258bbf52 Kalle Valo 2019-02-05  2214  		peer->keys[key->keyidx] = key;
258bbf52 Kalle Valo 2019-02-05  2215  	else if (peer && cmd == DISABLE_KEY)
258bbf52 Kalle Valo 2019-02-05  2216  		peer->keys[key->keyidx] = NULL;
258bbf52 Kalle Valo 2019-02-05  2217  	else if (!peer)
258bbf52 Kalle Valo 2019-02-05  2218  		/* impossible unless FW goes crazy */
258bbf52 Kalle Valo 2019-02-05  2219  		ath11k_warn(ar->ab, "peer %pM disappeared!\n", peer_addr);
258bbf52 Kalle Valo 2019-02-05  2220  
258bbf52 Kalle Valo 2019-02-05  2221  	if (sta) {
258bbf52 Kalle Valo 2019-02-05  2222  		arsta = (struct ath11k_sta *)sta->drv_priv;
258bbf52 Kalle Valo 2019-02-05  2223  
258bbf52 Kalle Valo 2019-02-05  2224  		switch (key->cipher) {
258bbf52 Kalle Valo 2019-02-05  2225  		case WLAN_CIPHER_SUITE_TKIP:
258bbf52 Kalle Valo 2019-02-05  2226  		case WLAN_CIPHER_SUITE_CCMP:
258bbf52 Kalle Valo 2019-02-05  2227  		case WLAN_CIPHER_SUITE_CCMP_256:
258bbf52 Kalle Valo 2019-02-05  2228  		case WLAN_CIPHER_SUITE_GCMP:
258bbf52 Kalle Valo 2019-02-05  2229  		case WLAN_CIPHER_SUITE_GCMP_256:
258bbf52 Kalle Valo 2019-02-05  2230  			if (cmd == SET_KEY)
258bbf52 Kalle Valo 2019-02-05  2231  				arsta->pn_type = HAL_PN_TYPE_WPA;
258bbf52 Kalle Valo 2019-02-05  2232  			else
258bbf52 Kalle Valo 2019-02-05  2233  				arsta->pn_type = HAL_PN_TYPE_NONE;
258bbf52 Kalle Valo 2019-02-05  2234  			break;
258bbf52 Kalle Valo 2019-02-05  2235  		default:
258bbf52 Kalle Valo 2019-02-05  2236  			arsta->pn_type = HAL_PN_TYPE_NONE;
258bbf52 Kalle Valo 2019-02-05  2237  			break;
258bbf52 Kalle Valo 2019-02-05  2238  		}
258bbf52 Kalle Valo 2019-02-05  2239  	}
258bbf52 Kalle Valo 2019-02-05  2240  	spin_unlock_bh(&ar->data_lock);
258bbf52 Kalle Valo 2019-02-05  2241  
258bbf52 Kalle Valo 2019-02-05  2242  exit:
258bbf52 Kalle Valo 2019-02-05  2243  	mutex_unlock(&ar->conf_mutex);
258bbf52 Kalle Valo 2019-02-05  2244  	return ret;
258bbf52 Kalle Valo 2019-02-05  2245  }
258bbf52 Kalle Valo 2019-02-05  2246  
258bbf52 Kalle Valo 2019-02-05  2247  static void ath11k_set_default_unicast_key(struct ieee80211_hw *hw,
258bbf52 Kalle Valo 2019-02-05  2248  					   struct ieee80211_vif *vif,
258bbf52 Kalle Valo 2019-02-05  2249  					   int keyidx)
258bbf52 Kalle Valo 2019-02-05  2250  {
258bbf52 Kalle Valo 2019-02-05  2251  	struct ath11k *ar = hw->priv;
258bbf52 Kalle Valo 2019-02-05  2252  	struct ath11k_vif *arvif = (void *)vif->drv_priv;
258bbf52 Kalle Valo 2019-02-05  2253  	int ret;
258bbf52 Kalle Valo 2019-02-05  2254  
258bbf52 Kalle Valo 2019-02-05  2255  	mutex_lock(&arvif->ar->conf_mutex);
258bbf52 Kalle Valo 2019-02-05  2256  
258bbf52 Kalle Valo 2019-02-05  2257  	if (arvif->ar->state != ATH11K_STATE_ON)
258bbf52 Kalle Valo 2019-02-05  2258  		goto unlock;
258bbf52 Kalle Valo 2019-02-05  2259  
258bbf52 Kalle Valo 2019-02-05  2260  	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac vdev %d set keyidx %d\n",
258bbf52 Kalle Valo 2019-02-05  2261  		   arvif->vdev_id, keyidx);
258bbf52 Kalle Valo 2019-02-05  2262  
258bbf52 Kalle Valo 2019-02-05  2263  	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
258bbf52 Kalle Valo 2019-02-05  2264  					    WMI_VDEV_PARAM_DEF_KEYID, keyidx);
258bbf52 Kalle Valo 2019-02-05  2265  
258bbf52 Kalle Valo 2019-02-05  2266  	if (ret) {
258bbf52 Kalle Valo 2019-02-05  2267  		ath11k_warn(ar->ab, "failed to update wep key index for vdev %d: %d\n",
258bbf52 Kalle Valo 2019-02-05  2268  			    arvif->vdev_id,
258bbf52 Kalle Valo 2019-02-05  2269  			    ret);
258bbf52 Kalle Valo 2019-02-05  2270  		goto unlock;
258bbf52 Kalle Valo 2019-02-05  2271  	}
258bbf52 Kalle Valo 2019-02-05  2272  
258bbf52 Kalle Valo 2019-02-05  2273  	arvif->def_wep_key_index = keyidx;
258bbf52 Kalle Valo 2019-02-05  2274  
258bbf52 Kalle Valo 2019-02-05  2275  unlock:
258bbf52 Kalle Valo 2019-02-05  2276  	mutex_unlock(&arvif->ar->conf_mutex);
258bbf52 Kalle Valo 2019-02-05  2277  }
258bbf52 Kalle Valo 2019-02-05  2278  
258bbf52 Kalle Valo 2019-02-05  2279  static int
258bbf52 Kalle Valo 2019-02-05  2280  ath11k_mac_bitrate_mask_num_vht_rates(struct ath11k *ar,
258bbf52 Kalle Valo 2019-02-05  2281  				      enum nl80211_band band,
258bbf52 Kalle Valo 2019-02-05  2282  				      const struct cfg80211_bitrate_mask *mask)
258bbf52 Kalle Valo 2019-02-05  2283  {
258bbf52 Kalle Valo 2019-02-05  2284  	int num_rates = 0;
258bbf52 Kalle Valo 2019-02-05  2285  	int i;
258bbf52 Kalle Valo 2019-02-05  2286  
258bbf52 Kalle Valo 2019-02-05  2287  	for (i = 0; i < ARRAY_SIZE(mask->control[band].vht_mcs); i++)
258bbf52 Kalle Valo 2019-02-05  2288  		num_rates += hweight16(mask->control[band].vht_mcs[i]);
258bbf52 Kalle Valo 2019-02-05  2289  
258bbf52 Kalle Valo 2019-02-05  2290  	return num_rates;
258bbf52 Kalle Valo 2019-02-05  2291  }
258bbf52 Kalle Valo 2019-02-05  2292  
258bbf52 Kalle Valo 2019-02-05  2293  static void
258bbf52 Kalle Valo 2019-02-05  2294  ath11k_mac_set_peer_vht_fixed_rate(struct ath11k_vif *arvif,
258bbf52 Kalle Valo 2019-02-05  2295  				   struct ieee80211_sta *sta,
258bbf52 Kalle Valo 2019-02-05  2296  				   const struct cfg80211_bitrate_mask *mask,
258bbf52 Kalle Valo 2019-02-05  2297  				   enum nl80211_band band)
258bbf52 Kalle Valo 2019-02-05  2298  {
258bbf52 Kalle Valo 2019-02-05  2299  	struct ath11k *ar;
                                        ^^^^^^^^^^^^^^^^^
258bbf52 Kalle Valo 2019-02-05  2300  	u8 vht_rate, nss;
258bbf52 Kalle Valo 2019-02-05  2301  	u32 rate_code;
258bbf52 Kalle Valo 2019-02-05  2302  	int err, i;
258bbf52 Kalle Valo 2019-02-05  2303  
258bbf52 Kalle Valo 2019-02-05 @2304  	lockdep_assert_held(&ar->conf_mutex);
                                                            ^^^^^^^^^^^^^^^
258bbf52 Kalle Valo 2019-02-05  2305  
258bbf52 Kalle Valo 2019-02-05  2306  	nss = 0;
258bbf52 Kalle Valo 2019-02-05  2307  	ar = arvif->ar;
258bbf52 Kalle Valo 2019-02-05  2308  
258bbf52 Kalle Valo 2019-02-05  2309  	for (i = 0; i < ARRAY_SIZE(mask->control[band].vht_mcs); i++) {
258bbf52 Kalle Valo 2019-02-05  2310  		if (hweight16(mask->control[band].vht_mcs[i]) == 1) {
258bbf52 Kalle Valo 2019-02-05  2311  			nss = i + 1;
258bbf52 Kalle Valo 2019-02-05  2312  			vht_rate = ffs(mask->control[band].vht_mcs[i]) - 1;
258bbf52 Kalle Valo 2019-02-05  2313  		}
258bbf52 Kalle Valo 2019-02-05  2314  	}
258bbf52 Kalle Valo 2019-02-05  2315  
258bbf52 Kalle Valo 2019-02-05  2316  	if (!nss) {
258bbf52 Kalle Valo 2019-02-05  2317  		ath11k_warn(ar->ab, "No single VHT Fixed rate found to set for %pM",
258bbf52 Kalle Valo 2019-02-05  2318  			    sta->addr);
258bbf52 Kalle Valo 2019-02-05  2319  		return;
258bbf52 Kalle Valo 2019-02-05  2320  	}
258bbf52 Kalle Valo 2019-02-05  2321  
258bbf52 Kalle Valo 2019-02-05  2322  	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
258bbf52 Kalle Valo 2019-02-05  2323  		   "Setting Fixed VHT Rate for peer %pM. Device will not switch to any other selected rates",
258bbf52 Kalle Valo 2019-02-05  2324  		   sta->addr);
258bbf52 Kalle Valo 2019-02-05  2325  
258bbf52 Kalle Valo 2019-02-05  2326  	rate_code = ATH11K_HW_RATE_CODE(vht_rate, nss,
258bbf52 Kalle Valo 2019-02-05  2327  					WMI_RATE_PREAMBLE_VHT);
258bbf52 Kalle Valo 2019-02-05  2328  	err = ath11k_wmi_set_peer_param(ar, sta->addr,
258bbf52 Kalle Valo 2019-02-05  2329  					arvif->vdev_id,
258bbf52 Kalle Valo 2019-02-05  2330  					WMI_PEER_PARAM_FIXED_RATE,
258bbf52 Kalle Valo 2019-02-05  2331  					rate_code);
258bbf52 Kalle Valo 2019-02-05  2332  	if (err)
258bbf52 Kalle Valo 2019-02-05  2333  		ath11k_warn(ar->ab,
258bbf52 Kalle Valo 2019-02-05  2334  			    "failed to update STA %pM Fixed Rate %d: %d\n",
258bbf52 Kalle Valo 2019-02-05  2335  			     sta->addr, rate_code, err);
258bbf52 Kalle Valo 2019-02-05  2336  }
258bbf52 Kalle Valo 2019-02-05  2337  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
