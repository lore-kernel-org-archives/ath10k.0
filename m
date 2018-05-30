Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNxwA-0000PB-BJ
 for ath10k@lists.infradead.org; Wed, 30 May 2018 10:02:36 +0000
Date: Wed, 30 May 2018 13:02:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:pending 88/88] drivers/net/wireless/ath/wcn36xx/main.c:554
 wcn36xx_set_key() error: we previously assumed 'sta' could be null (see line
 496)
Message-ID: <20180530100205.q4y6wkonr7cqb4tv@mwanda>
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
To: kbuild@01.org, Loic Poulain <loic.poulain@linaro.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   cc31b4934693c223de25dc0cec69c1a2bd9e1650
commit: cc31b4934693c223de25dc0cec69c1a2bd9e1650 [88/88] wcn36xx: Fix WEP encryption

smatch warnings:
drivers/net/wireless/ath/wcn36xx/main.c:554 wcn36xx_set_key() error: we previously assumed 'sta' could be null (see line 496)

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=cc31b4934693c223de25dc0cec69c1a2bd9e1650
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout cc31b4934693c223de25dc0cec69c1a2bd9e1650
vim +/sta +554 drivers/net/wireless/ath/wcn36xx/main.c

8e84c258 Eugene Krasnikov 2013-10-08  488  
8e84c258 Eugene Krasnikov 2013-10-08  489  static int wcn36xx_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
8e84c258 Eugene Krasnikov 2013-10-08  490  			   struct ieee80211_vif *vif,
8e84c258 Eugene Krasnikov 2013-10-08  491  			   struct ieee80211_sta *sta,
8e84c258 Eugene Krasnikov 2013-10-08  492  			   struct ieee80211_key_conf *key_conf)
8e84c258 Eugene Krasnikov 2013-10-08  493  {
8e84c258 Eugene Krasnikov 2013-10-08  494  	struct wcn36xx *wcn = hw->priv;
ce75877f Pontus Fuchs     2016-04-18  495  	struct wcn36xx_vif *vif_priv = wcn36xx_vif_to_priv(vif);
cc31b493 Loic Poulain     2018-05-28 @496  	struct wcn36xx_sta *sta_priv = sta ? wcn36xx_sta_to_priv(sta) : NULL;
                                                                               ^^^
New check.  Is it really required?

8e84c258 Eugene Krasnikov 2013-10-08  497  	int ret = 0;
8e84c258 Eugene Krasnikov 2013-10-08  498  	u8 key[WLAN_MAX_KEY_LEN];
8e84c258 Eugene Krasnikov 2013-10-08  499  
8e84c258 Eugene Krasnikov 2013-10-08  500  	wcn36xx_dbg(WCN36XX_DBG_MAC, "mac80211 set key\n");
8e84c258 Eugene Krasnikov 2013-10-08  501  	wcn36xx_dbg(WCN36XX_DBG_MAC, "Key: cmd=0x%x algo:0x%x, id:%d, len:%d flags 0x%x\n",
8e84c258 Eugene Krasnikov 2013-10-08  502  		    cmd, key_conf->cipher, key_conf->keyidx,
8e84c258 Eugene Krasnikov 2013-10-08  503  		    key_conf->keylen, key_conf->flags);
8e84c258 Eugene Krasnikov 2013-10-08  504  	wcn36xx_dbg_dump(WCN36XX_DBG_MAC, "KEY: ",
8e84c258 Eugene Krasnikov 2013-10-08  505  			 key_conf->key,
8e84c258 Eugene Krasnikov 2013-10-08  506  			 key_conf->keylen);
8e84c258 Eugene Krasnikov 2013-10-08  507  
39efc7cc Bjorn Andersson  2017-08-02  508  	mutex_lock(&wcn->conf_mutex);
39efc7cc Bjorn Andersson  2017-08-02  509  
8e84c258 Eugene Krasnikov 2013-10-08  510  	switch (key_conf->cipher) {
8e84c258 Eugene Krasnikov 2013-10-08  511  	case WLAN_CIPHER_SUITE_WEP40:
8e84c258 Eugene Krasnikov 2013-10-08  512  		vif_priv->encrypt_type = WCN36XX_HAL_ED_WEP40;
8e84c258 Eugene Krasnikov 2013-10-08  513  		break;
8e84c258 Eugene Krasnikov 2013-10-08  514  	case WLAN_CIPHER_SUITE_WEP104:
c489f900 Loic Poulain     2018-05-28  515  		vif_priv->encrypt_type = WCN36XX_HAL_ED_WEP104;
8e84c258 Eugene Krasnikov 2013-10-08  516  		break;
8e84c258 Eugene Krasnikov 2013-10-08  517  	case WLAN_CIPHER_SUITE_CCMP:
8e84c258 Eugene Krasnikov 2013-10-08  518  		vif_priv->encrypt_type = WCN36XX_HAL_ED_CCMP;
8e84c258 Eugene Krasnikov 2013-10-08  519  		break;
8e84c258 Eugene Krasnikov 2013-10-08  520  	case WLAN_CIPHER_SUITE_TKIP:
8e84c258 Eugene Krasnikov 2013-10-08  521  		vif_priv->encrypt_type = WCN36XX_HAL_ED_TKIP;
8e84c258 Eugene Krasnikov 2013-10-08  522  		break;
8e84c258 Eugene Krasnikov 2013-10-08  523  	default:
8e84c258 Eugene Krasnikov 2013-10-08  524  		wcn36xx_err("Unsupported key type 0x%x\n",
8e84c258 Eugene Krasnikov 2013-10-08  525  			      key_conf->cipher);
8e84c258 Eugene Krasnikov 2013-10-08  526  		ret = -EOPNOTSUPP;
8e84c258 Eugene Krasnikov 2013-10-08  527  		goto out;
8e84c258 Eugene Krasnikov 2013-10-08  528  	}
8e84c258 Eugene Krasnikov 2013-10-08  529  
8e84c258 Eugene Krasnikov 2013-10-08  530  	switch (cmd) {
8e84c258 Eugene Krasnikov 2013-10-08  531  	case SET_KEY:
8e84c258 Eugene Krasnikov 2013-10-08  532  		if (WCN36XX_HAL_ED_TKIP == vif_priv->encrypt_type) {
8e84c258 Eugene Krasnikov 2013-10-08  533  			/*
8e84c258 Eugene Krasnikov 2013-10-08  534  			 * Supplicant is sending key in the wrong order:
8e84c258 Eugene Krasnikov 2013-10-08  535  			 * Temporal Key (16 b) - TX MIC (8 b) - RX MIC (8 b)
8e84c258 Eugene Krasnikov 2013-10-08  536  			 * but HW expects it to be in the order as described in
8e84c258 Eugene Krasnikov 2013-10-08  537  			 * IEEE 802.11 spec (see chapter 11.7) like this:
8e84c258 Eugene Krasnikov 2013-10-08  538  			 * Temporal Key (16 b) - RX MIC (8 b) - TX MIC (8 b)
8e84c258 Eugene Krasnikov 2013-10-08  539  			 */
8e84c258 Eugene Krasnikov 2013-10-08  540  			memcpy(key, key_conf->key, 16);
8e84c258 Eugene Krasnikov 2013-10-08  541  			memcpy(key + 16, key_conf->key + 24, 8);
8e84c258 Eugene Krasnikov 2013-10-08  542  			memcpy(key + 24, key_conf->key + 16, 8);
8e84c258 Eugene Krasnikov 2013-10-08  543  		} else {
8e84c258 Eugene Krasnikov 2013-10-08  544  			memcpy(key, key_conf->key, key_conf->keylen);
8e84c258 Eugene Krasnikov 2013-10-08  545  		}
8e84c258 Eugene Krasnikov 2013-10-08  546  
8e84c258 Eugene Krasnikov 2013-10-08  547  		if (IEEE80211_KEY_FLAG_PAIRWISE & key_conf->flags) {
8e84c258 Eugene Krasnikov 2013-10-08  548  			sta_priv->is_data_encrypted = true;
8e84c258 Eugene Krasnikov 2013-10-08  549  			/* Reconfigure bss with encrypt_type */
8e84c258 Eugene Krasnikov 2013-10-08  550  			if (NL80211_IFTYPE_STATION == vif->type)
8e84c258 Eugene Krasnikov 2013-10-08  551  				wcn36xx_smd_config_bss(wcn,
8e84c258 Eugene Krasnikov 2013-10-08  552  						       vif,
8e84c258 Eugene Krasnikov 2013-10-08  553  						       sta,
8e84c258 Eugene Krasnikov 2013-10-08 @554  						       sta->addr,
                                                                                               ^^^^^^^^^
Unchecked dereference, but possibly this is false positive if
cmd == SET_KEY implies that "sta" is non-NULL etc.

8e84c258 Eugene Krasnikov 2013-10-08  555  						       true);
8e84c258 Eugene Krasnikov 2013-10-08  556  
8e84c258 Eugene Krasnikov 2013-10-08  557  			wcn36xx_smd_set_stakey(wcn,
8e84c258 Eugene Krasnikov 2013-10-08  558  				vif_priv->encrypt_type,
8e84c258 Eugene Krasnikov 2013-10-08  559  				key_conf->keyidx,
8e84c258 Eugene Krasnikov 2013-10-08  560  				key_conf->keylen,
8e84c258 Eugene Krasnikov 2013-10-08  561  				key,
8e84c258 Eugene Krasnikov 2013-10-08  562  				get_sta_index(vif, sta_priv));
8e84c258 Eugene Krasnikov 2013-10-08  563  		} else {
8e84c258 Eugene Krasnikov 2013-10-08  564  			wcn36xx_smd_set_bsskey(wcn,
8e84c258 Eugene Krasnikov 2013-10-08  565  				vif_priv->encrypt_type,
0fc8bb50 Daniel Mack      2018-04-19  566  				vif_priv->bss_index,
8e84c258 Eugene Krasnikov 2013-10-08  567  				key_conf->keyidx,
8e84c258 Eugene Krasnikov 2013-10-08  568  				key_conf->keylen,
8e84c258 Eugene Krasnikov 2013-10-08  569  				key);
6daab026 Loic Poulain     2018-05-28  570  
8e84c258 Eugene Krasnikov 2013-10-08  571  			if ((WLAN_CIPHER_SUITE_WEP40 == key_conf->cipher) ||
8e84c258 Eugene Krasnikov 2013-10-08  572  			    (WLAN_CIPHER_SUITE_WEP104 == key_conf->cipher)) {
cc31b493 Loic Poulain     2018-05-28  573  				list_for_each_entry(sta_priv,
cc31b493 Loic Poulain     2018-05-28  574  						    &vif_priv->sta_list, list) {
8e84c258 Eugene Krasnikov 2013-10-08  575  					sta_priv->is_data_encrypted = true;
8e84c258 Eugene Krasnikov 2013-10-08  576  					wcn36xx_smd_set_stakey(wcn,
8e84c258 Eugene Krasnikov 2013-10-08  577  						vif_priv->encrypt_type,
8e84c258 Eugene Krasnikov 2013-10-08  578  						key_conf->keyidx,
8e84c258 Eugene Krasnikov 2013-10-08  579  						key_conf->keylen,
8e84c258 Eugene Krasnikov 2013-10-08  580  						key,
8e84c258 Eugene Krasnikov 2013-10-08  581  						get_sta_index(vif, sta_priv));
8e84c258 Eugene Krasnikov 2013-10-08  582  				}
8e84c258 Eugene Krasnikov 2013-10-08  583  			}
cc31b493 Loic Poulain     2018-05-28  584  		}
8e84c258 Eugene Krasnikov 2013-10-08  585  		break;
8e84c258 Eugene Krasnikov 2013-10-08  586  	case DISABLE_KEY:
8e84c258 Eugene Krasnikov 2013-10-08  587  		if (!(IEEE80211_KEY_FLAG_PAIRWISE & key_conf->flags)) {
0fc8bb50 Daniel Mack      2018-04-19  588  			if (vif_priv->bss_index != WCN36XX_HAL_BSS_INVALID_IDX)
8e84c258 Eugene Krasnikov 2013-10-08  589  				wcn36xx_smd_remove_bsskey(wcn,
8e84c258 Eugene Krasnikov 2013-10-08  590  					vif_priv->encrypt_type,
0fc8bb50 Daniel Mack      2018-04-19  591  					vif_priv->bss_index,
8e84c258 Eugene Krasnikov 2013-10-08  592  					key_conf->keyidx);
0fc8bb50 Daniel Mack      2018-04-19  593  
0fc8bb50 Daniel Mack      2018-04-19  594  			vif_priv->encrypt_type = WCN36XX_HAL_ED_NONE;
8e84c258 Eugene Krasnikov 2013-10-08  595  		} else {
8e84c258 Eugene Krasnikov 2013-10-08  596  			sta_priv->is_data_encrypted = false;
8e84c258 Eugene Krasnikov 2013-10-08  597  			/* do not remove key if disassociated */
8e84c258 Eugene Krasnikov 2013-10-08  598  			if (sta_priv->aid)
8e84c258 Eugene Krasnikov 2013-10-08  599  				wcn36xx_smd_remove_stakey(wcn,
8e84c258 Eugene Krasnikov 2013-10-08  600  					vif_priv->encrypt_type,
8e84c258 Eugene Krasnikov 2013-10-08  601  					key_conf->keyidx,
8e84c258 Eugene Krasnikov 2013-10-08  602  					get_sta_index(vif, sta_priv));
8e84c258 Eugene Krasnikov 2013-10-08  603  		}
8e84c258 Eugene Krasnikov 2013-10-08  604  		break;
8e84c258 Eugene Krasnikov 2013-10-08  605  	default:
8e84c258 Eugene Krasnikov 2013-10-08  606  		wcn36xx_err("Unsupported key cmd 0x%x\n", cmd);
8e84c258 Eugene Krasnikov 2013-10-08  607  		ret = -EOPNOTSUPP;
8e84c258 Eugene Krasnikov 2013-10-08  608  		goto out;
8e84c258 Eugene Krasnikov 2013-10-08  609  	}
8e84c258 Eugene Krasnikov 2013-10-08  610  
8e84c258 Eugene Krasnikov 2013-10-08  611  out:
39efc7cc Bjorn Andersson  2017-08-02  612  	mutex_unlock(&wcn->conf_mutex);
39efc7cc Bjorn Andersson  2017-08-02  613  
8e84c258 Eugene Krasnikov 2013-10-08  614  	return ret;
8e84c258 Eugene Krasnikov 2013-10-08  615  }
8e84c258 Eugene Krasnikov 2013-10-08  616  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
