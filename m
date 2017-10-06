Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0GKl-00040h-3b
 for ath10k@lists.infradead.org; Fri, 06 Oct 2017 00:17:46 +0000
Date: Fri, 6 Oct 2017 08:15:56 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [ath6kl:pending 34/39]
 drivers/net/wireless/ath/ath10k/mac.c:5062:26: warning: cast from pointer to
 integer of different size
Message-ID: <201710060853.eqrVtVt2%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
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
To: Alagu Sankar <alagusankar@silex-india.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, kbuild-all@01.org, ath10k@lists.infradead.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   49e3503004be11aa2538b9a443ea8b22d9a22631
commit: acdda8888c3414a63d4dc634ded50cc14f7f0ec4 [34/39] ath10k_sdio: high latency fixes for beacon buffer
config: i386-randconfig-c0-10060606 (attached as .config)
compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
reproduce:
        git checkout acdda8888c3414a63d4dc634ded50cc14f7f0ec4
        # save the attached .config to linux build tree
        make ARCH=i386 

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_add_interface':
>> drivers/net/wireless/ath/ath10k/mac.c:5062:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
                             ^
   In file included from include/asm-generic/bug.h:4:0,
                    from arch/x86/include/asm/bug.h:81,
                    from include/linux/bug.h:4,
                    from include/net/mac80211.h:18,
                    from drivers/net/wireless/ath/ath10k/mac.h:21,
                    from drivers/net/wireless/ath/ath10k/mac.c:18:
   drivers/net/wireless/ath/ath10k/mac.c: At top level:
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'strcpy' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:421:2: note: in expansion of macro 'if'
     if (p_size == (size_t)-1 && q_size == (size_t)-1)
     ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'kmemdup' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:411:2: note: in expansion of macro 'if'
     if (p_size < size)
     ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'kmemdup' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:409:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(size) && p_size < size)
     ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memchr_inv' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:400:2: note: in expansion of macro 'if'
     if (p_size < size)
     ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memchr_inv' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:398:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(size) && p_size < size)
     ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memchr' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:389:2: note: in expansion of macro 'if'
     if (p_size < size)
     ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memchr' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:387:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(size) && p_size < size)
     ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memcmp' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:379:2: note: in expansion of macro 'if'
     if (p_size < size || q_size < size)
     ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memcmp' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:376:3: note: in expansion of macro 'if'
      if (q_size < size)
      ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memcmp' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^
   include/linux/string.h:374:3: note: in expansion of macro 'if'
      if (p_size < size)
      ^
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memcmp' which is not static

