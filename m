Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4jiU-0000Q3-Qb
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 05:47:23 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 04/10] ath10k: set 10.4 fw exclusive wmi cmd as unsupported
 for other fw versions
Date: Tue, 16 Jun 2015 11:15:17 +0530
Message-ID: <1434433523-8357-5-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1434433523-8357-1-git-send-email-rmani@qti.qualcomm.com>
References: <1434433523-8357-1-git-send-email-rmani@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

In fact, explicit assigned to ZERO for unsupported wmi commands
are not really needed. Global static variable will have ZERO by
default. However, just for better readability setting all wmi cmds
in non 10.4 firmware wmi mapping table as unsupported for wmi cmd
which are exclusively available only in 10.4 firmware.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 128 ++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index d3a5d46..51b5d3c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -148,6 +148,38 @@ static struct wmi_cmd_map wmi_cmd_map = {
 	.gpio_config_cmdid = WMI_GPIO_CONFIG_CMDID,
 	.gpio_output_cmdid = WMI_GPIO_OUTPUT_CMDID,
 	.pdev_get_temperature_cmdid = WMI_CMD_UNSUPPORTED,
+	.scan_update_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_standby_response_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_resume_response_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_add_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_evict_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_restore_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_print_all_peers_info_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_update_wds_entry_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_add_proxy_sta_entry_cmdid = WMI_CMD_UNSUPPORTED,
+	.rtt_keepalive_cmdid = WMI_CMD_UNSUPPORTED,
+	.oem_req_cmdid = WMI_CMD_UNSUPPORTED,
+	.nan_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_ratemask_cmdid = WMI_CMD_UNSUPPORTED,
+	.qboost_cfg_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_smart_ant_enable_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_smart_ant_set_rx_antenna_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_tx_antenna_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_train_info_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_node_config_ops_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_antenna_switch_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_ctl_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_mimogain_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_ratepwr_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_ratepwr_chainmsk_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_fips_cmdid = WMI_CMD_UNSUPPORTED,
+	.tt_set_conf_cmdid = WMI_CMD_UNSUPPORTED,
+	.fwtest_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_atf_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_atf_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_get_ani_cck_config_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_get_ani_ofdm_config_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_reserve_ast_entry_cmdid = WMI_CMD_UNSUPPORTED,
 };
 
 /* 10.X WMI cmd track */
@@ -271,6 +303,38 @@ static struct wmi_cmd_map wmi_10x_cmd_map = {
 	.gpio_config_cmdid = WMI_10X_GPIO_CONFIG_CMDID,
 	.gpio_output_cmdid = WMI_10X_GPIO_OUTPUT_CMDID,
 	.pdev_get_temperature_cmdid = WMI_CMD_UNSUPPORTED,
+	.scan_update_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_standby_response_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_resume_response_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_add_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_evict_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_restore_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_print_all_peers_info_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_update_wds_entry_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_add_proxy_sta_entry_cmdid = WMI_CMD_UNSUPPORTED,
+	.rtt_keepalive_cmdid = WMI_CMD_UNSUPPORTED,
+	.oem_req_cmdid = WMI_CMD_UNSUPPORTED,
+	.nan_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_ratemask_cmdid = WMI_CMD_UNSUPPORTED,
+	.qboost_cfg_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_smart_ant_enable_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_smart_ant_set_rx_antenna_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_tx_antenna_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_train_info_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_node_config_ops_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_antenna_switch_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_ctl_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_mimogain_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_ratepwr_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_ratepwr_chainmsk_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_fips_cmdid = WMI_CMD_UNSUPPORTED,
+	.tt_set_conf_cmdid = WMI_CMD_UNSUPPORTED,
+	.fwtest_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_atf_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_atf_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_get_ani_cck_config_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_get_ani_ofdm_config_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_reserve_ast_entry_cmdid = WMI_CMD_UNSUPPORTED,
 };
 
 /* 10.2.4 WMI cmd track */
@@ -393,6 +457,38 @@ static struct wmi_cmd_map wmi_10_2_4_cmd_map = {
 	.gpio_config_cmdid = WMI_10_2_GPIO_CONFIG_CMDID,
 	.gpio_output_cmdid = WMI_10_2_GPIO_OUTPUT_CMDID,
 	.pdev_get_temperature_cmdid = WMI_10_2_PDEV_GET_TEMPERATURE_CMDID,
+	.scan_update_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_standby_response_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_resume_response_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_add_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_evict_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_restore_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_print_all_peers_info_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_update_wds_entry_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_add_proxy_sta_entry_cmdid = WMI_CMD_UNSUPPORTED,
+	.rtt_keepalive_cmdid = WMI_CMD_UNSUPPORTED,
+	.oem_req_cmdid = WMI_CMD_UNSUPPORTED,
+	.nan_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_ratemask_cmdid = WMI_CMD_UNSUPPORTED,
+	.qboost_cfg_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_smart_ant_enable_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_smart_ant_set_rx_antenna_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_tx_antenna_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_train_info_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_node_config_ops_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_antenna_switch_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_ctl_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_mimogain_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_ratepwr_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_ratepwr_chainmsk_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_fips_cmdid = WMI_CMD_UNSUPPORTED,
+	.tt_set_conf_cmdid = WMI_CMD_UNSUPPORTED,
+	.fwtest_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_atf_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_atf_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_get_ani_cck_config_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_get_ani_ofdm_config_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_reserve_ast_entry_cmdid = WMI_CMD_UNSUPPORTED,
 };
 
 /* 10.4 WMI cmd track */
@@ -1020,6 +1116,38 @@ static struct wmi_cmd_map wmi_10_2_cmd_map = {
 	.gpio_config_cmdid = WMI_10_2_GPIO_CONFIG_CMDID,
 	.gpio_output_cmdid = WMI_10_2_GPIO_OUTPUT_CMDID,
 	.pdev_get_temperature_cmdid = WMI_CMD_UNSUPPORTED,
+	.scan_update_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_standby_response_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_resume_response_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_add_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_evict_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_restore_peer_cmdid = WMI_CMD_UNSUPPORTED,
+	.wlan_peer_caching_print_all_peers_info_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_update_wds_entry_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_add_proxy_sta_entry_cmdid = WMI_CMD_UNSUPPORTED,
+	.rtt_keepalive_cmdid = WMI_CMD_UNSUPPORTED,
+	.oem_req_cmdid = WMI_CMD_UNSUPPORTED,
+	.nan_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_ratemask_cmdid = WMI_CMD_UNSUPPORTED,
+	.qboost_cfg_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_smart_ant_enable_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_smart_ant_set_rx_antenna_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_tx_antenna_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_train_info_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_smart_ant_set_node_config_ops_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_antenna_switch_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_ctl_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_set_mimogain_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_ratepwr_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_ratepwr_chainmsk_table_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_fips_cmdid = WMI_CMD_UNSUPPORTED,
+	.tt_set_conf_cmdid = WMI_CMD_UNSUPPORTED,
+	.fwtest_cmdid = WMI_CMD_UNSUPPORTED,
+	.vdev_atf_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.peer_atf_request_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_get_ani_cck_config_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_get_ani_ofdm_config_cmdid = WMI_CMD_UNSUPPORTED,
+	.pdev_reserve_ast_entry_cmdid = WMI_CMD_UNSUPPORTED,
 };
 
 void ath10k_wmi_put_wmi_channel(struct wmi_channel *ch,
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
