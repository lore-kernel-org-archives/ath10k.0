Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fO0oO-0003VI-Nn
 for ath10k@lists.infradead.org; Wed, 30 May 2018 13:06:56 +0000
Received: by mail-wm0-x229.google.com with SMTP id f8-v6so47692597wmc.4
 for <ath10k@lists.infradead.org>; Wed, 30 May 2018 06:06:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180530100205.q4y6wkonr7cqb4tv@mwanda>
References: <20180530100205.q4y6wkonr7cqb4tv@mwanda>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 30 May 2018 15:05:52 +0200
Message-ID: <CAMZdPi_G_8hebJG-4Q+8Gq8uwkLUiXmatZLZZd4wbtJJn6hWpA@mail.gmail.com>
Subject: Re: [ath6kl:pending 88/88] drivers/net/wireless/ath/wcn36xx/main.c:554
 wcn36xx_set_key() error: we previously assumed 'sta' could be null (see line
 496)
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild@01.org, kbuild-all@01.org, ath10k@lists.infradead.org

> 8e84c258 Eugene Krasnikov 2013-10-08  488
> 8e84c258 Eugene Krasnikov 2013-10-08  489  static int wcn36xx_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
> 8e84c258 Eugene Krasnikov 2013-10-08  490                          struct ieee80211_vif *vif,
> 8e84c258 Eugene Krasnikov 2013-10-08  491                          struct ieee80211_sta *sta,
> 8e84c258 Eugene Krasnikov 2013-10-08  492                          struct ieee80211_key_conf *key_conf)
> 8e84c258 Eugene Krasnikov 2013-10-08  493  {
> 8e84c258 Eugene Krasnikov 2013-10-08  494       struct wcn36xx *wcn = hw->priv;
> ce75877f Pontus Fuchs     2016-04-18  495       struct wcn36xx_vif *vif_priv = wcn36xx_vif_to_priv(vif);
> cc31b493 Loic Poulain     2018-05-28 @496       struct wcn36xx_sta *sta_priv = sta ? wcn36xx_sta_to_priv(sta) : NULL;
>                                                                                ^^^
> New check.  Is it really required?
>
> 8e84c258 Eugene Krasnikov 2013-10-08  497       int ret = 0;
> 8e84c258 Eugene Krasnikov 2013-10-08  498       u8 key[WLAN_MAX_KEY_LEN];
> 8e84c258 Eugene Krasnikov 2013-10-08  499
> 8e84c258 Eugene Krasnikov 2013-10-08  500       wcn36xx_dbg(WCN36XX_DBG_MAC, "mac80211 set key\n");
> 8e84c258 Eugene Krasnikov 2013-10-08  501       wcn36xx_dbg(WCN36XX_DBG_MAC, "Key: cmd=0x%x algo:0x%x, id:%d, len:%d flags 0x%x\n",
> 8e84c258 Eugene Krasnikov 2013-10-08  502                   cmd, key_conf->cipher, key_conf->keyidx,
> 8e84c258 Eugene Krasnikov 2013-10-08  503                   key_conf->keylen, key_conf->flags);
> 8e84c258 Eugene Krasnikov 2013-10-08  504       wcn36xx_dbg_dump(WCN36XX_DBG_MAC, "KEY: ",
> 8e84c258 Eugene Krasnikov 2013-10-08  505                        key_conf->key,
> 8e84c258 Eugene Krasnikov 2013-10-08  506                        key_conf->keylen);
> 8e84c258 Eugene Krasnikov 2013-10-08  507
> 39efc7cc Bjorn Andersson  2017-08-02  508       mutex_lock(&wcn->conf_mutex);
> 39efc7cc Bjorn Andersson  2017-08-02  509
> 8e84c258 Eugene Krasnikov 2013-10-08  510       switch (key_conf->cipher) {
> 8e84c258 Eugene Krasnikov 2013-10-08  511       case WLAN_CIPHER_SUITE_WEP40:
> 8e84c258 Eugene Krasnikov 2013-10-08  512               vif_priv->encrypt_type = WCN36XX_HAL_ED_WEP40;
> 8e84c258 Eugene Krasnikov 2013-10-08  513               break;
> 8e84c258 Eugene Krasnikov 2013-10-08  514       case WLAN_CIPHER_SUITE_WEP104:
> c489f900 Loic Poulain     2018-05-28  515               vif_priv->encrypt_type = WCN36XX_HAL_ED_WEP104;
> 8e84c258 Eugene Krasnikov 2013-10-08  516               break;
> 8e84c258 Eugene Krasnikov 2013-10-08  517       case WLAN_CIPHER_SUITE_CCMP:
> 8e84c258 Eugene Krasnikov 2013-10-08  518               vif_priv->encrypt_type = WCN36XX_HAL_ED_CCMP;
> 8e84c258 Eugene Krasnikov 2013-10-08  519               break;
> 8e84c258 Eugene Krasnikov 2013-10-08  520       case WLAN_CIPHER_SUITE_TKIP:
> 8e84c258 Eugene Krasnikov 2013-10-08  521               vif_priv->encrypt_type = WCN36XX_HAL_ED_TKIP;
> 8e84c258 Eugene Krasnikov 2013-10-08  522               break;
> 8e84c258 Eugene Krasnikov 2013-10-08  523       default:
> 8e84c258 Eugene Krasnikov 2013-10-08  524               wcn36xx_err("Unsupported key type 0x%x\n",
> 8e84c258 Eugene Krasnikov 2013-10-08  525                             key_conf->cipher);
> 8e84c258 Eugene Krasnikov 2013-10-08  526               ret = -EOPNOTSUPP;
> 8e84c258 Eugene Krasnikov 2013-10-08  527               goto out;
> 8e84c258 Eugene Krasnikov 2013-10-08  528       }
> 8e84c258 Eugene Krasnikov 2013-10-08  529
> 8e84c258 Eugene Krasnikov 2013-10-08  530       switch (cmd) {
> 8e84c258 Eugene Krasnikov 2013-10-08  531       case SET_KEY:
> 8e84c258 Eugene Krasnikov 2013-10-08  532               if (WCN36XX_HAL_ED_TKIP == vif_priv->encrypt_type) {
> 8e84c258 Eugene Krasnikov 2013-10-08  533                       /*
> 8e84c258 Eugene Krasnikov 2013-10-08  534                        * Supplicant is sending key in the wrong order:
> 8e84c258 Eugene Krasnikov 2013-10-08  535                        * Temporal Key (16 b) - TX MIC (8 b) - RX MIC (8 b)
> 8e84c258 Eugene Krasnikov 2013-10-08  536                        * but HW expects it to be in the order as described in
> 8e84c258 Eugene Krasnikov 2013-10-08  537                        * IEEE 802.11 spec (see chapter 11.7) like this:
> 8e84c258 Eugene Krasnikov 2013-10-08  538                        * Temporal Key (16 b) - RX MIC (8 b) - TX MIC (8 b)
> 8e84c258 Eugene Krasnikov 2013-10-08  539                        */
> 8e84c258 Eugene Krasnikov 2013-10-08  540                       memcpy(key, key_conf->key, 16);
> 8e84c258 Eugene Krasnikov 2013-10-08  541                       memcpy(key + 16, key_conf->key + 24, 8);
> 8e84c258 Eugene Krasnikov 2013-10-08  542                       memcpy(key + 24, key_conf->key + 16, 8);
> 8e84c258 Eugene Krasnikov 2013-10-08  543               } else {
> 8e84c258 Eugene Krasnikov 2013-10-08  544                       memcpy(key, key_conf->key, key_conf->keylen);
> 8e84c258 Eugene Krasnikov 2013-10-08  545               }
> 8e84c258 Eugene Krasnikov 2013-10-08  546
> 8e84c258 Eugene Krasnikov 2013-10-08  547               if (IEEE80211_KEY_FLAG_PAIRWISE & key_conf->flags) {
> 8e84c258 Eugene Krasnikov 2013-10-08  548                       sta_priv->is_data_encrypted = true;
> 8e84c258 Eugene Krasnikov 2013-10-08  549                       /* Reconfigure bss with encrypt_type */
> 8e84c258 Eugene Krasnikov 2013-10-08  550                       if (NL80211_IFTYPE_STATION == vif->type)
> 8e84c258 Eugene Krasnikov 2013-10-08  551                               wcn36xx_smd_config_bss(wcn,
> 8e84c258 Eugene Krasnikov 2013-10-08  552                                                      vif,
> 8e84c258 Eugene Krasnikov 2013-10-08  553                                                      sta,
> 8e84c258 Eugene Krasnikov 2013-10-08 @554                                                      sta->addr,
>                                                                                                ^^^^^^^^^
> Unchecked dereference, but possibly this is false positive if
> cmd == SET_KEY implies that "sta" is non-NULL etc.

KEY_FLAG_PAIRWISE implies that sta is non-NULL.

Regards,
Loic

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