vim +5062 drivers/net/wireless/ath/ath10k/mac.c

  4925	
  4926	/*
  4927	 * TODO:
  4928	 * Figure out how to handle WMI_VDEV_SUBTYPE_P2P_DEVICE,
  4929	 * because we will send mgmt frames without CCK. This requirement
  4930	 * for P2P_FIND/GO_NEG should be handled by checking CCK flag
  4931	 * in the TX packet.
  4932	 */
  4933	static int ath10k_add_interface(struct ieee80211_hw *hw,
  4934					struct ieee80211_vif *vif)
  4935	{
  4936		struct ath10k *ar = hw->priv;
  4937		struct ath10k_vif *arvif = (void *)vif->drv_priv;
  4938		struct ath10k_peer *peer;
  4939		enum wmi_sta_powersave_param param;
  4940		int ret = 0;
  4941		u32 value;
  4942		int bit;
  4943		int i;
  4944		u32 vdev_param;
  4945	
  4946		vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
  4947	
  4948		mutex_lock(&ar->conf_mutex);
  4949	
  4950		memset(arvif, 0, sizeof(*arvif));
  4951		ath10k_mac_txq_init(vif->txq);
  4952	
  4953		arvif->ar = ar;
  4954		arvif->vif = vif;
  4955	
  4956		INIT_LIST_HEAD(&arvif->list);
  4957		INIT_WORK(&arvif->ap_csa_work, ath10k_mac_vif_ap_csa_work);
  4958		INIT_DELAYED_WORK(&arvif->connection_loss_work,
  4959				  ath10k_mac_vif_sta_connection_loss_work);
  4960	
  4961		for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
  4962			arvif->bitrate_mask.control[i].legacy = 0xffffffff;
  4963			memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
  4964			       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
  4965			memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
  4966			       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
  4967		}
  4968	
  4969		if (ar->num_peers >= ar->max_num_peers) {
  4970			ath10k_warn(ar, "refusing vdev creation due to insufficient peer entry resources in firmware\n");
  4971			ret = -ENOBUFS;
  4972			goto err;
  4973		}
  4974	
  4975		if (ar->free_vdev_map == 0) {
  4976			ath10k_warn(ar, "Free vdev map is empty, no more interfaces allowed.\n");
  4977			ret = -EBUSY;
  4978			goto err;
  4979		}
  4980		bit = __ffs64(ar->free_vdev_map);
  4981	
  4982		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac create vdev %i map %llx\n",
  4983			   bit, ar->free_vdev_map);
  4984	
  4985		arvif->vdev_id = bit;
  4986		arvif->vdev_subtype =
  4987			ath10k_wmi_get_vdev_subtype(ar, WMI_VDEV_SUBTYPE_NONE);
  4988	
  4989		switch (vif->type) {
  4990		case NL80211_IFTYPE_P2P_DEVICE:
  4991			arvif->vdev_type = WMI_VDEV_TYPE_STA;
  4992			arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  4993						(ar, WMI_VDEV_SUBTYPE_P2P_DEVICE);
  4994			break;
  4995		case NL80211_IFTYPE_UNSPECIFIED:
  4996		case NL80211_IFTYPE_STATION:
  4997			arvif->vdev_type = WMI_VDEV_TYPE_STA;
  4998			if (vif->p2p)
  4999				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5000						(ar, WMI_VDEV_SUBTYPE_P2P_CLIENT);
  5001			break;
  5002		case NL80211_IFTYPE_ADHOC:
  5003			arvif->vdev_type = WMI_VDEV_TYPE_IBSS;
  5004			break;
  5005		case NL80211_IFTYPE_MESH_POINT:
  5006			if (test_bit(WMI_SERVICE_MESH_11S, ar->wmi.svc_map)) {
  5007				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5008							(ar, WMI_VDEV_SUBTYPE_MESH_11S);
  5009			} else if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
  5010				ret = -EINVAL;
  5011				ath10k_warn(ar, "must load driver with rawmode=1 to add mesh interfaces\n");
  5012				goto err;
  5013			}
  5014			arvif->vdev_type = WMI_VDEV_TYPE_AP;
  5015			break;
  5016		case NL80211_IFTYPE_AP:
  5017			arvif->vdev_type = WMI_VDEV_TYPE_AP;
  5018	
  5019			if (vif->p2p)
  5020				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5021							(ar, WMI_VDEV_SUBTYPE_P2P_GO);
  5022			break;
  5023		case NL80211_IFTYPE_MONITOR:
  5024			arvif->vdev_type = WMI_VDEV_TYPE_MONITOR;
  5025			break;
  5026		default:
  5027			WARN_ON(1);
  5028			break;
  5029		}
  5030	
  5031		/* Using vdev_id as queue number will make it very easy to do per-vif
  5032		 * tx queue locking. This shouldn't wrap due to interface combinations
  5033		 * but do a modulo for correctness sake and prevent using offchannel tx
  5034		 * queues for regular vif tx.
  5035		 */
  5036		vif->cab_queue = arvif->vdev_id % (IEEE80211_MAX_QUEUES - 1);
  5037		for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
  5038			vif->hw_queue[i] = arvif->vdev_id % (IEEE80211_MAX_QUEUES - 1);
  5039	
  5040		/* Some firmware revisions don't wait for beacon tx completion before
  5041		 * sending another SWBA event. This could lead to hardware using old
  5042		 * (freed) beacon data in some cases, e.g. tx credit starvation
  5043		 * combined with missed TBTT. This is very very rare.
  5044		 *
  5045		 * On non-IOMMU-enabled hosts this could be a possible security issue
  5046		 * because hw could beacon some random data on the air.  On
  5047		 * IOMMU-enabled hosts DMAR faults would occur in most cases and target
  5048		 * device would crash.
  5049		 *
  5050		 * Since there are no beacon tx completions (implicit nor explicit)
  5051		 * propagated to host the only workaround for this is to allocate a
  5052		 * DMA-coherent buffer for a lifetime of a vif and use it for all
  5053		 * beacon tx commands. Worst case for this approach is some beacons may
  5054		 * become corrupted, e.g. have garbled IEs or out-of-date TIM bitmap.
  5055		 */
  5056		if (vif->type == NL80211_IFTYPE_ADHOC ||
  5057		    vif->type == NL80211_IFTYPE_MESH_POINT ||
  5058		    vif->type == NL80211_IFTYPE_AP) {
  5059			if (ar->is_high_latency) {
  5060				arvif->beacon_buf = kmalloc(IEEE80211_MAX_FRAME_LEN,
  5061							    GFP_KERNEL);
> 5062				arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
  5063			} else {
  5064				arvif->beacon_buf =
  5065					dma_zalloc_coherent(ar->dev,
  5066							    IEEE80211_MAX_FRAME_LEN,
  5067							    &arvif->beacon_paddr,
  5068							    GFP_ATOMIC);
  5069			}
  5070			if (!arvif->beacon_buf) {
  5071				ret = -ENOMEM;
  5072				ath10k_warn(ar, "failed to allocate beacon buffer: %d\n",
  5073					    ret);
  5074				goto err;
  5075			}
  5076		}
  5077		if (test_bit(ATH10K_FLAG_HW_CRYPTO_DISABLED, &ar->dev_flags))
  5078			arvif->nohwcrypt = true;
  5079	
  5080		if (arvif->nohwcrypt &&
  5081		    !test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
  5082			ath10k_warn(ar, "cryptmode module param needed for sw crypto\n");
  5083			goto err;
  5084		}
  5085	
  5086		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev create %d (add interface) type %d subtype %d bcnmode %s\n",
  5087			   arvif->vdev_id, arvif->vdev_type, arvif->vdev_subtype,
  5088			   arvif->beacon_buf ? "single-buf" : "per-skb");
  5089	
  5090		ret = ath10k_wmi_vdev_create(ar, arvif->vdev_id, arvif->vdev_type,
  5091					     arvif->vdev_subtype, vif->addr);
  5092		if (ret) {
  5093			ath10k_warn(ar, "failed to create WMI vdev %i: %d\n",
  5094				    arvif->vdev_id, ret);
  5095			goto err;
  5096		}
  5097	
  5098		ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
  5099		spin_lock_bh(&ar->data_lock);
  5100		list_add(&arvif->list, &ar->arvifs);
  5101		spin_unlock_bh(&ar->data_lock);
  5102	
  5103		/* It makes no sense to have firmware do keepalives. mac80211 already
  5104		 * takes care of this with idle connection polling.
  5105		 */
  5106		ret = ath10k_mac_vif_disable_keepalive(arvif);
  5107		if (ret) {
  5108			ath10k_warn(ar, "failed to disable keepalive on vdev %i: %d\n",
  5109				    arvif->vdev_id, ret);
  5110			goto err_vdev_delete;
  5111		}
  5112	
  5113		arvif->def_wep_key_idx = -1;
  5114	
  5115		vdev_param = ar->wmi.vdev_param->tx_encap_type;
  5116		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5117						ATH10K_HW_TXRX_NATIVE_WIFI);
  5118		/* 10.X firmware does not support this VDEV parameter. Do not warn */
  5119		if (ret && ret != -EOPNOTSUPP) {
  5120			ath10k_warn(ar, "failed to set vdev %i TX encapsulation: %d\n",
  5121				    arvif->vdev_id, ret);
  5122			goto err_vdev_delete;
  5123		}
  5124	
  5125		/* Configuring number of spatial stream for monitor interface is causing
  5126		 * target assert in qca9888 and qca6174.
  5127		 */
  5128		if (ar->cfg_tx_chainmask && (vif->type != NL80211_IFTYPE_MONITOR)) {
  5129			u16 nss = get_nss_from_chainmask(ar->cfg_tx_chainmask);
  5130	
  5131			vdev_param = ar->wmi.vdev_param->nss;
  5132			ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5133							nss);
  5134			if (ret) {
  5135				ath10k_warn(ar, "failed to set vdev %i chainmask 0x%x, nss %i: %d\n",
  5136					    arvif->vdev_id, ar->cfg_tx_chainmask, nss,
  5137					    ret);
  5138				goto err_vdev_delete;
  5139			}
  5140		}
  5141	
  5142		if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
  5143		    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
  5144			ret = ath10k_peer_create(ar, vif, NULL, arvif->vdev_id,
  5145						 vif->addr, WMI_PEER_TYPE_DEFAULT);
  5146			if (ret) {
  5147				ath10k_warn(ar, "failed to create vdev %i peer for AP/IBSS: %d\n",
  5148					    arvif->vdev_id, ret);
  5149				goto err_vdev_delete;
  5150			}
  5151	
  5152			spin_lock_bh(&ar->data_lock);
  5153	
  5154			peer = ath10k_peer_find(ar, arvif->vdev_id, vif->addr);
  5155			if (!peer) {
  5156				ath10k_warn(ar, "failed to lookup peer %pM on vdev %i\n",
  5157					    vif->addr, arvif->vdev_id);
  5158				spin_unlock_bh(&ar->data_lock);
  5159				ret = -ENOENT;
  5160				goto err_peer_delete;
  5161			}
  5162	
  5163			arvif->peer_id = find_first_bit(peer->peer_ids,
  5164							ATH10K_MAX_NUM_PEER_IDS);
  5165	
  5166			spin_unlock_bh(&ar->data_lock);
  5167		} else {
  5168			arvif->peer_id = HTT_INVALID_PEERID;
  5169		}
  5170	
  5171		if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
  5172			ret = ath10k_mac_set_kickout(arvif);
  5173			if (ret) {
  5174				ath10k_warn(ar, "failed to set vdev %i kickout parameters: %d\n",
  5175					    arvif->vdev_id, ret);
  5176				goto err_peer_delete;
  5177			}
  5178		}
  5179	
  5180		if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
  5181			param = WMI_STA_PS_PARAM_RX_WAKE_POLICY;
  5182			value = WMI_STA_PS_RX_WAKE_POLICY_WAKE;
  5183			ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id,
  5184							  param, value);
  5185			if (ret) {
  5186				ath10k_warn(ar, "failed to set vdev %i RX wake policy: %d\n",
  5187					    arvif->vdev_id, ret);
  5188				goto err_peer_delete;
  5189			}
  5190	
  5191			ret = ath10k_mac_vif_recalc_ps_wake_threshold(arvif);
  5192			if (ret) {
  5193				ath10k_warn(ar, "failed to recalc ps wake threshold on vdev %i: %d\n",
  5194					    arvif->vdev_id, ret);
  5195				goto err_peer_delete;
  5196			}
  5197	
  5198			ret = ath10k_mac_vif_recalc_ps_poll_count(arvif);
  5199			if (ret) {
  5200				ath10k_warn(ar, "failed to recalc ps poll count on vdev %i: %d\n",
  5201					    arvif->vdev_id, ret);
  5202				goto err_peer_delete;
  5203			}
  5204		}
  5205	
  5206		ret = ath10k_mac_set_txbf_conf(arvif);
  5207		if (ret) {
  5208			ath10k_warn(ar, "failed to set txbf for vdev %d: %d\n",
  5209				    arvif->vdev_id, ret);
  5210			goto err_peer_delete;
  5211		}
  5212	
  5213		ret = ath10k_mac_set_rts(arvif, ar->hw->wiphy->rts_threshold);
  5214		if (ret) {
  5215			ath10k_warn(ar, "failed to set rts threshold for vdev %d: %d\n",
  5216				    arvif->vdev_id, ret);
  5217			goto err_peer_delete;
  5218		}
  5219	
  5220		arvif->txpower = vif->bss_conf.txpower;
  5221		ret = ath10k_mac_txpower_recalc(ar);
  5222		if (ret) {
  5223			ath10k_warn(ar, "failed to recalc tx power: %d\n", ret);
  5224			goto err_peer_delete;
  5225		}
  5226	
  5227		if (vif->type == NL80211_IFTYPE_MONITOR) {
  5228			ar->monitor_arvif = arvif;
  5229			ret = ath10k_monitor_recalc(ar);
  5230			if (ret) {
  5231				ath10k_warn(ar, "failed to recalc monitor: %d\n", ret);
  5232				goto err_peer_delete;
  5233			}
  5234		}
  5235	
  5236		spin_lock_bh(&ar->htt.tx_lock);
  5237		if (!ar->tx_paused)
  5238			ieee80211_wake_queue(ar->hw, arvif->vdev_id);
  5239		spin_unlock_bh(&ar->htt.tx_lock);
  5240	
  5241		mutex_unlock(&ar->conf_mutex);
  5242		return 0;
  5243	
  5244	err_peer_delete:
  5245		if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
  5246		    arvif->vdev_type == WMI_VDEV_TYPE_IBSS)
  5247			ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
  5248	
  5249	err_vdev_delete:
  5250		ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
  5251		ar->free_vdev_map |= 1LL << arvif->vdev_id;
  5252		spin_lock_bh(&ar->data_lock);
  5253		list_del(&arvif->list);
  5254		spin_unlock_bh(&ar->data_lock);
  5255	
  5256	err:
  5257		if (arvif->beacon_buf) {
  5258			if (ar->is_high_latency)
  5259				kfree(arvif->beacon_buf);
  5260			else
  5261				dma_free_coherent(ar->dev, IEEE80211_MAX_FRAME_LEN,
  5262						  arvif->beacon_buf,
  5263						  arvif->beacon_paddr);
  5264			arvif->beacon_buf = NULL;
  5265		}
  5266	
  5267		mutex_unlock(&ar->conf_mutex);
  5268	
  5269		return ret;
  5270	}
  5271	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--0OAP2g/MAC+5xKAE
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICK/J1lkAAy5jb25maWcAlFxbc9w2sn7Pr5hKzsPuQ2JJlhWnTukBBMEZ7JAEDYAzGr2w
FGnsqCJLXmmUy78/3QA5BMCmdo8fXCK6AeLSl6+7wfnhux8W7PXw9PXmcH978/Dw9+LL/nH/
fHPY3y0+3z/s/3eRq0Wt7ELk0v4EzOX94+tf7+7ff7xYnP90ev7TyY/Pt6eL9f75cf+w4E+P
n++/vEL3+6fH734Adq7qQi67i/NM2sX9y+Lx6bB42R++69uvPl50788u/w6exwdZG6tbbqWq
u1xwlQs9ElVrm9Z2hdIVs5ff7x8+vz/7Eaf1/cDBNF9Bv8I/Xn5/83z727u/Pl68u3WzfHGL
6O72n/3zsV+p+DoXTWfaplHajq80lvG11YyLKa2q2vHBvbmqWNPpOu9g5aarZH358S06u7o8
vaAZuKoaZv/jOBFbNFwtRN7lFeuQFVZhxThXRzNLRy5FvbSrkbYUtdCSd9IwpE8JWbucNq62
Qi5XNt0OtutWbCO6hndFzkeq3hpRdVd8tWR53rFyqbS0q2o6LmelzDRMHg61ZLtk/BUzHW/a
TgPtiqIxvhJdKWs4PHkdbICblBG2bbpGaDcG04IlOzSQRJXBUyG1sR1ftfV6hq9hS0Gz+RnJ
TOiaOdFulDEyK0XCYlrTCDjWGfKW1bZbtfCWpoIDXMGcKQ63eax0nLbMJu9wYmw61VhZwbbk
oHSwR7JeznHmAg7dLY+VoCmR6oIqd6ZqJm0lu951SzM3ZNtolYmAXMirTjBd7uC5q0QgC83S
MtgLkNSNKM3l+6H9qOZwwgbMwbuH+1/ffX26e33Yv7z7n7ZmlUDJEMyIdz8l+i71p26rdHBE
WSvLHDZEdOLKv89Eym5XICC4VYWC/zrLDHZ29m7prOcD2rjXb9ByNGXSdqLewMpxipW0l+/P
BiLXcMROfSUc8/ffj2azb+usMJT1hP1n5UZoA2KE/YjmjrVWJcK+BtETZbe8lg1NyYByRpPK
69AOhJSr67keM+8vr8+BcFxrMKtwqSndze0tBpwhsVfhLKdd1NsjnhMDgsixtgQdVMaifF1+
/4/Hp8f9P4/HYHZmI5tAQ0CTQbCrT61oA131pw9SrvSuYxZ8TGCBixWr81D3WyPACgaa1IJf
TvbXaZcjwBRAFMqEnW4Fe2HDV/tGq4UYZBsUZfHy+uvL3y+H/ddRto9eAvTIaTLhQIBkVmpL
U0RRCPDyOPOiAEdh1lM+NIVglZCfHqSSS+3saYAfoDlXFZNJm5EVxQRGGUwl7N2OpDrDF1MA
fHAwmd4cRDbTNEwbMT9bN1gRmDyOqMOoFgb0B5Gr1ASHLDmzjO68AS+Zo5MsGfqeHS+J83C2
bTORg6OnxfHAwtbWvEnsMq1YzuFFb7MBaOlY/q+W5KsUeoDcgxInZ/b+6/75hRK11TU6WKly
yUM1rhVSJCgKoaeOGHKvAJ2AMzBuF7QJu3jI2rTv7M3L74sDzGNx83i3eDncHF4WN7e3T6+P
h/vHL+OErORrDxk4V21tIyHAg3Y7HRGP88hMjvrCBag/cFjSBKFvQcQ2nabm7cJMt6gBha0a
2wE5fBk8gjODzaP8iPHMwythhLQJZ9FFTTggTKws0UlVodohxaNKseSZ88exZwWIWp8FdlGu
e4g+aXH7MzaXCkcowJTIwl6e/hy24yEA6g3pZ+OeyNquO8MKkY5xRBDOcrYQcXh/D2Ax9zJM
oaoMNRQY2hoRNeCqrihbExhPvtSqbQLtcXjQSUEYxIDV58u0l3954AOY1F1MGQFCAUoILmIr
c7siTlbbjhyzf1MjcxMN55t1HrvQlF6AhFwLTbM04KJicY0752IjuSDeCj1TNUhmK3QxWULW
FMRYzr5Skq5QX3seb0PHrivB140CUUHrYJUW5ALR14N5B7WlxndigZjLvSMcHqxtgfAZFJSD
scup04rjmqxc42458KiDw3PPrILRvM0PoJ/OE1gHDQmag5YYxEFDiN0cXSXP58G+82O0gA7Q
nQoG4XVyqAkbBl3EklkNGFXWENsHyuJ1UeanQTIAnZUtwYZx0biwyQXiSZ+Gm2YNUyqZxTkF
W9kEkuPtYICp4jdVgOokCHGgpwaCJ8Ql3cRl+lOdNHuo5x3M2LoGHrOriJbO9x6R57E9M6ps
wZ3DlEFBKGA7sGYQ3DgRQigVTMUZv/S5qysZmuXIM4myAFs1I//JHhMzchMp2nA/CljCVfII
1ic4k0ZF2yqXNSuLQOjdXoYNDluEDXDGxPmsoviRyUCyWb6RMNO+T2QI8fgdvC8oPW247D61
Uq+jPvCijGktY8M4zBbzBnlogr3Awmu6I9IK9vj05Hzi8fskW7N//vz0/PXm8Xa/EH/sHwGa
MAApHMEJ4KYACtCD9xE8EmGZ3aZygTwx503lew9+K3YVfbZJrykzWLIssn1lm5HCZEqVzfSH
/dRLMYRZ8WhARR+E2KLT4P5URY++M1ZUztB3EA/LQnIXIlBHqlUhywi+OQPj/EG0cOVZKWPm
jnSgjwMNLahzXo4jVffZD3IB/2qrBoB8JkqS3L7R1c3FpV3BtoA2oVviiDXn5g1RmOQSj7ut
4x4JAkKhQRwHeBYw7JalSQQJlgNhEUwujUzXaabHt2phSQI4ELqDb+3ACxSUG4hs2xgSO9aV
UuuEiKlPeLZy2aqWiHgMHAIGF32gl2wHJhfBEFpZ7AZ/PGUASNSH+AScBFSwA1SBcZnzMS7p
ncxRiyU4gzr3Sej+YDrWpAvlJbU64EvjV0dbbUGBBfOoJ6FV8gokYCQbN4fUSYOdhHbb6hoC
LdgDGbrN1MQRB7NiOkeU7TCbFdz2iIIahHj/YMV0vy95W6Xi6LZ5VKR0XyFY8ZC/8JmO+OS8
MPnIgVcNZqnTDfetPuk2Q8tVO5PAlQ3vfKpgSOMRkzeCo7XtwIbYyfYuAWg1ZbuUdWSlguY5
hQcOt2mop27jE/gWEylYnvKACNQpCEw44Azbks2EDhNuUAVVUzjerjClAJsDUCeVCb+70rF4
qSg0YvbUTJHROWU0aszmiD7djoEcxedS8eBLU/GrVN6fYiM4eqAAaKq8LcGMoUFFyKVD6Tya
DkdxPm5atpgWkhIGcYU5PMpsxb0+xpKhmt2Q5LYxMAoWzAwVcWKtKGsT0wSBdA1OA85iC/oe
TFKVOWK9vtbxfkJgvE/phfElpnRGb1UUbzhAN9NNX/bia5LR8SgXVLByyPnq7dX/i3nAKVSI
c3QCFryJDToFMHWelHb3UkN2j0hj6gdrIy3uFEDyCahccrX58debl/3d4nePL789P32+f/Bp
rsCeqE0/vbeW6NgGuBMBcW+seo/qPe5KoFYFqwADjTWVIPaENWGoECqviy4MgtbLk0STIjTu
98KlaME4MwrH9zxtjfRUL/uuR2I4cm+sacHruxvNjzWYksZvA6dcvkVG269p4AbHXsEMwYDk
3TqOLAfj4rJ5JYCeOBuRodOlcDCLU8vM1KdBpFy78iBMuQHjilszyY8dq3rMKoQ0ugqy/u4w
fWfYFrWtQ3fmC8EzRHzTHO2ISl1lJXdsLiM+ssxT0s56S3cd2497SKTBnMo0z0+3+5eXp+fF
4e9vPoP8eX9zeH3eB8HZNVrEqKg+qZwWggGwEj7jlJAwuT/QsTqY0KvGoYq4MQNDG75jCUa2
kGHaEmAemp88Crewq7iyYJ+xvk2E/RGnH6JsDK0cyMKqcZw+HUjySmWKrsrk7L0R8OHSXH4N
Aj6XfgO5s97ndw65kgH5agfYEeJ/QBnLVoQ5atg5tpE62oOhbZpYnLIchYzeAEGFn2uItYdp
jJHhpuqD9RkXd3xlgmNIve5Zk5w2uNJMKeuTJKPlOf94QZukD28QrOGztKq6ogzwhbvvM3IC
CrCyraSkBzqS36bT0jlQz2nqemZh659n2j/S7Vy3RtECXTnUIuIExEjdyhoAbcNnJtKT3+cz
Y5dsZtylULlYXp2+Qe1KGu5UfKfl1ex+byTj7zu6HO+IM3uHycWZXug2ZhS+Rw+xUXP6jfnj
/oaPr+tchCzlaUKLrFEDcAVMac2pjM5o0TDIRFwcvx0dhxvAFQ9MW8Vk0Ii4oY8IL87TZrVJ
DLisZdVWDu4WrJLl7vJDSHd2gduyMlHY1tcTMXQSpaCLKTAiOGm/rACi983uwKM7eQMFzDbB
DjrFWj0luLipEpaRY7UVj9pXjbDT1FheUbbfbKWKrjJJVVVttxJlE6KC2l3EMnjPJvEPpiKL
oI5WBQc2tGDKXMW77GusGO7Shrln2KgSLDLTOzLj6HgCv9N3clY8lgaXXMCQKhV+RTRqoRVW
DLDqkmm1FrUz8RjwmtSvV7HUe/gS5Je/Pj3eH56eo5p3mNDpdaNGhQ5WMuHQrCnfovPhVuK4
hQGPAwxqS/pxtz0CAsUdxHnh7dH4ySpQ/owBWBiE5uM6RA5+43CfCnnVNjPIXnLQL7A1M/NA
ZUzGBBGUtMGuFV5EAMdLR6+edk758p52cR4VbTaVaUoAPu9peDKQz6gRB+JpkAJxFWsF0bWw
lyd/nZ/4f8kcYslrWJrkalY7OL481531yeiE7pKT82QMKeEtHVhnvQt1pW5D5IxPnQhv4LqC
Ym/vjyV+dynBuQoY0+UEooyKn5A03KWC/WvZNG8XcYzViSgGcuB7dgRvmocrXxCohXZYlijN
5YBc8T5PK8ZIl+47WsxwchWrW0aF6+P8PEtg8gZKsJW4a64m2mAJg6jU9pPBIDWO54+vQe0O
zdTQLYvBaNTcn9QkoTbkEJZtQ5wM0zkxcD9DQPslSxNKbtAeA/srnTWt4f0gK2UxsToZvG/v
Vz1LHq4NKhdIX8b1w55Rw18bagpeSxvr9sd5t/NoB7y4DWxoNS25ERmW/MJkc9/gq3o8vkZH
tRG37d5QdR+jKMwLjo1rEwjZsCtOLf11sVxfnp/8cgRyb+dhKWrHyi3bRS6PZKt8HXg+3edr
NHYFBmPLGuJY0mGd7XSQM0yBClanbaERg4e0RnNsim4KosnUgpnL4/2n60apQImvszYP/dD1
+wIifWLe18bXfkPm4YY1HERDh5JDL6fVQTah10t3cXsoAs4lh+C8hdaIxVyxyzsbvNcSicQs
y5giwLKco2Bxbz0T+7qrE266oekCD9bEmMM5bATyXSYV3sjWum1mCsYeMEBQsMH02vby4qiJ
ldURisXnzjCYubyehTANS50IhBYGTgPBFYsvbzmyLwmks4ejoW9Pi4IO4fraEoUyrrvTk5PI
Ul53Zx9OaLhy3b0/mSXBOCfkGy6BkqLzlcZLlTP3sa8EdVGBa2ZWSe0PzZFE1AzHrhHBnPYA
JsiLI6x20k4JzdDf1cKh/1nSfTDoya2c9ILEJjf05XJe5S6VCq5nNjuMNeUyt8MVlbnMe2/2
5xwUzeOdTJDbNcMlI4+nnPuVKHY+Knj6c/+8gKjg5sv+6/7x4NKajDdy8fQNv/Z6CasFfT2H
2tZIZJtq9qYekKJa9vaTDwGCys8UfPGw6IRPQ2jgTtmMefBwZyr8WqkvF2GXJvw6ybX090j8
+12kYoIvwEZnwYcy+3LmcqQfH2KIwswGNI5Hi00Hp6O1zEX4BVA8kuCDe5gbh6VLyZgFVLlL
W1trY1TkmjfwdjU3dMGmHXK6qOBoLpOhBRxjdKNk2BGfteDJ12kJWUbfQsTEyWTGbmy51CAH
dBXb8dqV0BUrJ2OgJswuqDVWgQAbUNAi/XIn5XiraOZn4NSzbQBX5ekaUxohcW+IG5d4zWru
60vQs0nexU8e4ggGBuoNSR5MoDcqc/s0cEnV5yriQUxGB9u+r6CD53B7K2FX6g02wBAtfqaB
V022gJwQelOTHS0Aa8TkAtHQ3t9hiV+BBHICeWOLqaYH9k/iNVkQTjmTFB6OAv4mtdwUcrDQ
6IiK5/2/X/ePt38vXm5vHqK0zaB/cTLOaeRSbfDLI0wa2hlyesn/SIxB4LF5APTYd+6GMMmL
e2XYhobjZBfMzLoL2f99F1XngE5rWmjIHkBDrOfu1v73vRyiaa2kPHe0vfEWkRzDxowprIh+
3IWZ/sOSZ893XF8YDkRM5HKOsvc5lb3F3fP9H/5Gajie36U5e+Tzgc0kH+hsFefDAPPFxd7X
pEzhMLiVtdp264txM2PCz7OEAWREL11eOchTKQryOFzeCJEDiPAJcy3r4JIDTfdGf4Lvj3yS
r2b3YOQyZAbdLenclwJhzkktoj+h2t1/OEtnUKp6qVvaWA30FSjALIMYRXlaOn/57eZ5fxdA
SnJV/gvIo+DJu4d9bOdinDC0OBkuWR79jkBErEQdfTXlXDQmwMzIx1XblDNuyQtv+iGam2j2
+jIsa/EP8MmL/eH2p38GWXUeSRV67aXCMJR2HI5cVf7xDZZcaroM5MmsDqAgNuEb4xY/Qtw2
vDjhdB9KmnQZvM7OTkrhb8zPTVUgmM5aysW5abWT3FL0jsrQ/tdNa75kzxEd+GRGHx/hpzuz
vMa21G31lY0/9ERWVK1SuM+6+42KRpJqM/uWRs+vpWFGzn2RMFxvnUSoKG2pOOb7l/svj1vQ
tgWS+RP8YV6/fXt6hjf2ER+0//b0cljcPj0enp8eHiD+Gy36kUU83n17un88RKIM25knl4rD
1iOiSchN4S6zHGNOGP7lz/vD7W/0HOLD2WJl0PKVJXME/b3EINHuf9Siv6g4qrChP30zHDMA
FMYtZXATrxb2w4eT4MoU1q7qLFwn5qjD54pLFssHtrg7ax2X5Jd0MIJfS79NP97ePN8tfn2+
v/uyjzZmh+VZWpryi5/PfqGt2Mezk1/o8ryG3colrSHORu9MkU2ETfy1v3093Pz6sHe/KbNw
5cXDy+LdQnx9fbhJbD3eAaws3nsddwke4hJjz2S4lk16c52p1k44ycZKhgV6fEOcROpzOO/T
H0Po77ZJFaU4a3GU3Hp/+PPp+XcEQRNfBiBtLaL7RvgMdpYtR9TR1jK6xInPjoVy50X4qRs+
uZ9RCSAMNpk2A89bSr6LXDqSfDaf/Hha4KXUXYgI+yaqU+AHBf05M7TjT21g2rFi5KdDOHxj
AQeVzBhZRJMdejernQtaASRWaZI6ZPYX5imdtdW4O/AAtrMOgLWxzfiwZDp4qsKHTMt8KdLn
bgOj9Zf1o0vlrv3jydnpp7HL2NYtN7qhmLsqIuSCo6AFJ+JbOlf1p1ZbllHUDY+0csuGuqPF
LAvzcPhBKmsAAbnmsZze5HkTTso1YOGWrJhcnX0ImUvWUI61WSm/1GFMIQRuyYfg+szY1tVl
/4f7wBPkA2xfSXLiZ8AiAhEV4542J0s++CEmmfPAuuc1fiZjFP78Sjh8BkLGsKq1IUbY+OmY
QCqktlL9Z8IQln8NtKeU9dobk7Fa15QmMlOupVsaFfM4EUKRTdS9Jm/6r9xth8ExhB+768L9
okFY1r4K6f0H2E7VdfhFZkDw+p/H09b4fb/ZdfHHotmnCPa470At4LrKf1pDqQQOVpQQ0Pnf
4omt9uKwfzkk999XrNIs8XxHb1xHETOcs2ZbmrHLeGB5sGG5hWf/JlYDLPvj/na/yI8QJ+Dc
EC/aXHFGVaeQZkqiA6gvnb5g/S+c9BdyKdiRBaqY4aefIg8CKWjRBcoj0dRZu4uas1o0kwa8
apV+4zSQ8JsgNVLHwwZJqSxlYoCykrFNwiZ6YV0caruGfIbVABix0Y3hoLETPF/RFH/3OnzH
fPLeTcBVLqTithwENHt43R+eng6/Le68oNylggId/4+xZ2luG0f6r7j2NHOYb0TqfdgDBEIS
Ir5CUBKVC8uJvd+4yk5Stqc28+8XDYAkADYkH/JQdwPEowE0+gXt2GfP1GdKnN97yo9gFENg
srmV5ACnBx1qP/Pa3yHy4sAxNblFsqGiRCsl9X56QDHOEh/A0zN3BMEB03k0Yk2U6+56A2GM
8KJkt2hw71iLKKtOmJJPUyR1GvmDvamndARLj0zdDka02HSd5B+Pu/1W2LgzhDfj9+9buyWM
eOoEAncQCAywoPJX68rpCuRmcVEgYXvSGiJusR3d7uA8jpyjSJ3vkboiZriPTlcMdjGWFpCN
70wqyGfnBq93ZJRB4K4JC2+LHFVAWJVq1W6JV4Ys5zGR9lcmKURCJpjQM7StSghmZuwJYNgw
cY9vuqHzIL5/iRF6LMoOouxSFR2TSiD45wDHOEsNw7d7rHk2Ze/2M9QYpvr3v16evr+9vz4+
/2tEJe8Ce7Q5gW28x4/ca+wqRedY4ojxbtmRzrBH54UOlsKN+x2VFBQ3hWBXtFRDi9LsQ3Ty
WhQ0qw8TXPfcMK6hoJuPfIhvhPgIXfkhKimBfoxMHhkfItyfMyQTEEIomacVl5x+mJgKZIQD
tB/rfJ2kH6LTPNcl5Lg2wcAFEKOrsmIpT9fJsHtDftgX56epWSXWHMKBq+2Bp5YwoX+rVWWL
+wrI89JWsRjoruSFf59YY/IaJdzO7iR/jdzhACbLO/KJAh6Fk24k32IawFIQyWJO6lspM2wd
wS8918c8D6TbSCChHvhiIZXvIAaEpf49SzYVTl1787goT5sBYdSxntw/JBN9+mbAd4WvSTrq
9Cx+5IMDBs+yvZUhSn64zsqtlxFGw9oM+CogIpA8IakX8NCNbKW/uOVVpizsKs3b0KDtWWkz
7Tb2pDw3YcWWsq+Re25PYbW9r0enfPD7jaLbLUlTiDy3xA2inIdOtsJvMPmkcC20sTgv6LuS
lFkCpv3+MlUFErRoAnUz0NW0QbdfRUT0DqVJdZ5NO/LxIqyQRvSDfcbF8njlkmdTgTHEy+gp
pRZH56l/tzy2hFkDE2XGR8BzNCqbZbYKoKvQNqiAml5lOE4gdd/WnnNAqeCtPh/YMMAQZO66
7/SWOH19cn3WOOwO4A+Dm6HkP7lOk2ENe1ZjKqHCSUlXbEF7Wwdy+EosGLYc6XqAGbPgAHfG
pdganfPwO0u4pfiVAL8CZX1SldgNBF+zlKAuPJ6LnE5Y4iY/HwCDeUGDJDlufTDonUB3aoMl
zWq1XC9GH2qjeDUbQ/MCvmfB89L50QtsSrAbzCevP95/fPvxbKvo89KY+RVF9vT2zWKZjmFY
LpeagIzT0/Q0ia1rG0nm8VweqWXhKGotMKwYfFs4ZtkFZghX0W4yuRHgIUPlXu5roUxYO7A5
Uly7KW9A2SjfW/dBKtbTWMwm1iVBLre0EBB5Di4jsI/YndzLxZuiXoNlItZSNiGpQ89FGq8n
kylqswNUPHE2OjPqtcTNA97IHc1mHy2XmM2uI1BNWk8ap/0ZXUznuIY8EdFihaNKFe2E2oel
dGJMk+1WkPVs5XaoIoH5tA2mgd2Dxmrh2Uo+BZFsJKslVRtH7hhpexyTu3p299bbe7uJVfCW
1PHMrtKAtUIKaYTBSyFysVrOLT7R8PWUNgukPp7U7Wq9L5nAtSt0s4wmI77UGYIff92/3XG4
Df79ojLgGceR99f772/Qqbvnp++Pdw9y4T79hP/aKXtbW3dnr2JzjKlPkOf3x9f7u225I3f/
eXp9+S+Yyh9+/Pf784/7hzudWn6olIBekoCUVKYOcyuHkCzgHdhj5Z8bBHWDU5y0FHXKEBs/
//7++HyXcaqOPC1EdqKloHyLgE9FiUCHivbgDxBCUjBCI58J0v/42WfKEO/374932eBe/hst
RPa7LxFD+/rqOnaie+eGQZtUJYnBmUoiyfbYyVFFINITyFKOOnuo3FFJn6xaUME7bexoQQGy
1R5WliOBhIUS7CqkMeKgBNuj8FxF9aAyxu6i6Xp299v26fXxLP/8Pm6OFKmZ0p5ao9XB2mJP
cS7tKfJCXFCKDDQkEGFrhhUTn/S9TR0WrkU3dPJIwcMx/unf8ui3j6IOOJk7mkIDxs0wBklJ
iRShRbae/Pp1pZgmsKWs7mtc7ml4lfFEnmK4HbobMstjBIAgBTh1aSM1wacIsCwP42AKtZI3
SPJF/hVE5hwc8wOe4LXaypfLOHBoAgHJ5IoUJAlcTYBkX1T8S8gLGr6BrxjVPUgnMZkEQvig
7jBKFKnrY2dscXLfGg6TkZlFaR0co5aCCPBnT4kdVjPA5fXNA++Fwy8Kpi282CkLMQqOuO/K
+sBq8hYuh7idUjcyzHgUTel8iUuAA8EKdwk6SZmC4cd0fSn3BRoiZ7WIJKSsmev8r0EqPgv4
80YFO1Y5tztWR9MI81ewC6WEVlx+xNENi5TLsyWwRw1Fa+ZHxMgVhsvs5vSvxa1OZOSL7UTv
oJxDQv5cRVEEkx6YMFl2GpJE1WTmGQ1lhAGftGa3CSwKgzQJBCl2QbMb/vkorx2c4L2yTQg2
HHi5cE4CUqeh7SPFM9cAIrSu0yg0UzgT2207VkWFWTP1oZEwL4xBHn6YnGDVqF/JcJfkZoav
xA3NQAODK+E2eYOPEQ1xZs13RT4NVoYPhg53g2tEqCB2FXE7TL1IpU0eGlJThpITP2Yot9A9
S4WbgcWA2hpnjR6ND/KAPm1vtAryKTjbTmikadNCXn/82uhN6Pg7ibs3AqY+phzTk9uljAp5
+FAaByy8xzwheIojqz6WHVPmuB1uWHyz7ewLpKVyBklB2ryEh+hyuXWDK1brszVSU0Mc5w4R
B1xNT83uRle2x0+8FkfkFNxmp0/R6sbJsXf6sy8j1PXXLnAkZztozEKN3BIYXhuAJ9btGX4y
/3e7P9tB7Hy3sdzjdhuJztxjSwJdJh8wcpfHlC6w+VuV6rNgVK0CJxRP685nkxvzw1fxvHFY
7VN2o0hGqhNzn0nITlnIGzk75ZB8ahPQhx12+NEhDpf4RjNkG0heOG3P0mbWskD6NcAFX1OQ
2PlVrDhfRW+xG47dWk49S/1BrFZzMCbjRq6D+LJazRo/aGC4DTKS5jdWT06kKOSGSRoQfviK
1XSF3o/sOhnkgi4yhq6x1XQ9QdY6acKOyPEh2EdTWglZN1p14onrva/fBGPoazxWweLghfvs
25BABuGtISHM+I6zfOclk9lLWVNuwmiFFwY2ri2/IbN/ToudG6/7OSXTJuAL9TkNCiGf08Bi
kx9rWN4Gy6H+tnYLjyQ1HodDIUqWcqNswWMKr1WWkCcdwb9ZZTfnHCKGanZwhVfcSriKpmsa
RtUFvndVq2ixvtWInAki0MVQJc6sVYvJ7MbiqsCduEIrEySTwoPjJiLU3n+TxQWzg41tBE/d
3AGCruPJNLpRHXfuC/LnOpBxRKKi9Y0eQyaoaiv/OKtGbHGukHCwI9Nb11yRCYpsQyKj64gG
QmpYyWkU6omsbx1FATEdkLNb+6aoVdY6p5d1Jtn/AxN49BJlleUlYwQ/N4BJArnsKHhyB7RT
OcfeNLIaUbP9sXb2Sg25UcotARHB8iAlKb4P1SnqRG3Vd3I3efmzrfYh3y7Agvch5TVmLrGq
PfMvuRuHoCHteR5iiZ5gekskbXiF64EAEZc3FCDikhelcNNnJWfaNukutHdukyQwyRA+sQlk
AQIJbngUzgZCiNuLC6GQ7pzLBvgIXm+IG7jQVdFmx0Z5IeEilE0FnggVQ93mgMx3ZVLAPRdc
CkXemHQDvr9ArPIQWHQu905EUwrPh1YcEsYA8UgPCZmQAT5y93bUNV7JDmM0M4B2VcmrybQJ
FJIjvJRHvCkzAFdLBKhFEK+PnbbDpaackoR4MHg1J/eACZGc4JdOSikhzlZ+TxR4sQx0Zase
sPGKcFqmcra9EgNaGdyaM7kESVI536yOJlFEAx9Om9r/rLm7BCvt8NFkF6hUC/KjelVGUrhs
B2sGChC9gxT6GXIyalwnL3WF7e8aGShYJwgUWLOso8uvUtTyhtug6fVYRSSncSr8MideMwF5
q9CvNODxLte+XERxBX8PDFWm3IrjK0v3BzzNCqGfTl68EvxHpMSAxkkCdhycAtCsLEMFVFJN
1z1QggsnOBEAzG2ccgRzQco1DMwR9nji6iOR7nsbN1hz/3h7eni8O4pNZy5UZR4fHx4fIE5X
Ybq4KPJw//P98XVsWDxrga4/okxwwNn2EgWawRyQ+RJ0kq3iCBMBwdvXD3Nz6qr3rih+zTlY
YueBV2AAE7wRSuwazWxV7xcHyz9W//YdVw108CS3TvN0EUe4aXAfTQ7uvg0Qv4kucvzhHroV
IzjWIJpPQ+Eu7qhnAS9Zm6o7C24SKj3rTSq1O3+IqhJozh2bbFAndds237CqJo5zUgdrKSYu
9Vhv2Hu4CUvwwfA0Fbi3ol/qkGEX/jM8s+b4LBmQSqSBnwLndIXxrzMgLOFEL0sEWxFf2VzV
cYNKdE6x8WW5qtNVtMIKSozKbeBMgSJfx4H0TgYb8PYw2CSMXcZTchUbUMroTqzY1e9ewcrN
jmDngjN2wrnFyJ/tGjV52oXcJ0ToOYpDFwmrUI3vejbJl0tCsDVg0yiBk+W5c1f6XOdbuG6W
kBh2xKHuzaQiF2rJ/AZ6TqfzCRqkdBY86w6z81NGmjvwfHl+fHu727z+uH/4CkkqB8dN7fz2
XSWisE+89x+yLY+mBkCM7P1nV2Eh+6xWC9KTfZJahzP8AjeUMQSu3x5UG5tc2LbyAFpWUT1p
/i+e/6lC562j++HpDfr34KVHkVwghQR8lkne4LtqSeUlM6Sk2pIKxA4Ulwjq+pp28NT2RoZf
4DU4hJuITW7h4VcvJFmXQyuQv3OesR2atOWnRb3buUgsQQV+tXzmeuwBjBxDZgWFbuL56KYG
iO6ZJzkfX7WHoHNVU2UTbl4FQ2uYpU/f//5199f964N2OPTy7dy/vUnAHaR7sbhTV1yd4DKq
Ant0TMkf3/66/25edFMezsgzVKpEy46uhiiBJCrYhVaT5wW4TSoROWV2us4e7aWc6OEHdinR
p9g0RVRXi1FtPPJBEK6kz4mVEWSfxP2vbhVIwdUbH1P5op2OG1WDqBoS+zSJmGwKXCLS+G3F
6y/XqyCnrCWR2dCC3WepIH5fE872qWSaEUKwJN2Qo3vjMEPG6k8Bu4dN0OKJi7thpxS/22n8
5iB7NLv2EUFrOBGSCl9JmmhHvgREOo3fb2lQKNcU58UioFkdahDYqWnG14huFh+ZWVI5ld4e
X5XmZVjO+CS09rk1zKYG48xAcddTiy09EofVv5q9IdQy2e2ZWCFfV9wKY1rm2P1Q7SUUkmJZ
aSogB637znJPpv6KLbv1gMl4kqTsTKpgOblnjfZeG9lFx45GAfDYLmm3WA6zY7HuNkkJ30Tt
JgqxFULor9oQbf3RSgORGKrdjNOAG2RfyY7viAit8AucRJgCCc6+F+enPKhLH5RGBe9FjBd1
rCEDbemXoJDktlDPewJ1kl8hkSOjePMKiUoBuSWBt8r0cS7/nwefWFMk4R1D48fbp3Fc//n3
e9DV24t+VT91nOyLC9tuIV+ySqfgYSCrDcS2emD9oMghI6WPyUhd8cZgVBuPcr96BqH36fv7
4+t/7r0YN1OsgAdDA4lgNMmn4nKdgJ08vIeFTfXFHrdQZhtdQMoFm0Lnxes/1MFakuBSpkVQ
zucr/D0+jwgzqw4k9WGDN+FzHU2W+D3KoomjxQ2axGRnqhar+XXK9CDbcp0kaNRwKBRbBfKV
9oQ1JYtZhD88aBOtZtGNYdY8eaNv2Woa416JDs30Bo2UA5fTOe6xPBAFztmBoKyiGPcj7Gly
dq4De0pPU5RMvYN243PGoH5j4szTrOYFtBs11sWZnAkurQ1Ux/wmR0E+Q/xkGpggi9u6ONK9
hFynbOqb35PnXRQFtI09EZ66x9rKLLNhoV6xELF1qHWglqRu3pYBs7kE3tTsKcAVRv5b4r4c
A528EZMSLBXYATymakWm83giVdHL6NVnhEo9e6NCBK9+ER4H9f3grfYwUKzywOutw7fUtHNc
7BjItvBYIXzsBt0pU/+/PlL4+AhW8YAfgibQGQqhvVeIJGPN10tMT6Hx9EJK4nMSjKSJE/Sq
6zB+aC9O1PXMwZ5E0zRk9M2R4VkPQs9FoVhinw5UW1fPfOE/veMQqIzkjnpRQ1SAq7wdUIIv
I5uKlzXDDTAW1Z7kZxLYIi2yw0b+uEVUMikqowH9hkjzUnsmtMicsFfTaWAiQSuGvttsdiEn
jayGkWQZzZpxfRoenDJDBNYV2B3DLKwJNxnxAnxdOWzaTLrHXUayY7NcLtZTcOuBt/l8NI2m
y9W0Lc9VX94XIzMpDlz5uFw8uZ2ITkN3ZUzGMHDCYAyyeYw+o5A1T2tEkBkTJgze56z8L5y5
APfRdlPnApmTOiVC4a7OCVcZOurAy8W9ICvl9dxQBtt6aOpP63FDFNj0s/VTnHm0Kot+Fs7A
CzQXRoKRpJqCZtEEk4kN85diMY+jlcMG7qg0ZTxp5Co7jHtzVP9c6wLdzieLqeSyDPMC64lW
8+VsdFk6ZwPLjDAnvqlGbFYdVpM5dEVnNB4zT1XAW72Q38DwkNfehKxlc9si92Qfb4E36XTW
jAZKg/2jo5sFMsW9ozSeJ0yupgRs+gnbkFGXk+oUL+Q06LWMcLgiWMw7guCHNN3Sqsigq4xr
L3YP5CZ+AYg82DzIdjIddscOovbdwqOMExOP79NH0QgS+5Cp4wFuYLg0q5HzsRZ/32k6+J/F
HVzwnXwfTq5aJDGKR6F+tnw1mcU+UP5tEjc4YFqvYrqMJj68JBXcTJ00GApOQSpFZlOjU74B
WfgfvxgeF61xJpZRy9D+50QMShx0SE3pirbXWkTKDVqzvqiiBY8do/RFdiRjfnSa1nL8df96
/w08VEbJWnSsbl/FCROXIcf6Wu51tev1aBKxAjjYcylA5EWuk2RVofeevxToayx5u7OfQlWK
VpPMe+ADDRVggrdHorsm1qinacJOzlO+8vdBA3TqgsfXp/vnsfbUdEg95EnteFWDWMXzCQqU
H5B3FirPJLgNg1eZwOl0Zh5/BBVqC+4bmAxqE0mQKOxUbk7lto3RRozCy+wa0ce1LIK8UiEF
1ou7NrY65pCQ/hoJa2qWJ/Y7njY2Izmkta7qwIgRpfpsTyYRLNoHlSLLTx2EzlINb0g7qaSc
zggSnB2BvidtV34OVFrHq1WD41LnSUBnWHgSakpWNJglzZBApquU1PCoVqeHzH98/wNKgk0H
+F5ZzMcpO3R5GOeU12MW6xBBHuwJeo6JPAo3Q64FtOr0u/xJYEoQgxSU5k2JsIWg0YKLZUDD
Yogk425YlRD0GVRDY06FTzXZuamIXbzC+T2zcHDr0EzuLxGbaEOOCTwt8e8omsfOA7FjWjNi
1/oHsVV+NJBLYRxFS9EGlpc81q59oSrxK4FBy0UjWfx6E+QvuT1BXkK+47RIC2ynGhNh/XfL
QCZDT4diYWhdpXB4+MfpcGpCXua8tl1UK+VgN7BAWmJ8W5YhA4J5w+DazPEy46AFSFI0H/X+
3D1/bFs3O6B+z5IXGcOWzEDm5UkfEJCLAQHvmLwVYAgIDkEbMs7lMUgDJy/tVyeZTtcLJ806
aLJ4yIVSFPmlHCd+6gzYiDg0FL3kVBkjAupx8K+AJytmk4D/2EAwCwQv0Sqe4TsPLzsfYUxR
dnYSqJR0tZwufnVKsG78BNUQJ0wbDd2TfLTTr3rrh06tqaqp/FNi8yBZQz2PZ8UgsJOb9VDu
GunFiVHpIJAAsjN+xRSxFdqXJlAGKkU3z7dOdwChHyDCrmuAhBdNHXuhBGbH3gEo+/v5/enn
8+MvyQHQDvrX00+rMc6HSLXRQrisNE1ZHojYNF8Im54GAvn3VYq0prPpZBHoG1CUlKzns2jU
P4P4NUZUbDcGZmlDy9S5PQHKpIf1H3yzKLSK1ppI8vz/P16f3v96eXPmUr22BI/SvfjAkm79
z2rwOCsp1N/fPiEF25v/GtudbI+Eh59k877Do/kUNzL2+AVuYOvxzRV8liznuMHQoCGBTRAv
b8VXkCKk9FTILKBTksiS8wa/8gPWPGkZxAsu5vN1eMwkfjHFNzuDXi/CTH8K+ZBoXOn6Sekk
hPC+emCCBc2QlH+w3fzz9v74cvcV0tzqone/vUimef7n7vHl6+MDRHb8aaj+kDLxN7kt/O4y
NIVNzN1wAZwwwXe5SjjoqoI8pCV54wRdjiynQ3YFIS8aScZ28STMACxjJ0yLADjfjAKwA8vk
3vA/xq6kO25cV/8Vn7vqXvR7GkpDLe5CY5ViTZFYg7PRcTtO4tNJnOM493b+/QVIqcQBrPQi
Q+EDSZDiAJIgYEnQ8etcPQmM3ksN7R3xbP/YgF2t4XDrU/Zqoos16EZLaVehvS7zVPE3LPhf
YXsD0P+LGeN+frZj6Uiz+1xLiYtz3RpPutSCWdKNU3G8bLC6109ipZnLlXqgonnwSIpTYvMd
gtWkA21ySHWvdiHNXkX1j7X4y7d40FhZcF7+BYvmF3qtUE8d68zur1ftZKS4+l7pX/3VaAEt
65HD1PeA9vD5SThC1ZUNzBI0PfTAc7soQCZU53iHpUkyY/YOIjHNg+siz0f0XX//+vxirmSs
B2mfH/4iZIUKukEcT4vuJVvsi4emN2jdZA0EOFvyQ0eEXv/+Cf3lw1DgpX3/P8UkXikJ94hU
9VSm26M0o2F9RRzimdCVi0IqcSzRotVEePQy+0y6KJfYwYj0GFBz1Gizi/aLmvf45fnl582X
+2/fYGbnmhkx6njKaHMWr5yJygpx+dZanpkFucl76vsLEK+AlMsscRN30oL6qTAextnRkuE/
DvkyTm4DYqkR8KBP9pxsC5rNwfquPdssKThDA53g0JsfKFNvRzn5eI4DWpHgsJizzYEMo+GP
+UPiDYT2MZUWilw8T1OrXbE4MkSxKVML6LvkoyIOn0Y3zDbxcmKM6gWX6fHvbzAOTalmSzxD
hiRvadMZ0bBox0Vef62wp9eVbwJ8k4q3hTqV9VXmxfxeRQyZMr9ejzTfBpHbnI5aRkJdMKpX
9/52Q3kwn9EYVOXAkGkMAycOjcyWS1frN2ni7XZzmWtBkTCqYoxeqy4uastiyxGhaP96qror
fai/1sF4vAF0lGCxLhQXr3nmexY3J6KbdugXoCYPuuSQEicXz5WW7ur+8d+neTfV3IO6q7YN
8DbJCPMdt1nsyId1F5Z89DaxcnElY+6JOkNYOeaJXRZq/Hz/H/mCCpiFHoOuMRulRoI+4s2N
Wr4AUDQnoMuXOGLlma8K4TPNHIOkkF9AYXbpLaGaIbWrVzg83yZN7NDTppLcpzuzykONR5Uj
JpoZgCiULmAVIHYsKWKXThEXjmS5wE02puQohz3nJNhlKBGhV6KmE+gI/pcph+4yR80ybxso
F8AyPKelFB+Ja17gyAIEJkhdqUQ9maGhSLuOGbYsSl4Y466+00sQVP1pdY9ORBCXluFZFUjy
DOPswniT8uKhc0SC1UOJYALdjMXbTaAc3i6Y6AaEyDKD3B0UumsWxukeVVRd7EAdOlq8tM5M
Y2o5pt0nAzqP0XAtdfrWQ68uplQzoFul6PA+p8OR6Hw5mw7whaDRp/ZocQY1CywMh67ILBhk
qRZbI/yaREKEQVcvD0U97ZLDrqBqBLqEG9lOrDUm6hxBYYEla+0AS8UWoybp/dSMQJp46xAA
KgheZNLVsX/hZpkfqv7uF0jc7HLnBmd3E1rO5yR5uAkgUc2FBT7sxg3Opmgc2Do04AVEZRCI
/IASG6AgJj22Xbp3k/qbiEo7a0vR1Q/Ku4OYDjf00nHhnC0qrsgyMJg0JG1O+EZVf07HStES
BXE+jNirjlnE5fT9Kz7sJWwx5kg1ebRxpaVEoSv69oo0rmN516DyULqDyhFSBSOwtZZMuvOT
OLagJlC5sujsWoCNHXAtQOjRAgJkec6j8lxtmjGLQs+lCriN0YH21fxvXeeXPGXSuMHeOuGt
UYz6uhibjGgD7nWNoqM1CUFn556sUD6GpKPBFXdFU+h0dGo1Ng2VZxXcYlyIK7niHtcJSjNb
vvn1yh2VbRkFfhTYTLUEz2LdrL0s03OCzXGTk2UwUOsPDBe6K+l3deDGI1l3gDzHYtIxc4D6
kZg1B7JHUPmJgBrtfcH21T50LbcWl0+BjuxwirrOFQTkJn3B8ZQV+7Qpn34usdDfZOQiu8DQ
8QfX84gOjA4hkl1BAHyODyzAlsqKZbDEEX0XAc+ls9p4HvEZOGApfOOFlsK9kBxyuISHTkjv
hhQmlzLgVjhCcoVAaBtdTxuG/tYUmwMbcm7l0C/isnGeX5XsuxH1uZqs9x1qqmFZGGxIiYq2
9Ny0ycwurn+NJvSpHOomorVzieHaSgFwRHz7Joopakz1kyb2SWpAyxtfa9y6IccBLMkk1dIk
sLG0WFcrPBZ9S+W51njC/oMQGIGNR84rLcvEOUo1su7a0tlmDAYH0bQIRBExlAGAfR/RUghs
HbIH8kPJLaUQ9bOJgZmksd42SVqWF12fHjBcZFaWpK/XC8/gBx6txtSNB1sZ6jBHmVXJbgyb
lJiaPOdpjR6pydlzouB6j8GpYbMhPVpLLHEYE1LBZmED+zri6wES+GFEzHWHLN+KwAyGKAjZ
3GstPO/qkA73cPnSp8a2dI975l4bGoDTHw4An4phJuEZndC0gNA1uqZwI5+YzgpQqjYOOVkA
5LlkhE+JIzwpkd0uEjVjtomaK8iWXIcEmvpXlxlQ8ILwfF79S5rZIIf3yzz8kEzM2Kh1Z0PK
JgyJUQKKqevFeewSnTgBZduhhhYAUexRKaB1Y2rNrNpEXN0RdPm4SKL7Hr34RsTmlO2bLCBm
btb0rkN+NY5c6yicgRrZTS9i1FJZbn6xDUaH3Vl/+OV+DPjCOLREblx4mOtZ7lpWltiznGAv
LKcY9icuZZcic2xdYg/HAc8GkOOTI9dXEmCpoziwuCJQucKWclsp8cCA2pcWQQAr9krAmquW
UJcuDri5UTbZ2K3jkrfKXF1IJHegMwEtioZd0eILoPmYG3e1yd3UjP+WbNMX9o6KKLWAp6Hi
r47R57fqjGDhyIsyOdRs2nVH9Ijc48tVi9N6IkWZVIN4BnJFCDkBPq5CBzNqSDOKc767qOsu
S5gljOOSzi4KyfrP6omc6OOd/3Wleka1CFyrDFV3jIXFHWNTdkjcSzjPJKsT1U+0wMYum3I2
LrnR3RlY/Y1zRmuVly/KQyw5N2Sh8tFKxFcOBNfMw4OeoEXShJMcBkZUvc/Kdyj2XE4Jy/Z5
J13HLJTlTct6FbcAbXdK7jrLM+ALl7D1n/hdUdHiEKHmvgv7YhUjHH/evz58ev/80epiaOxK
tsr+hSRP/VCgJVF3UBwczC9+Fy77BTXFMePr/lOSYW2CPAEpcuoWbn6WYkr+rqoGvGCk8psj
FF4TKD/JX/KSEnfl/vl8vbJJ9vaAsYBpiZP8KPyMIK5c3dRVg+bIejqFIQK1xspQpNkEW4qN
pWR+VBgXerljj4E0QD2hLJ5GyLKsWJ95ZEuiU8ylLtQkkEaQM5a3GiOmTTJKF42npIRpRrCs
wzX0HacYU2tNqwJVUisKdbFJxOLI9UpNJiDqIuz7a91D2LgYLZmhJ2FLyXwr7vp6mvaot/wF
Ch2zjutnATXA0YUGcuRtbBKA+hbMxS/8GGNgNm8yET9KI7NhUBGk81+0FrVxgRpHUalmD8Tt
Qlz9uyTZ/p0mBnS/oofNh08Ox7baYpgOWz9oqyxy3NiKw6wzJZ4xnhaboT/+vP/++H6dO7PZ
Y+pqKJBVfXZ1KoCceyLq/CXL/uXx9enL4/OP15vdM8zIX59Vj8rGxItLM7mGSCyyStJ2HeXB
8lfJ+qStMmIJUwXhuctDmebSMhvR40w3jlVarxHin78+PXy/GZ8+Pz08f71J7x/++vb5/uuj
tECNqZrFyE2Z1Vyzat9xW4ZL7iaqjBcgpxufG2ClQ5WTETNFWnwtpmeu5LOy0No1ilzVRWuH
bc7sOcadOKOg/BGsTQiVzV6SYNNfKM0cadYkRBsiWbKOQCbRIFll4b7gspgrMJLukzm+1sNI
usiO/tKzhr6NURivVFJxbMufgn348fUBLaLNaELLnFHmhiLHaWOgPSWSQMqKhtO5D6OyLs7a
60WDZ19nuTSGEOCuuRz5CIJTTatMnstiKWLQDEddWJkBXy1YHGYBzlU+6lbqAvp6lkClvTAh
iHeNZ70mM1F9CYjAvgo3MGuDpi57kWf4DmOsMqNkofu/PSTD7eWJC1mzus+s1s+I2YyE10Lw
kT7fZv8TPqszWGB7k7TvoHd3Odl3kcO0skVqHPdNTIcQu6CBnogbwgQRbR4yM0RRGFOH3Cu8
9bXPxy15Io3IQlj4Ndqi++tywSpCuTxCSDIgklbj2VOSzRfqhcEe6QxLvWJny3E22iO/CobA
IQ0rOXgbO7FR0TZgIWnMjOhYbaLwvLwmUxKOTeBQR6ccu72L4bNK5/hJeg4cR3OtwFk180Wk
sWpKGt8PYF89wn5Jm3uEMbf6HSFF3RxkEdHuyHUCui2FbbdL3wwIMKJs33hRq124TvXcSG8l
FKyPI/LBmIQr5udSfsbn4vSt69l9CgLTqXa9yDdeVclt2PiBb8xWtKcJlaW50n3tjyr4lD9U
77o2sblfRLkXy/lLuqHY4TGP5TxryK7EXsb4H9xIlfJEtHu5//YJtT7iuXWyo7TW4y7BR9hr
V5wJPNjBrj+M/3ZDaaMC4HiCveC+GDpqGs3lJzHwY2qqvpryUQ6/gTGG+ik5nC8vyVWMW6s1
zTQWdYl2tGqGt804v6E26WW6QPJZCoBlil4nyLM1ha/uknyCFs4nDIV0og80kZExrZ67opm4
FraUr4mmYJdHLY9fH57fP77cPL/cfHr8/A3+h69iJdUIk4s397DrVy57FgQUYDekL8QXlvbc
TwyUhW1MTxvINyS5zXs5wkmTQ2egzhNvfkt+vH96vsme+5fnh8fv359ffocfXz88ffzxco96
n9wJMa+2OxyLhA4CwUXekrePCB136mMETmtOu9JeMVBqA8tdKcKHnD7d5JW27Dt4v94lO9sd
LOJZNQyHcXpbNPaKDlky4KnYPrdEKEemt5YgOYilXban7th5swh3J/DV1I7ac++Ycx/Mn77D
nvDnTQ/7ws9at+OMU32UXcmv9LHCICwUUrVtV6O3BCfavssSiuVNDssDcyKnKZzAkS0FVx74
Oxk72OVOx+PZdUrH37Q05+zZehrDwt8n3i9Y4iShc4G5qJ/qt67jDu54Vi/1DLbR2fjMrQtS
VeCfhm991XlA5HBBlC9QLY7zb9KXp/cfH7WPAY2BvqDP8J9zFJ/PunD5oUn57JxbguTy2Q2+
5eJl0iJ2g07n9lWPl8h5f8a9wq6Y0jhwjv5UnvRicWbpWetvLA7oRa1xbpn6MQ49an+DPDCJ
wZ8KOLRvA8StI7/B45NvN+6rNJlY5gdxFEYaWk2s7IXRrjEVJvkxCsh4j7yVh6zfHfR0PNQu
FNjYW7Y5jyVlUSrkae/ywZi2hHs/Sxp8rDu7Gpr7Sfly/+Xx5s8fHz7AIpHrbgbLVM5+Wbv4
SkYdWqewHOVqcCugtR2rSsVdIRBzi+IPEL81ORYjqY5IRcGfsqrrocikpXwGsq6/A0kTA6ia
ZFekdaUc7M7YAGt5X52LGi0DpvSOdHgLfKCD0yUjQJaMgK3kfuiOFXTkXcHw56Ftkr4vUP8r
KIdwWGtQ4qpdC0MOdLZWa9i0Y/sZsTYw/GNyrDjIyOpizV6redePSuXyoiyGASRW3RchO8wc
+MbdIkeT4LaZtDlGKZPsVnhpkCXABLPCM2qlsarm7csq9ULV7OfXAsBgX+BrrE3qvqE9rmDC
O9gPeDYPU8Bgc7xW8knWpXbt2CVwMGi9pt1YrDJQV91ZOs4lpIOW2ejm/PzGlmELHdTi7QWH
TXW0YlVkeZuE3ayInSCi42/w3qG/YlUKteuV2M7szvWsOSeMDvWALUEbxiKSHBOLFylEK2t/
sfnJwXYtOpgUKmufuL2zBBsDzM8tyikW2XV511n7x5HBgmitKAM9wnb0zbsw/aqWjwxrpqCR
NrAu2GDui47us2jzuTuzTSAraZhkftmkdWVUTw8WywLsVAX6Te8aqyRNCm1zpo4fcErC+L/j
vijUaT85dNOtu5XPbCWqQ1JddX0YYQA6kT4sm8ilH+3NM+NUZ/mySK6zJBKzOhnxucqxyiRl
GhHTw8SaHZ1qxVdPHaYkywmJgfQnRUdZAf7O52r1+ibebtzpVBc5ncWYgNpMTXZSKXkfx6Fj
EQHBiH4XexGCOL9U6h36Dj3CNS7qWYPE0sdBcLZUcz4fvJqBdKRmfjjNe4hU7DHwnKimjnBW
pjQPXYfMGBa0c9YqpqawkI2MDiuPek6nreAzhHtVqQt3O0WXwN/4SAbd38HwpY/9Vx7bWiqx
ZPWBed5GunbsDq36OAoJUzeO9kOzsVXUYOFyHVRjwxHQXns+WeXrS2g2FO2OUS80gQ1j7V5E
PBDZzEPSEGP89viAXoFRHONiDBMmGx5A54tCy4bDmSBN6lt4TrcMXo6Nh1HL5YCBs40mKOrb
itJBEcSjwOFOzQZ2kPBLJ/KjS40mgg2pRGjMXdcO1agcLyw0UUeJvcCDv1KXuagL+v6Pg+9E
KAbtCzVpZXGizvFysOUHufGIKWo9bu8KlXBKaiZf7vNc7wZ+JKlSKzSn0khMI7BT1e4TLeFt
0Y6gVmuBUxCpM9t7To4WRo+ti7Y7Ume8HOx2ldkvF+qUv7EA8KOXWuBClz8qEodDk9ZFn+Se
Ae22G0fr6Eg+wXJfY0+wfkCuwhmxnzSWuxLWVssgn5oKb3G7kqm1g6kOpohC6+887uTSLZRS
Wks8SsRAQyDd0CPWJy0aSdbdoHwsiaxVX05bsAQ9Taky9ujOOctJIh4qaJPJglzWFWs1Fk74
YxNo4cBYlcqA7jFo2IBHf9rE0A9Vk2g1GBPoQLc6jZ/26c3OHx/rcWlknGEPglla3Xdx6ND2
NRnNCdFB87iHwxoDNyWjJegy3jImA3vT3WGuymIm0e0fk1XHTpsMYLNfmGOY7WEyoB1iCBj2
z0w4C7IyoVP009SP1PUrn9WqCmMO6UWfq7axRWDOp3fF0F1p0Xd3OSxo+qworOmn/SEl6RnU
Bc2N+S9tXat7xaMuufhz77yVNBgwjle3zyrbQQvihlbPw41hjJZ9Mk77TIkjoAVCk1IIqxwR
SxWYeIwALQg70vtPP78/PYC6UN//pD1r8sz29L657XqOn7Oion2kIyr8yNmeAXKOJN8RgWq5
gM//5eeTn1Gwn9xpIvv57fGPjJKV3fVFNh2ykZ4OsSgMSAUbXdoSEBkOdV/pHjIX+KRMYPBz
Ou1tRgYNeXkLugWGppPusGeKZubEXSGOr08PfxHWTUuSQzsmZYEujA5NQSXdo4vlbHWxnBNh
j5fMWFU2U2MJ07gwveELVjv5lou/C+MQbKlNS1uctPkZf4ntpzzeV+pkWz45SzrgotGCxofe
6jP0kM4Dk/Aaou290XgiWdaEvvzAbKUGOpXvbx1DOLHtpfcjMx6SPgE4iiY2nq+VJBwBekZR
M91mJMd59H2ekAENQKiwkBdUtjyZibAXld4R6pj8Zm4l+kTRQUAan81oHKj3YQs5ttz7rA1h
sVS5MISkCYmA1QMJ8dFzL3bsgjI/2OrfaXa6oVEx8nAg75UFtc6CrStbzV16T/C3RuyYJ58Z
ibIouyuOVKPvlrXvbq3VnTnEA0htRNx8eH65+fPz09e/fnN/5xPtsEtv5tcqP9D9IrWRvPlt
1QF+l2cR0ZSoClE7Go7iUyajEmj8Haem/1AUhL08ffxojl2cvHfKCYJMnjTPwArWwUSx75gh
xYLvC9CV0iKhtVCFlVRYKcasPygbCxm7NqAXnsXge3UG+fTtFd0If795FQ20frH28fXD02f0
kP3AzSVufsN2fL1/+fj4+jvdjBiPCzZ4RcssbZYljXCkS4G9ajSeZFmBJsYVqDeS67oCVK8p
AU2qQvPM4ZBqkKHxDCybFJfESMBX2WHsxiYiVg+FtM9YN97RxOWY818vrw/Ov9ZPgywAM1DQ
iI+CqObCD0ntUYpDBgRLvHpkrVpWigdfZPe6sPRDR98LXDhsAWm4jMOR+wo0hhRqqSigsSIu
qZI0Dd4VozSvrcg5ls+4F3o+zmfXJH32J/bTgmbQ5w6yh0MZlx9hq3T1NYqEhZFnptnfNXEQ
ElXCN2LKCb0EzBaxRrNys9CrDT+MQeZH1GqycFRj7Xryu28V8Ig6nIEemGTui0NdeRXIscTE
UJj+CU98nafZuCymF+2FJX3re/Td0cIxgjK1tRymLzxl42vun/TWh17qEp8U6IHsyVLm9wKq
AYvGd0hfCZekxzjmLiLEkWtf2YcWNxJp8bCgkvlxI/PLIZmPoCUSXULQbQMMvprnesS4HP7H
2JMtJ5Ir+yvEPM2JuD3DbnjoB1ELVFObawHcL4TbZmxiDPgCjtN9v/5mSrVoSeGOmAk3mVkq
laRMpVK5rOCzpk6fXNwcZ2YWEnFWb49XUBgOWm+NRpwooc5NEpf2J2N5O5QwtBONTDAa0Iw/
GWGCuSB8oL5LENxcWJxk+hnJXX9CORHKFMPJyPJxd5NbfRDfgHIf/XitIyjI+A7C6cjRuJNr
tLbw/rA7JOB1FIjOjsWyd1cwQkxFw0nBp5CAD0Y0fDSlRiXKo3GfPCG1YmOICYqMNrN05HQJ
fsYV3LXIQ36Rd3OKvz/E95GZz/J0/AIq3G029Qv4Fyl62pgZU+TFK7siwJ/lYRi3hNDdgA9D
c/uU744XUOstTOpGTGg+Zt0NQM1Kv3N6R+9aOeD8IcbIYi2Ebc3hRMdYuXGDPA2ZtKujR3bo
SMVCF+5wqCQcDqI5pqAMgq1qOC5646UWPILujpRdRj37llj9K6DN9ohLcfDmXkwXGEUKF5S6
ikJvmFkirkpRDNlJLI4kZZVCnri2U2hir6AOdPzxrFStJAiMfOAisjV0iKji6yiRItx5a9V1
tT/D3FPLpnL71YJpVOQMM1DIW1EF57W4lStiAdcrdwjD1f7pfLqc/rl2Fr/ed+cvq87Lx+5y
pSIPFg+pl9E6sEBhPExq89rJCzbXPMUa3GYybhwltgS71CsxEicamS+aGsY2S2dDkAYpdYPq
LLIkaotO5TITISbJtymmgVO4kUcBLmf82uPmqdQJlxiyAPOk1P7gJb8Bh/HAKZODjoQNCHH1
InFOh8Pp2HF4zRvuV/ff0/lfeWKwoUXu0spe2+ANVVoiyoPRwJJDTaXq0QygElnS5EpEjut4
d11LqmmVbNqnt3OZLEd/QDj/f0YYbz4lSdeWHOQSiaVOl0wSOAPag1EiWjn0ly3WoLXGWD7I
YFyxHvLTx5mKxYVG8wzr5PVl/Q2g3qogoLPQbaDNy0V4bRpYwrIXwuoD6ucnBFFRWgrc1hSF
JbrCq6qxgvCg5GDEgnCWSEnUGxkSLRT7T+qQG6coBBxhE3KomWjVOM83BAHMW2mN3cp2h9N1
934+PRGqi4dXbKhyNsaL98PlhSBMo1zK2MJ/8k1dh/HMPHNeiTVmBew6NwgA0JyFEqfzZy4q
/SVHXtrzP50Lmh7/2T9JFxYiOujwdnoBcH5y9Mus2fn0+Px0OlC4/V/RhoLffzy+wSP6M+2q
KONNsM3pAreYGalQIt9TvmP4mUepFd6mcFobnvfziikUjEQ/7Xrj5DyN0TetnIlKodeOrcAi
hJlnXZrSEq0ixCyUgxF1smkJ6sBh/dmsmEzvBtSNdEWQR6ORnGK0AteXgsotWCLbggK5XgAm
dQb11Jej4FrY1pmp4KUf+BypgiubJe6SRFvin77kHyA9Y5DifRtmvOT2U0HSl7gSVcF1pT0Q
g1Ph6ycrRmBPT7u33fl02F0VBpxFrDdRvRjhVDHqcmsrpQ27rC9n3nXZQM4qD6p+5nbHOmCq
AeTDjHQjzt+5Hag1aPFzihrFNhaH6OUmdylHyOXG+bbsdXtqkC3sVKStJ4rYnVK0oAJoCQgA
OJZT7QJgooRZA2A6GvW08p8VVOkJB5GR4htn2JUtcwAY9+W+wTF6Muj1VcCMjZryXez4CAIN
i/0971/2V6zwdzqCKFBXAHPv+lOlUwCZkvc+VbYIDAWXyUVBETpJvBevvDBJvabmhuJ3sbmz
1b7lmTUtbWI23eGdfFWIgMlIA0zVKHC26Q0sBknATceWnmAi7SEZCBazskpx3BC3+eMCWwaC
lmRlI8G4e9fpTno30Dy3qRUtovZt7a/8ca+rY6sd8P0NdkZpE3NedwfuwSFO/8ouwoqQgZha
VOxL635OPiFNbwG7V7lj9X0yba4SF/vn2t4AAqA6GqiOppXMEDJTvU/W0K0olGRKlLfpWvtN
kcg8T+v36u+sBJH6EI2rPqw61Xwcr9KAuhUrAlc+Cv5UmFJiwlF3TN2uA2KgSmyADIeUXzIg
RtM+XifKvqkcOpCGw0GbBJNu2tw0KSpIywfj/sCi3wP7jCyVZRA1saSVBc4a3pFVVcQCFR0Q
t0tY3/HjcPhV6VH1YPrn3f9+7I5Pvzr5r+P1dXfZ/x/eI7tu/ncahs0a5ieIeV1p9W93f7me
9z8+qmBvYYN+fbzsvoRAuHvuhKfTe+dPaOE/nX+aN1ykN+iT+fLrfLo8nd538BU1mzTb6bwn
7xXit55xR1qx84csgT2QHrK0HHRHXWvWiWodiiase2VQzAdaLLhgut3j2/VV4vQaer52ssfr
rhOdjvurLgR8bzjsUgsVdb+uUlelgvQbLv847J/311/mqLGoP5BzN7uLQlYzFq4DDeuulbW7
XRS4eEMsD2+R9y2rcAGHNjL1dHCnbL/4u99srQGspSu6Lxx2j5eP8+6wO147HzA6ytjMoqCa
a1pniTZjUjTGK5zpMZ9ppbi4jCDkT5hHYzff2OCyoAv3L69Xadzb+cQMwSykzFLM/QajLPS9
lj4EsdCltHSWuvl0IM8/h0wVblj07kbab1W4OdGg35tY7DQRXlRR1ijYAGUHKPgNg6YYtgAy
tph/5mmfpTDZrNulPFqbHSAP+9MuXVVK4PpUPh+O6vVH5OKFgSfhcJSWpvVbznp9WfPL0qw7
ohKO6+FTYZGN5MsN4EjgXnmOkrSAOZNIUoa1ZVRYHvR6Q1UVHQzUCPbCyQdDi+mM4+4stpI6
HzkMk3aBXD+NGNlBCgDD0UDqXpmPehM5t/fKiUP1M1deFI67dzIkHIuTkDAXP74cd1dxXCLZ
ZAmHU/rrOIrWzdiyO51aFM3q3BWxeWzPKsTmAzovt7RWsAWvSCIPS6oOpFGI4NwzUuqJVfKB
v5PvFzQKL5k1dD1NmLp+IqeB0hCyzOHZ9d7fdj+V8wdXxspG8wuOT2/7o33gZd0udsIgbj6U
Fu8tuTgxb7OkMJLq8BfUHmGdL53L9fH4DMqZnH2SF3/KKjsepVGiUSTLyrSQ0MrOXKDtPEyS
tCawnd75HWxrHVBUjffTFfaavXGQhxPBRC6aiNqVwhRFGsp7r94efPJVdoaL0mlPcIzQj867
C250xFY9S7vjbiRZ8WZRqtgIxO8bKg8PqqIWdap8URr2ZJ1A/DZyF6YhsAiZhTEfjdW9S0Ds
3AboAa3XVtxh63gxGso9X8CxeSxt199TBvuWdM9dAYwN+rg/vkgjXs3E6ef+gFoTOnk873Gt
PhHzEgYuyzAUwNuuZCNB5mvVdzZTS70yoJzU3Sl2h3dUn8klIE2lWtgsCjfT7lguyFhEqZYY
ikOoi+gC+EDedPjvvmIcigs6CcQq8ixO9uik+0v60eRIb+2sAJQSblpvR3hBmjzc+oUdbxY8
19A3ckC2BJWxn/4a4ZUsGz+C7B5T4kiOk5hWKnB4irQ4+9prCFPmLHGclASrCcswv50T9C31
eLKAhfBs4hQ89LJWQXilY/hRZEkYqinNBI4VizuLHwzHz7wsDOjUC4IAr/62K3r3FBRBtKH5
tSr0zOIioEv0VgSp07PVeBcUkZdb0kMIfBrkBWYkokOJqnLQieOnc4s7mqAoIstZu8Lj1QHl
u8GxRdCmc9QeRDeUG+0W3jxj21lqKfDiR6bJCIN38o8fF37H0oqEulICoJWEwNsl5h4s81lf
RcEPvGTc9idxBBMdKDJdQeKzNMMAlQPckFrilkQhCpYqVg1nZn7R7ozeaFyqHsSJl/ISyBh9
ui4WZex62SwJzTszdnw+n/bP0uYZu1kSKEFXFWg7C7AZYDTKBOoy6TYQL95dOdCwdhtutHPF
kwB+Yv6tiA66QmyelBloSgDJEzIaWyJqvNrlYyreDhUL+aU1zOLp0aDnhRJ+2sDzgk682xBE
OX212r6YvFpt0Jr3NTKo3BH8vY3mWX2Z6qwsLIJ01jzi1cMpTqt2OWCguNyvt18/D8wAQAAq
XcyDrYiNtGe3lWgWJcUkSACiQ0rjweOC09DbtJdJkiJPxI+VaHme3037TG5kYwQRIYx01fH3
5wNPo2SUKPFc6TgDP7aJGljdZBKD9R8xKvkEr7SbzUqJexx3xhTHpyB3YBSCmV9AgzGZkWy9
dfy5qTvI8DpnGfH4PEnmodf0VnXz4ShcADxfmaiDZM0nTZMntHea5wdcVqQM2YFluXoCqfS8
l/Nj5596BjRz6/4NtD8u6eWThwMbnrddYzy3iNFQhgTr0+aYCdChrhO9DToX+JI3Ug3ZztAd
ZJukEg6dBbcIDmKJVyMQmZic9sGC93kWwewh5YkLJHCTQa7+Eh0QCICILmofZDrdfQmHSu0n
+tpxdwR+LvS12lFpBuCKENZAbPMYExS2sgACW2Se5Fh170cFaEk6oK91zymkIl6sLBI/H259
NYNXiekrKC06WYGuxh628ry1MFAm3ACT2G3hj/zREglubmZglvP49KqGtvg5X13mJn3ZfTyf
YKG+7YwFyV2dNaUeQUtLJmaOXEV6Sn8ORkWqoNM+cTy6AWJChcCWHJlTgUIYuplH5SRZelks
D2MtU9rTkfolHECzlEazYUVhCZMv57A2Z5ZQoQq71T0cK7T44+faCEcgNTn/YZCTZ4n0BZYA
MbG00dVUoTQA8KOOUvv6x/5ymkxG0y89KbAKCTBFKJ+JoeW8rhDd/RaRxYSnEE0sFZw1Ilpf
1Yh+63W/0XFbjKtGRB+jNKLf6bjlTl0jok2lGtHvDMGY9jfSiOhzpkI0HfxGS9PfmeCp5aym
Eg1/o08Ti0kZiYI8wbW/pR1blWZ6/d/pNlDZFwF3mf+0L/bnawr7yNQU9uVTU3w+JvaFU1PY
57qmsLNWTWGfwGY8Pv8Yy5WIQmL/nGUSTLa0UG/Q9DkI0VgvJ0siSwbXmsLxQOGnLaItCeg0
pSWJZEOUJaywpYttiB6yIAw/ed2ceZ+SgA5E+4XXFAF8F4vpW4KGJi4tXsDK8H32UUWZLYOc
PrAiTVn4ChdzjWa5Ox93b53Xx6d/98eXVpspMlAd0ajnh2yeS+HM/Kn38/54/VeYgg+7y4sZ
ZcM1zSX3L5a97/nRHjNRhd7Ka2qYfr1rlGrQ41FKGBRD2VaYFHX7vNgr+cXuQ8wwONtQYmuv
/3dQ4r5gDbQOaH9P/1741zwJ+Fn6oLZFXnIhiH0qvl3UxeRKNRCmoIeywlMsLBVFVOYFpoMj
/V/9jEWika+9bl/65hxr0oJ4RMsxqb1kHnPFoS1XzC5lDOo0FlqJZklIq0dcLCfrmE53zj9a
1g0X8CZ0FOXfIL9KkOaggQfoYhvkEZZlo809GpEYtyQOLXMpOpGg5WftsSV3UnVSskYPpi9D
dTa7l49qDbDJPSCm42v3Z0/SJiU6YXG2jggq0G2FAJGfpuPufny8vCh8xAfX2xSYcU41jYp2
EM9L3dqnJk0CTPFvOaq1zcAaoE/ggiRL4LjK7H73giqZfYO5oRdKNcEho0w4POamGpvIi0KY
JvNra4x1WNGMvYSDL1OqAnDUKjIh8B/jJzUCJZdraYDpnMsz+ZaiSkJVkYiEu8aTDVj7IOHj
DUIhoMKTKiw/twewZL0s4xfI35RU69UMiiUNa1CtPS2wi2C+gNZujzsfPDzt+mGyJjhTRtta
4uOB02SwdwO8tTYWWvyhuPRFtuigl9vHuxCzi8fji3xpmDjLMm2ddaU0pn5hRWJZHA2Jo+jf
pJCuBWAbwaoLkUyWqsk/7DTbFQtL72tP3ZYErdRrTkuMtZ24arjbrg7sOByPY9iUWb6Ul6aQ
ZA1qW9dI7vW7VL9aws+7pdE2vWqaXd/fKlMrHgIJnyiWNAXcDKGCrL9BelUOy841N3INr2/M
KhqT+FL7pnhWiB0vdptdTVnW2Kel56XCvqeLXtABo9S8dcH13u4InT8v7/sjuoRe/qdz+Lju
fu7gH7vr019//SWlsalEdQFqQuFtvFzvSR2vpsMt5Ou1wIDQTtZogNUJuLGT7z+aDWrVWDSJ
QUMMKDnyI7whHGSraG8fUsB1Dp3QUxtsH4I+bFkaNJWu6M2JdwAYHLRgz77JtQNSNUZeM8Fi
4Pqv3B+uocBIYYI6z3Nh0YjSIzek4VJsptYRgf9XeGWXe8SHB2TfqiUXcLyxOIjVWe89t3Z0
J/MwR36g+V+KCDqnVNQabY0g2uylPA1SqgOn5PK5Brd3moCwzZxEgrsjzA1MQS0j+j0ZX0+Z
BPLu8+aKTftokF9CocxsqiS5bSu2/DT6bG+PvQLvPmgq+b6CS/LmFfQKhxNF7DwUZF1lvCuQ
Vq6ZfyrmDmCAUnZQmEK/jIUyfhs7z1i6oGnqo5avzQCB3K6DYqEl+hDvEejIScq4AAIH0/eq
JGgU57OPlKAUx4XeiFM9KFqRzNm819wTReuieKujitQMJY4eUAen0bjg9MotD/wBcVJU9f6M
8THoaw8FC6E5b74hibQJo++fs3tQLPxbJNW+RZAoW2PT0dZSv4aVaH+smslqtnJjFvIYNFzM
WCdfL6ioRhnO1+R1qnjDDAQwDDkIIj8Ita1ZwXmw+C3VOmoCFsfooImBlPxJOkFCTRyGDRnx
0htjLvSMGwQlvGPmicVmOa1/RlCPf8FAoqb2rRAvwTmpZYBxNUZMzqoAWw6RqbBlx+0M5NMi
YplybpC4qSUgeyRT2rqvrAAPNEjsY53OReu9GKQ6mlhsZx9HbvIpdperau/yMGIh4MXBM0mA
c3guOLKd6FbMghphH+JshpekN0Ld8Y4Wv4Ekqyfcy5AVqhqfzbNCbxoPSU2mZSzs/sLbuKXF
uUp8X8GHvipjQQ03Ui2BrJDzAXAoN8T52oDNggKXjgosS9XliAMzOHsvuP+A7bVIoCunWGEM
c073BtMhxvYaB/B2swckKo+2u2wx70slh6roLW6oWP7M9tAs1b+68azQvpsbKSVrlBfpGlA1
C6yAnWHpPdCMzc0z8ZZbcWCXQ59vm6rA21NMF7Q4YliekvSBbm0Bc1dJEI2/iQcaO0o5y1kM
LcOEBN+5rFTczDJu7EO2FIRxso3LkO4ep7j1LlCtMKlRkPMjzFq1t+KiRmcATkO0gllxKvWb
n3vlBDIey8KHysas2HAl+NadzWmeUqh4KnF3Rp22eV6eAllTK43dInQr0Vp2wEtKYBthHtcP
rOHMD8tcOu5VWTWKzMt1ranZCEzlA0M0cfHyJOTb7mbSbQ0TOg5Gv0fjKgbo01jcm78ODBx/
mezK1yI8+jqloSjttwINja4RNMNXaeJyF2VbRHVy41cQaCihWdVJ7d4zCbBthKwBJ/kgJk0K
sG1ltyzhcRTcOsDi8qlM5mqi3rQEruQ7xw1ririD4Bs6SMAyXnOPUOI18xJTlNcE9Q6b754+
zhgnYFwJoWBTegN7DWy4qFYDCncgi9yrniVvXbiDleeKxiUZDr+37gJrBIrKMaTtx3PKLCge
MDVazp2RuchQhEhFYrvF4EjSWYmzFq/cHUP3Sp5GLX0QthZm2DEVIkXZNlpAU3+e0tUugXnR
cUw4yUpmVLGzYBNYr0qvvk2iub/e1z/+vvzYH//+uOzOh9Pz7ouov/2Hzi7tSCoB3Rr26x/N
g3zaGq3MOf96v546T6fzri3yLWVb4sQwdHPYyaWjlwzum3CPuSTQJJ2FSydIF/KY6BjzoUov
MYEmaaacGBsYSdjceBpdt/aE2Xq/TFOTeimXFqpbcJKIIM1yZsDchfG05xDAiMVsTvSpgpsv
q3Kpk9RbN8j57Sa3/xmPzv1efxKVoYFA1YIEmq9P+V8DjI5j96VXegaG/zFXWFTBjSEuiwWI
K4O+0us14hnmnNPYtMLlQWS2Pg/Lugwdiv+asdjH9RXj7J4er7vnjnd8QkYDqdz57/762mGX
y+lpz1Hu4/XRYDjHicwXOZE5EgsG//W7aRI+9Abdkdll7z5YGVAPHoINcFX7d894wgQUMxez
KzNz5JzCHByHWB2enEypgoWZckHWrAFST6uwG6Jt2GbWGT/piNQCj5dX2xdEzPyERaSmu6jf
pPVDx+Otp3nLtn+BQ62SuLBeqM6gf+O7BF7EJCgx8BL6k6dh5ELkP321ALLodd3AN1mWFJ/W
FRS5QwJG0AWwqLwQ/5rSLHJBTJBgtaJmi+iPLJkTG4pBnwpXq9f9gvVMZgBWGY0p8KhniiUA
D4xhLeZZb2rSrtNRr4m0dfbvr2rOwnoHzIkVB9AtGaki4UeTsSmoPKx3YV07LC5nAaUd1fjM
GRKPzeAw59tcmeqlBVpqGFqqETc0eWHJadkSUCls6r2OHCuf/7U/tVyw78wlPitnYc5urhdB
wEfaJmQJ4eqZ+wHspakXm9tZBd/mudcnX1N4jOh5sU70+SAJjJxIGlosocYDC6O793K2o2bc
fbzsIDoSfqecryrkZGjyRPh9aPQGYIs2ReTj8fl06MQfhx+7c52uh+oUlhSBgx2ly7nZDM06
cUljLFJe4OhCUP/f2JUstw3D0F/pJ6Ru4tSHHqjFDhNtISXH1kXTHtrxJZ1x2pnm7wuQWgAR
cnwU8ESRtAmCAAhQiLTPISMgPmoswoqHR3+ICPWrTlKgB4as0Y5cO2iZ4a8yYsxCkNIch2r4
8qixH86dH+6XL+FMuKtFCffghDwn9+Z/BMoHQSv9Ruk+LOctgfBOdqxUPv5bnM3RXtzG8b14
KZfuBHlWNWjdXzd3/+IPm0NsjNnZrwKuV1fhho/v5fAy6fNXQqEDHyN9fm3JDmiPOZZA90ZT
b6p5F5hVE2U9xjYRhx3ubjZdnOK5WWPIZn9DbQJUT7G9H+NSR66XYZiO6afTrt9c8am3069X
n63AxZQyD4O/edLVWEzSGywM8wyGfEsOzD03PdR4DXTqb/B+gIADQ5t+u73ZrJnloiwSZY7z
7sh2Dt9ylLlM3LaWwD3UWT2eaKheb3/WreK+8/1DCS0VaT0n7W1Jawk64hyDCcJtX2myy9Kd
iul9b13gyHrHxFA37/Tj/P38/un8+++f0yvVzyNdmxTzyTMn62QAn/hSXIIbFQ0YHBy8tjZF
XB27rSnz2U0+CsnSYoELU9M1taYe1IGF90PR2+A9LSEfc/LrkjnvBtYimaycwby+VZiKx1/E
1fwkGoPggt2GkT6vOSLU/OE7ddPxt76sZo+jZZOLY8eBZZxGx4Uk6xSykDzdQ5R5kSu6ez6b
0thrqNPTPe1WpqMLp6uYHDZUk+h6mG7mEXEMN+dohFH1xWoKPuaITJLwYVCDXFPc1I/UJA3p
LYwBN9uMCRNHndSwYbhtKbYBCtX0RYIGNUvoCaKlVg4tkufPvTmD01xShSrEarW+DYjK5BKt
fmjyKGBYkPBhu1H8SH+znrow/9PYul2rWcDbyIiAsRI5WZsrkXFoF/DlAv02XOaC9dmoRB+8
A9ot9dIkdKkrC+JYu9znMGmG+jFRRIA4oTkfPAl9SLPQAXTW5UzBQsdsgVmpymohNg0ArtzH
DDAsLwzUhL1tVygMHGPCompyjFwtt1sXcCG9XTVweqddTJ6pEM9K5vTE50tLrsjw1iuRGlmL
l+IJAaaVmiSShIXUaPOMtg/pukFeaVYcEJN0mHQH27BhjgKLwaHZUjUBzENSSs2Pwt5nwNc0
us3oPO0KWCUY70FzN/lwAWk+/gOKgNbQsoIBAA==

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--0OAP2g/MAC+5xKAE--
