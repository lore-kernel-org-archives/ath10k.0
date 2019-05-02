Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMEJe-0004Mz-4Z
 for ath10k@lists.infradead.org; Thu, 02 May 2019 16:12:12 +0000
Date: Fri, 3 May 2019 00:11:27 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-bringup 3/111]
 drivers/net/wireless/ath/ath11k/reg.c:27:39: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <201905030039.lpVlyOqx%lkp@intel.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9cacba94c6118dd96276ffe745dbad51dd4fe6b4
commit: 258bbf525e652e244aa8b2331f55fda573fbe926 [3/111] ath11k: add driver
reproduce:
        # apt-get install sparse
        git checkout 258bbf525e652e244aa8b2331f55fda573fbe926
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/reg.c:27:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const * @@    got char const [noderevoid const * @@
>> drivers/net/wireless/ath/ath11k/reg.c:27:39: sparse:    expected void const *
>> drivers/net/wireless/ath/ath11k/reg.c:27:39: sparse:    got char const [noderef] <asn:4> *
--
>> drivers/net/wireless/ath/ath11k/qmi.c:1864:41: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/wireless/ath/ath11k/qmi.c:1964:70: sparse: sparse: incorrect type in argument 4 (different address spaces) @@    expected void *bdf_addr @@    got void [noderef] <asn:2> *[assivoid *bdf_addr @@
>> drivers/net/wireless/ath/ath11k/qmi.c:1964:70: sparse:    expected void *bdf_addr
>> drivers/net/wireless/ath/ath11k/qmi.c:1964:70: sparse:    got void [noderef] <asn:2> *[assigned] bdf_addr
--
>> drivers/net/wireless/ath/ath11k/wmi.c:166:12: sparse: sparse: symbol 'ath11k_wmi_tlv_parse_alloc' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:186:5: sparse: sparse: symbol 'ath11k_wmi_cmd_send_nowait' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:216:5: sparse: sparse: symbol 'ath11k_wmi_cmd_send' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:441:5: sparse: sparse: symbol 'ath11k_service_ready_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:457:16: sparse: sparse: symbol 'ath11k_wmi_alloc_skb' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:687:6: sparse: sparse: symbol 'ath11k_wmi_put_wmi_channel' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:910:6: sparse: sparse: symbol 'ath11k_send_green_ap_ps_enable_cmd' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:940:6: sparse: sparse: symbol 'ath11k_send_gpio_config_cmd' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:977:5: sparse: sparse: symbol 'ath11k_send_gpio_output_cmd' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:1006:5: sparse: sparse: symbol 'ath11k_send_vdev_set_fwtest_param_cmd' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:2325:5: sparse: sparse: symbol 'ath11k_send_set_sta_ps_mode_cmd' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:2358:5: sparse: sparse: symbol 'ath11k_send_set_mimops_cmd' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:2412:5: sparse: sparse: symbol 'ath11k_send_set_smps_params_cmd' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:2516:5: sparse: sparse: symbol 'ath11k_send_bcn_buf_ll_cmd' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3168:5: sparse: sparse: symbol 'ath11k_service_ready_ext_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3185:5: sparse: sparse: symbol 'ath11k_pull_vdev_start_resp_tlv' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3259:5: sparse: sparse: symbol 'ath11k_pull_reg_chan_list_update_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3373:5: sparse: sparse: symbol 'ath11k_pull_peer_del_resp_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3404:5: sparse: sparse: symbol 'ath11k_pull_bcn_tx_status_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3433:5: sparse: sparse: symbol 'ath11k_pull_vdev_stopped_param_tlv' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3505:5: sparse: sparse: symbol 'ath11k_pull_mgmt_rx_params_tlv' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3596:5: sparse: sparse: symbol 'ath11k_pull_mgmt_tx_compl_param_tlv' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3768:5: sparse: sparse: symbol 'ath11k_pull_scan_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3801:5: sparse: sparse: symbol 'ath11k_pull_peer_sta_kickout_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3828:5: sparse: sparse: symbol 'ath11k_pull_roam_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3876:5: sparse: sparse: symbol 'ath11k_pull_chan_info_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3913:5: sparse: sparse: symbol 'ath11k_pull_pdev_bss_chan_info_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3953:5: sparse: sparse: symbol 'ath11k_pull_vdev_install_key_compl_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:3985:5: sparse: sparse: symbol 'ath11k_pull_peer_assoc_conf_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4031:5: sparse: sparse: symbol 'ath11k_reg_chan_list_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4182:5: sparse: sparse: symbol 'ath11k_ready_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4198:6: sparse: sparse: symbol 'ath11k_peer_delete_resp_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4228:6: sparse: sparse: symbol 'ath11k_vdev_start_resp_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4267:6: sparse: sparse: symbol 'ath11k_bcn_tx_status_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4286:6: sparse: sparse: symbol 'ath11k_vdev_stopped_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4313:6: sparse: sparse: symbol 'ath11k_mgmt_rx_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4428:6: sparse: sparse: symbol 'ath11k_mgmt_tx_compl_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4459:6: sparse: sparse: symbol 'ath11k_scan_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4518:6: sparse: sparse: symbol 'ath11k_peer_sta_kickout_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4567:6: sparse: sparse: symbol 'ath11k_roam_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4613:6: sparse: sparse: symbol 'ath11k_chan_info_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4687:6: sparse: sparse: symbol 'ath11k_pdev_bss_chan_info_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4762:6: sparse: sparse: symbol 'ath11k_vdev_install_key_compl_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4801:6: sparse: sparse: symbol 'ath11k_service_available_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4837:6: sparse: sparse: symbol 'ath11k_peer_assoc_conf_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4133:9: sparse: sparse: context imbalance in 'ath11k_reg_chan_list_event' - different lock contexts for basic block
--
>> drivers/net/wireless/ath/ath11k/dp_tx.c:649:23: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:651:23: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:654:23: sparse: sparse: dubious: x & !y
--
>> drivers/net/wireless/ath/ath11k/debug_htt_stats.c:850:59: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4619:51: sparse: sparse: non size-preserving integer to pointer cast
   drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4706:24: sparse: sparse: non size-preserving pointer to integer cast
--
>> drivers/net/wireless/ath/ath11k/hal_rx.c:118:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:120:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:122:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:124:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:126:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:128:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:130:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:132:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:134:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:136:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:138:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:140:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:142:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:144:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:146:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:148:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:150:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:152:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:154:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:156:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:158:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:160:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:166:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:170:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:172:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:176:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:178:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:180:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:182:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:184:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:186:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:188:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:190:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:192:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:213:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:217:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:219:17: sparse: sparse: dubious: x & !y

Please review and possibly fold the followup patch.

vim +27 drivers/net/wireless/ath/ath11k/reg.c

    24	
    25	static bool ath11k_regdom_changes(struct ath11k *ar, char *alpha2)
    26	{
  > 27		return !!(memcmp(ar->hw->wiphy->regd->alpha2, alpha2, 2));
    28	}
    29	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
