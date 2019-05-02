Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMEgr-0005rk-W4
 for ath10k@lists.infradead.org; Thu, 02 May 2019 16:36:11 +0000
Date: Fri, 3 May 2019 00:35:48 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-bringup 25/111]
 drivers/net/wireless/ath/ath11k/wmi.c:4040:6: sparse: sparse: symbol
 'ath11k_wmi_pull_pdev_stats_base' was not declared. Should it be static?
Message-ID: <201905030017.UAWcRaLV%lkp@intel.com>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9cacba94c6118dd96276ffe745dbad51dd4fe6b4
commit: d25cb35c6f10ac1a9ffae4611f22cb92ba448058 [25/111] ath11k: add support for FW stats via WMI
reproduce:
        # apt-get install sparse
        git checkout d25cb35c6f10ac1a9ffae4611f22cb92ba448058
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/ath/ath11k/wmi.c:181:12: sparse: sparse: symbol 'ath11k_wmi_tlv_parse_alloc' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:201:5: sparse: sparse: symbol 'ath11k_wmi_cmd_send_nowait' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:468:5: sparse: sparse: symbol 'ath11k_service_ready_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:714:6: sparse: sparse: symbol 'ath11k_wmi_put_wmi_channel' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:937:6: sparse: sparse: symbol 'ath11k_send_green_ap_ps_enable_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:968:6: sparse: sparse: symbol 'ath11k_send_gpio_config_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:1006:5: sparse: sparse: symbol 'ath11k_send_gpio_output_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:1036:5: sparse: sparse: symbol 'ath11k_send_vdev_set_fwtest_param_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:2356:5: sparse: sparse: symbol 'ath11k_send_set_sta_ps_mode_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:2390:5: sparse: sparse: symbol 'ath11k_send_set_mimops_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:2447:5: sparse: sparse: symbol 'ath11k_send_set_smps_params_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:2553:5: sparse: sparse: symbol 'ath11k_send_bcn_buf_ll_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3205:5: sparse: sparse: symbol 'ath11k_service_ready_ext_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3222:5: sparse: sparse: symbol 'ath11k_pull_vdev_start_resp_tlv' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3296:5: sparse: sparse: symbol 'ath11k_pull_reg_chan_list_update_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3410:5: sparse: sparse: symbol 'ath11k_pull_peer_del_resp_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3441:5: sparse: sparse: symbol 'ath11k_pull_bcn_tx_status_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3470:5: sparse: sparse: symbol 'ath11k_pull_vdev_stopped_param_tlv' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3531:5: sparse: sparse: symbol 'ath11k_pull_mgmt_rx_params_tlv' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3622:5: sparse: sparse: symbol 'ath11k_pull_mgmt_tx_compl_param_tlv' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3794:5: sparse: sparse: symbol 'ath11k_pull_scan_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3827:5: sparse: sparse: symbol 'ath11k_pull_peer_sta_kickout_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3854:5: sparse: sparse: symbol 'ath11k_pull_roam_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3902:5: sparse: sparse: symbol 'ath11k_pull_chan_info_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3939:5: sparse: sparse: symbol 'ath11k_pull_pdev_bss_chan_info_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3979:5: sparse: sparse: symbol 'ath11k_pull_vdev_install_key_compl_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4011:5: sparse: sparse: symbol 'ath11k_pull_peer_assoc_conf_ev' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4040:6: sparse: sparse: symbol 'ath11k_wmi_pull_pdev_stats_base' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4081:6: sparse: sparse: symbol 'ath11k_wmi_pull_pdev_stats_rx' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:4357:8: sparse: sparse: symbol 'ath11k_wmi_fw_stats_num_bcn' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4771:5: sparse: sparse: symbol 'ath11k_reg_chan_list_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4922:5: sparse: sparse: symbol 'ath11k_ready_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4938:6: sparse: sparse: symbol 'ath11k_peer_delete_resp_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4968:6: sparse: sparse: symbol 'ath11k_vdev_start_resp_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5007:6: sparse: sparse: symbol 'ath11k_bcn_tx_status_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5026:6: sparse: sparse: symbol 'ath11k_vdev_stopped_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5053:6: sparse: sparse: symbol 'ath11k_mgmt_rx_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5168:6: sparse: sparse: symbol 'ath11k_mgmt_tx_compl_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5199:6: sparse: sparse: symbol 'ath11k_scan_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5258:6: sparse: sparse: symbol 'ath11k_peer_sta_kickout_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5307:6: sparse: sparse: symbol 'ath11k_roam_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5353:6: sparse: sparse: symbol 'ath11k_chan_info_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5427:6: sparse: sparse: symbol 'ath11k_pdev_bss_chan_info_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5502:6: sparse: sparse: symbol 'ath11k_vdev_install_key_compl_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5541:6: sparse: sparse: symbol 'ath11k_service_available_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5577:6: sparse: sparse: symbol 'ath11k_peer_assoc_conf_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:5603:6: sparse: sparse: symbol 'ath11k_update_stats_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4873:9: sparse: sparse: context imbalance in 'ath11k_reg_chan_list_event' - different lock contexts for basic block

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
