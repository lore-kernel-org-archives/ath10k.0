Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Acn-0001cj-2Y
 for ath10k@lists.infradead.org; Fri, 22 Mar 2019 03:13:44 +0000
Date: Fri, 22 Mar 2019 02:59:52 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-bringup 30/60]
 drivers/net/wireless/ath/ath11k/wmi.c:5612:6: sparse: symbol
 'ath11k_pdev_ctl_failsafe_check_event' was not declared. Should it be
 static?
Message-ID: <201903220231.XMGhENMe%lkp@intel.com>
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
head:   3c46e2415dac1f744640d0e42594fb27de804df9
commit: 886785f92306cdbfd31ee4fc6391d5dbf02beb5b [30/60] ath11k: fix acs survey
reproduce:
        # apt-get install sparse
        git checkout 886785f92306cdbfd31ee4fc6391d5dbf02beb5b
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'


sparse warnings: (new ones prefixed by >>)

   include/linux/slab.h:664:13: sparse: undefined identifier '__builtin_mul_overflow'
   drivers/net/wireless/ath/ath11k/wmi.c:203:5: sparse: symbol 'ath11k_wmi_cmd_send_nowait' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:470:5: sparse: symbol 'ath11k_service_ready_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:716:6: sparse: symbol 'ath11k_wmi_put_wmi_channel' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:939:6: sparse: symbol 'ath11k_send_green_ap_ps_enable_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:970:6: sparse: symbol 'ath11k_send_gpio_config_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:1008:5: sparse: symbol 'ath11k_send_gpio_output_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:1038:5: sparse: symbol 'ath11k_send_vdev_set_fwtest_param_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:2358:5: sparse: symbol 'ath11k_send_set_sta_ps_mode_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:2392:5: sparse: symbol 'ath11k_send_set_mimops_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:2449:5: sparse: symbol 'ath11k_send_set_smps_params_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:2555:5: sparse: symbol 'ath11k_send_bcn_buf_ll_cmd' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3207:5: sparse: symbol 'ath11k_service_ready_ext_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3224:5: sparse: symbol 'ath11k_pull_vdev_start_resp_tlv' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3298:5: sparse: symbol 'ath11k_pull_reg_chan_list_update_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3412:5: sparse: symbol 'ath11k_pull_peer_del_resp_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3443:5: sparse: symbol 'ath11k_pull_bcn_tx_status_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3472:5: sparse: symbol 'ath11k_pull_vdev_stopped_param_tlv' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3533:5: sparse: symbol 'ath11k_pull_mgmt_rx_params_tlv' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3624:5: sparse: symbol 'ath11k_pull_mgmt_tx_compl_param_tlv' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3796:5: sparse: symbol 'ath11k_pull_scan_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3829:5: sparse: symbol 'ath11k_pull_peer_sta_kickout_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3856:5: sparse: symbol 'ath11k_pull_roam_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3904:5: sparse: symbol 'ath11k_pull_chan_info_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3942:5: sparse: symbol 'ath11k_pull_pdev_bss_chan_info_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:3982:5: sparse: symbol 'ath11k_pull_vdev_install_key_compl_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4014:5: sparse: symbol 'ath11k_pull_peer_assoc_conf_ev' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4043:6: sparse: symbol 'ath11k_wmi_pull_pdev_stats_base' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4084:6: sparse: symbol 'ath11k_wmi_pull_pdev_stats_rx' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4360:8: sparse: symbol 'ath11k_wmi_fw_stats_num_bcn' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4774:5: sparse: symbol 'ath11k_reg_chan_list_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4925:5: sparse: symbol 'ath11k_ready_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4941:6: sparse: symbol 'ath11k_peer_delete_resp_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:4971:6: sparse: symbol 'ath11k_vdev_start_resp_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5010:6: sparse: symbol 'ath11k_bcn_tx_status_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5029:6: sparse: symbol 'ath11k_vdev_stopped_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5056:6: sparse: symbol 'ath11k_mgmt_rx_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5171:6: sparse: symbol 'ath11k_mgmt_tx_compl_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5202:6: sparse: symbol 'ath11k_scan_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5261:6: sparse: symbol 'ath11k_peer_sta_kickout_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5310:6: sparse: symbol 'ath11k_roam_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5356:6: sparse: symbol 'ath11k_chan_info_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5429:6: sparse: symbol 'ath11k_pdev_bss_chan_info_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5503:6: sparse: symbol 'ath11k_vdev_install_key_compl_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5542:6: sparse: symbol 'ath11k_service_available_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5578:6: sparse: symbol 'ath11k_peer_assoc_conf_event' was not declared. Should it be static?
   drivers/net/wireless/ath/ath11k/wmi.c:5604:6: sparse: symbol 'ath11k_update_stats_event' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/wmi.c:5612:6: sparse: symbol 'ath11k_pdev_ctl_failsafe_check_event' was not declared. Should it be static?
   include/linux/slab.h:664:13: sparse: call with no type!
   drivers/net/wireless/ath/ath11k/wmi.c:4876:9: sparse: context imbalance in 'ath11k_reg_chan_list_event' - different lock contexts for basic block

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
