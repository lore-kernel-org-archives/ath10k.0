Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwMV-0005GL-FI
 for ath10k@lists.infradead.org; Tue, 03 Nov 2020 13:28:44 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: drivers/net/wireless/ath/ath10k/mac.c:9125
 ath10k_mac_op_set_tid_config() error: uninitialized symbol 'ret'.
References: <20201103100037.GE12347@kadam>
Date: Tue, 03 Nov 2020 12:09:35 +0200
In-Reply-To: <20201103100037.GE12347@kadam> (Dan Carpenter's message of "Tue, 
 3 Nov 2020 13:00:37 +0300")
Message-ID: <874km6u4yo.fsf@codeaurora.org>
MIME-Version: 1.0
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, kbuild@lists.01.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Tamizh Chelvam <tamizhr@codeaurora.org>, Dan Carpenter <error27@gmail.com>

+ ath10k list

Dan Carpenter <dan.carpenter@oracle.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3cea11cd5e3b00d91caf0b4730194039b45c5891
> commit: 7b2531d93bac6bea67e9c7f49901e9e8796d6d57 ath10k: Add new api to support TID specific configuration
> config: x86_64-randconfig-m031-20201102 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/net/wireless/ath/ath10k/mac.c:9125 ath10k_mac_op_set_tid_config() error: uninitialized symbol 'ret'.
>
> vim +/ret +9125 drivers/net/wireless/ath/ath10k/mac.c
>
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9089  static int ath10k_mac_op_set_tid_config(struct ieee80211_hw *hw,
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9090  					struct ieee80211_vif *vif,
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9091  					struct ieee80211_sta *sta,
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9092  					struct cfg80211_tid_config *tid_config)
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9093  {
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9094  	struct ath10k *ar = hw->priv;
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9095  	struct ath10k_vif *arvif = (void *)vif->drv_priv;
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9096  	struct ath10k_mac_iter_tid_conf_data data = {};
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9097  	struct wmi_per_peer_per_tid_cfg_arg arg = {};
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9098  	int ret, i;
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9099  
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9100  	mutex_lock(&ar->conf_mutex);
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9101  	arg.vdev_id = arvif->vdev_id;
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9102  
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9103  	memset(arvif->tid_conf_changed, 0, sizeof(arvif->tid_conf_changed));
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9104  
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9105  	for (i = 0; i < tid_config->n_tid_conf; i++) {
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9106  		ret = ath10k_mac_parse_tid_config(ar, sta, vif,
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9107  						  &tid_config->tid_conf[i],
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9108  						  &arg);
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9109  		if (ret)
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9110  			goto exit;
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9111  	}
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9112  
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9113  	if (sta)
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9114  		goto exit;
>                                                                 ^^^^^^^^^^
>
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9115  
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9116  	ret = 0;
>                                                         ^^^^^^^^
> Probably just move this to the "int ret = 0;" start of the function?

Or preferably before "if (sta)" check. Tamizh, please send a fix.

> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9117  	data.curr_vif = vif;
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9118  	data.ar = ar;
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9119  
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9120  	ieee80211_iterate_stations_atomic(hw, ath10k_mac_vif_stations_tid_conf,
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9121  					  &data);
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9122  
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9123  exit:
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9124  	mutex_unlock(&ar->conf_mutex);
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19 @9125  	return ret;
> 7b2531d93bac6be Tamizh Chelvam  2020-08-19  9126  }
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
