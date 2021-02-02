Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_75_100,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624D3C433DB
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 10:14:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16DA64F68
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 10:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16DA64F68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7GRuzz2v4TeyHeUxSmqMOwOeq0t12Q+Yf8wvIhFJQJ4=; b=TON86jugDT2ceecpDqPTz3YQS
	6nCDVhPbE2JUFIgXWeUQ/SsMsEUTwZfpWNPw230z2H+IabVHRf10SGuStZi8ojhW4NFAbTV0QsPBO
	fmytVxdL9s6zYXn3601cFdhMy4shCl8pdw1U7dilR/c1NNK/WpWKOlfB0xZq2+hulhDB2JnOLcaS8
	re3yp5BJFQTAqyLjPt1g67ew/yU9zRdSPjCC5o9x7n2xWn045hvBIv6JJtMdWFm9Nz26od3NWZXR2
	+CyfIdO3V+f1b4f8/X6wp1ePdcuxmkryrRY6ZiRHeFbmuxRrf4qhL7cvY23PZlp+aSWk7C7RjoH/E
	rcqvg5lMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6sg4-0006hc-T2; Tue, 02 Feb 2021 10:12:56 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6sg2-0006gb-88
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 10:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1612260772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oud1Nddi3VfL5AGpR9cTnrU4PgSgP7ZuldQ5SKEm6aw=;
 b=nVTRY68tL0+jD9DAg+P2NyoCX16uubF1fnV2INQwDtZCMNSdTfOHBnHmjzqab7QH0R+Cch
 PehmWnRF5J2OsqdLNG+eUtrR07aGwwR3P1E8mBmGnQqUdaKilYh1DJbf5iPRyrAn6kBM7I
 BIYNFRqsrl7MMDKL+gL4LcO0MVoh320=
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>,
 Sebastian Gottschall <s.gottschall@dd-wrt.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Tue, 02 Feb 2021 11:12:45 +0100
Message-ID: <2784478.zUthXOmo2V@ripper>
In-Reply-To: <a54d233a-7677-80d4-32e9-3cec6744e8c7@dd-wrt.com>
References: <268706864.fOQeQAt3TZ@ripper> <2354947.QRssEMCmQP@ripper>
 <a54d233a-7677-80d4-32e9-3cec6744e8c7@dd-wrt.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_051255_213313_B6CF20D1 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2754466031428965613=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============2754466031428965613==
Content-Type: multipart/signed; boundary="nextPart2665215.ej8DetVK4u"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2665215.ej8DetVK4u
Content-Type: multipart/mixed; boundary="nextPart3222804.C9aK1JHNqS"; protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Tue, 02 Feb 2021 11:12:45 +0100
Message-ID: <2784478.zUthXOmo2V@ripper>
In-Reply-To: <a54d233a-7677-80d4-32e9-3cec6744e8c7@dd-wrt.com>
References: <268706864.fOQeQAt3TZ@ripper> <2354947.QRssEMCmQP@ripper> <a54d233a-7677-80d4-32e9-3cec6744e8c7@dd-wrt.com>

This is a multi-part message in MIME format.

--nextPart3222804.C9aK1JHNqS
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 2 February 2021 10:12:45 CET Sebastian Gottschall wrote:
> mmh. l have a idea
> 
> try the following (this a patch in my tree) and check also the wmi 
> services for this service flag which might be a difference between these 
> firmwares
> 
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -9003,10 +9003,10 @@ int ath10k_mac_register(struct ath10k *ar)
[...]

Thanks, for the idea. But this has no effect on the problem. I have also 
attached the services and feature information (from ath10k-ct's perspective to 
have hopefully a more complete look at the differences). And it seems both 
have WMI_SERVICE_PER_PACKET_SW_ENCRYPT and Ben's firmware also 
ATH10K_FW_FEATURE_CONSUME_BLOCK_ACK_CT (which would also have "enabled" this 
code section).

The biggest difference (which would affect also the non-ct ath10k) would be in 
wmi_services. Ben Greears firmware doesnt support:

* WMI_SERVICE_PEER_CACHING
* WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS
* WMI_SERVICE_HOST_DFS_CHECK_SUPPORT
* WMI_SERVICE_TPC_STATS_FINAL

Kind regards,
	Sven
--nextPart3222804.C9aK1JHNqS
Content-Disposition: attachment; filename="greearb-firmware_info"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="greearb-firmware_info"

directory: ath10k/QCA4019/hw1.0
firmware:  firmware-5.bin
fwcfg:     fwcfg-ahb-a000000.wifi.txt
bus:       a000000.wifi
features:  mfp,peer-flow-ctrl,txstatus-noack,wmi-10.x-CT,ratemask-CT,regdump-CT,txrate-CT,flush-all-CT,pingpong-CT,ch-regs-CT,nop-CT,set-special-CT,tx-rc-CT,cust-stats-CT,txrate2-CT,beacon-cb-CT,wmi-block-ack-CT,wmi-bcn-rc-CT
version:   10.4b-ct-4019-fW-13-5ae337bb1
hw_rev:    4019
board:     board-2.bin

--nextPart3222804.C9aK1JHNqS
Content-Disposition: attachment; filename="greearb-wmi_services"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="greearb-wmi_services"

WMI_SERVICE_BEACON_OFFLOAD               -
WMI_SERVICE_SCAN_OFFLOAD                 -
WMI_SERVICE_ROAM_OFFLOAD                 -
WMI_SERVICE_BCN_MISS_OFFLOAD             enabled
WMI_SERVICE_STA_PWRSAVE                  enabled
WMI_SERVICE_STA_ADVANCED_PWRSAVE         enabled
WMI_SERVICE_AP_UAPSD                     enabled
WMI_SERVICE_AP_DFS                       -
WMI_SERVICE_11AC                         enabled
WMI_SERVICE_BLOCKACK                     enabled
WMI_SERVICE_PHYERR                       enabled
WMI_SERVICE_BCN_FILTER                   -
WMI_SERVICE_RTT                          enabled
WMI_SERVICE_RATECTRL                     -
WMI_SERVICE_WOW                          -
WMI_SERVICE_RATECTRL_CACHE               enabled
WMI_SERVICE_IRAM_TIDS                    -
WMI_SERVICE_ARPNS_OFFLOAD                -
WMI_SERVICE_NLO                          -
WMI_SERVICE_GTK_OFFLOAD                  -
WMI_SERVICE_SCAN_SCH                     enabled
WMI_SERVICE_CSA_OFFLOAD                  -
WMI_SERVICE_CHATTER                      -
WMI_SERVICE_COEX_FREQAVOID               -
WMI_SERVICE_PACKET_POWER_SAVE            -
WMI_SERVICE_FORCE_FW_HANG                enabled
WMI_SERVICE_GPIO                         enabled
WMI_SERVICE_STA_DTIM_PS_MODULATED_DTIM   -
WMI_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG    -
WMI_SERVICE_STA_UAPSD_VAR_AUTO_TRIG      -
WMI_SERVICE_STA_KEEP_ALIVE               -
WMI_SERVICE_TX_ENCAP                     enabled
WMI_SERVICE_BURST                        -
WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT     enabled
WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT     -
WMI_SERVICE_ROAM_SCAN_OFFLOAD            -
WMI_SERVICE_AP_PS_DETECT_OUT_OF_SYNC     enabled
WMI_SERVICE_EARLY_RX                     -
WMI_SERVICE_STA_SMPS                     -
WMI_SERVICE_FWTEST                       -
WMI_SERVICE_STA_WMMAC                    -
WMI_SERVICE_TDLS                         -
WMI_SERVICE_MCC_BCN_INTERVAL_CHANGE      -
WMI_SERVICE_ADAPTIVE_OCS                 -
WMI_SERVICE_BA_SSN_SUPPORT               -
WMI_SERVICE_FILTER_IPSEC_NATKEEPALIVE    -
WMI_SERVICE_WLAN_HB                      -
WMI_SERVICE_LTE_ANT_SHARE_SUPPORT        -
WMI_SERVICE_BATCH_SCAN                   -
WMI_SERVICE_QPOWER                       -
WMI_SERVICE_PLMREQ                       -
WMI_SERVICE_THERMAL_MGMT                 -
WMI_SERVICE_RMC                          -
WMI_SERVICE_MHF_OFFLOAD                  -
WMI_SERVICE_COEX_SAR                     -
WMI_SERVICE_BCN_TXRATE_OVERRIDE          -
WMI_SERVICE_NAN                          -
WMI_SERVICE_L1SS_STAT                    -
WMI_SERVICE_ESTIMATE_LINKSPEED           -
WMI_SERVICE_OBSS_SCAN                    -
WMI_SERVICE_TDLS_OFFCHAN                 -
WMI_SERVICE_TDLS_UAPSD_BUFFER_STA        -
WMI_SERVICE_TDLS_UAPSD_SLEEP_STA         -
WMI_SERVICE_IBSS_PWRSAVE                 -
WMI_SERVICE_LPASS                        -
WMI_SERVICE_EXTSCAN                      -
WMI_SERVICE_D0WOW                        -
WMI_SERVICE_HSOFFLOAD                    -
WMI_SERVICE_ROAM_HO_OFFLOAD              -
WMI_SERVICE_RX_FULL_REORDER              -
WMI_SERVICE_DHCP_OFFLOAD                 -
WMI_SERVICE_STA_RX_IPA_OFFLOAD_SUPPORT   -
WMI_SERVICE_MDNS_OFFLOAD                 -
WMI_SERVICE_SAP_AUTH_OFFLOAD             -
WMI_SERVICE_ATF                          enabled
WMI_SERVICE_COEX_GPIO                    enabled
WMI_SERVICE_ENHANCED_PROXY_STA           enabled
WMI_SERVICE_TT                           enabled
WMI_SERVICE_PEER_CACHING                 -
WMI_SERVICE_AUX_SPECTRAL_INTF            -
WMI_SERVICE_AUX_CHAN_LOAD_INTF           -
WMI_SERVICE_BSS_CHANNEL_INFO_64          enabled
WMI_SERVICE_EXT_RES_CFG_SUPPORT          enabled
WMI_SERVICE_MESH_11S                     enabled
WMI_SERVICE_MESH_NON_11S                 enabled
WMI_SERVICE_PEER_STATS                   enabled
WMI_SERVICE_RESTRT_CHNL_SUPPORT          -
WMI_SERVICE_PERIODIC_CHAN_STAT_SUPPORT   enabled
WMI_SERVICE_TX_MODE_PUSH_ONLY            enabled
WMI_SERVICE_TX_MODE_PUSH_PULL            enabled
WMI_SERVICE_TX_MODE_DYNAMIC              enabled
WMI_SERVICE_VDEV_RX_FILTER               enabled
WMI_SERVICE_BTCOEX                       enabled
WMI_SERVICE_CHECK_CAL_VERSION            enabled
WMI_SERVICE_DBGLOG_WARN2                 -
WMI_SERVICE_BTCOEX_DUTY_CYCLE            enabled
WMI_SERVICE_4_WIRE_COEX_SUPPORT          enabled
WMI_SERVICE_EXTENDED_NSS_SUPPORT         enabled
WMI_SERVICE_PROG_GPIO_BAND_SELECT        enabled
WMI_SERVICE_SMART_LOGGING_SUPPORT        enabled
WMI_SERVICE_TDLS_CONN_TRACKER_IN_HOST_MODE -
WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY      -
WMI_SERVICE_MGMT_TX_WMI                  -
WMI_SERVICE_TDLS_WIDER_BANDWIDTH         -
WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS -
WMI_SERVICE_HOST_DFS_CHECK_SUPPORT       -
WMI_SERVICE_TPC_STATS_FINAL              -
WMI_SERVICE_RESET_CHIP                   -
WMI_SERVICE_SPOOF_MAC_SUPPORT            -
WMI_SERVICE_TX_DATA_ACK_RSSI             -
WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT -
WMI_SERVICE_VDEV_DISABLE_4_ADDR_SRC_LRN_SUPPORT -
WMI_SERVICE_BB_TIMING_CONFIG_SUPPORT     -
WMI_SERVICE_THERM_THROT                  enabled
WMI_SERVICE_RTT_RESPONDER_ROLE           -
WMI_SERVICE_PER_PACKET_SW_ENCRYPT        enabled
WMI_SERVICE_REPORT_AIRTIME               -
WMI_SERVICE_SYNC_DELETE_CMDS             -
WMI_SERVICE_TX_PWR_PER_PEER              -
WMI_SERVICE_SUPPORT_EXTEND_ADDRESS       -

--nextPart3222804.C9aK1JHNqS
Content-Disposition: attachment; filename="kalle-firmware_info"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="kalle-firmware_info"

directory: ath10k/QCA4019/hw1.0
firmware:  firmware-5.bin
fwcfg:     fwcfg-ahb-a000000.wifi.txt
bus:       a000000.wifi
features:  no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps
version:   10.4-3.6-00140
hw_rev:    4019
board:     board-2.bin

--nextPart3222804.C9aK1JHNqS
Content-Disposition: attachment; filename="kalle-wmi_services"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="kalle-wmi_services"

WMI_SERVICE_BEACON_OFFLOAD               -
WMI_SERVICE_SCAN_OFFLOAD                 -
WMI_SERVICE_ROAM_OFFLOAD                 -
WMI_SERVICE_BCN_MISS_OFFLOAD             enabled
WMI_SERVICE_STA_PWRSAVE                  enabled
WMI_SERVICE_STA_ADVANCED_PWRSAVE         enabled
WMI_SERVICE_AP_UAPSD                     enabled
WMI_SERVICE_AP_DFS                       -
WMI_SERVICE_11AC                         enabled
WMI_SERVICE_BLOCKACK                     enabled
WMI_SERVICE_PHYERR                       enabled
WMI_SERVICE_BCN_FILTER                   -
WMI_SERVICE_RTT                          enabled
WMI_SERVICE_RATECTRL                     -
WMI_SERVICE_WOW                          -
WMI_SERVICE_RATECTRL_CACHE               enabled
WMI_SERVICE_IRAM_TIDS                    -
WMI_SERVICE_ARPNS_OFFLOAD                -
WMI_SERVICE_NLO                          -
WMI_SERVICE_GTK_OFFLOAD                  -
WMI_SERVICE_SCAN_SCH                     enabled
WMI_SERVICE_CSA_OFFLOAD                  -
WMI_SERVICE_CHATTER                      -
WMI_SERVICE_COEX_FREQAVOID               -
WMI_SERVICE_PACKET_POWER_SAVE            -
WMI_SERVICE_FORCE_FW_HANG                enabled
WMI_SERVICE_GPIO                         enabled
WMI_SERVICE_STA_DTIM_PS_MODULATED_DTIM   -
WMI_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG    -
WMI_SERVICE_STA_UAPSD_VAR_AUTO_TRIG      -
WMI_SERVICE_STA_KEEP_ALIVE               -
WMI_SERVICE_TX_ENCAP                     enabled
WMI_SERVICE_BURST                        -
WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT     enabled
WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT     -
WMI_SERVICE_ROAM_SCAN_OFFLOAD            -
WMI_SERVICE_AP_PS_DETECT_OUT_OF_SYNC     enabled
WMI_SERVICE_EARLY_RX                     -
WMI_SERVICE_STA_SMPS                     -
WMI_SERVICE_FWTEST                       -
WMI_SERVICE_STA_WMMAC                    -
WMI_SERVICE_TDLS                         -
WMI_SERVICE_MCC_BCN_INTERVAL_CHANGE      -
WMI_SERVICE_ADAPTIVE_OCS                 -
WMI_SERVICE_BA_SSN_SUPPORT               -
WMI_SERVICE_FILTER_IPSEC_NATKEEPALIVE    -
WMI_SERVICE_WLAN_HB                      -
WMI_SERVICE_LTE_ANT_SHARE_SUPPORT        -
WMI_SERVICE_BATCH_SCAN                   -
WMI_SERVICE_QPOWER                       -
WMI_SERVICE_PLMREQ                       -
WMI_SERVICE_THERMAL_MGMT                 -
WMI_SERVICE_RMC                          -
WMI_SERVICE_MHF_OFFLOAD                  -
WMI_SERVICE_COEX_SAR                     -
WMI_SERVICE_BCN_TXRATE_OVERRIDE          -
WMI_SERVICE_NAN                          -
WMI_SERVICE_L1SS_STAT                    -
WMI_SERVICE_ESTIMATE_LINKSPEED           -
WMI_SERVICE_OBSS_SCAN                    -
WMI_SERVICE_TDLS_OFFCHAN                 -
WMI_SERVICE_TDLS_UAPSD_BUFFER_STA        -
WMI_SERVICE_TDLS_UAPSD_SLEEP_STA         -
WMI_SERVICE_IBSS_PWRSAVE                 -
WMI_SERVICE_LPASS                        -
WMI_SERVICE_EXTSCAN                      -
WMI_SERVICE_D0WOW                        -
WMI_SERVICE_HSOFFLOAD                    -
WMI_SERVICE_ROAM_HO_OFFLOAD              -
WMI_SERVICE_RX_FULL_REORDER              -
WMI_SERVICE_DHCP_OFFLOAD                 -
WMI_SERVICE_STA_RX_IPA_OFFLOAD_SUPPORT   -
WMI_SERVICE_MDNS_OFFLOAD                 -
WMI_SERVICE_SAP_AUTH_OFFLOAD             -
WMI_SERVICE_ATF                          enabled
WMI_SERVICE_COEX_GPIO                    enabled
WMI_SERVICE_ENHANCED_PROXY_STA           enabled
WMI_SERVICE_TT                           enabled
WMI_SERVICE_PEER_CACHING                 enabled
WMI_SERVICE_AUX_SPECTRAL_INTF            -
WMI_SERVICE_AUX_CHAN_LOAD_INTF           -
WMI_SERVICE_BSS_CHANNEL_INFO_64          enabled
WMI_SERVICE_EXT_RES_CFG_SUPPORT          enabled
WMI_SERVICE_MESH_11S                     enabled
WMI_SERVICE_MESH_NON_11S                 enabled
WMI_SERVICE_PEER_STATS                   enabled
WMI_SERVICE_RESTRT_CHNL_SUPPORT          -
WMI_SERVICE_PERIODIC_CHAN_STAT_SUPPORT   enabled
WMI_SERVICE_TX_MODE_PUSH_ONLY            enabled
WMI_SERVICE_TX_MODE_PUSH_PULL            enabled
WMI_SERVICE_TX_MODE_DYNAMIC              enabled
WMI_SERVICE_VDEV_RX_FILTER               enabled
WMI_SERVICE_BTCOEX                       enabled
WMI_SERVICE_CHECK_CAL_VERSION            enabled
WMI_SERVICE_DBGLOG_WARN2                 -
WMI_SERVICE_BTCOEX_DUTY_CYCLE            enabled
WMI_SERVICE_4_WIRE_COEX_SUPPORT          enabled
WMI_SERVICE_EXTENDED_NSS_SUPPORT         enabled
WMI_SERVICE_PROG_GPIO_BAND_SELECT        enabled
WMI_SERVICE_SMART_LOGGING_SUPPORT        enabled
WMI_SERVICE_TDLS_CONN_TRACKER_IN_HOST_MODE -
WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY      -
WMI_SERVICE_MGMT_TX_WMI                  -
WMI_SERVICE_TDLS_WIDER_BANDWIDTH         -
WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS enabled
WMI_SERVICE_HOST_DFS_CHECK_SUPPORT       enabled
WMI_SERVICE_TPC_STATS_FINAL              enabled
WMI_SERVICE_RESET_CHIP                   -
WMI_SERVICE_SPOOF_MAC_SUPPORT            -
WMI_SERVICE_TX_DATA_ACK_RSSI             -
WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT -
WMI_SERVICE_VDEV_DISABLE_4_ADDR_SRC_LRN_SUPPORT -
WMI_SERVICE_BB_TIMING_CONFIG_SUPPORT     -
WMI_SERVICE_THERM_THROT                  enabled
WMI_SERVICE_RTT_RESPONDER_ROLE           -
WMI_SERVICE_PER_PACKET_SW_ENCRYPT        enabled
WMI_SERVICE_REPORT_AIRTIME               -
WMI_SERVICE_SYNC_DELETE_CMDS             -
WMI_SERVICE_TX_PWR_PER_PEER              -
WMI_SERVICE_SUPPORT_EXTEND_ADDRESS       -

--nextPart3222804.C9aK1JHNqS--

--nextPart2665215.ej8DetVK4u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmAZJZ0ACgkQXYcKB8Em
e0aRUA/9E8Spo3I3/cSgZ+86EmtehlO0aMqyJMm5VoQ5RscmPueFtb+g3ICKL8n9
nc8f+VZm3zazjKqixTrVxqgW3rsHzIj713gOrlFhsFpXmw5+wAmVJXjZcrvNwCwV
EbYueSH5j3XJbU29SJXOYC0ApwAMVeD0+qhEETQmjhHNh8ILx1tLuC3PSK3IoHP7
JeVnZeK985HWJUcCtiJrntcXwKpy1jZiU/xIWJuubJlfPvPdxKecMjA6HVac+7ZM
Y8jP4drTX9HwqF18380axHD8Ygk/X9eMPK0Mi6CBwHqOxOizZ2WtJawyA3K+OtkP
8qbsEjH0Zz3BtST3UyILfVQck2H0NI9/2VFc8re0As6J9PTCjVbDVOBOcG+PuVlk
a6wips1AZCKazuIsTA8yL9ZGQ8J6vpsg/bwefrEtLQf49Du1xlWwVw4pMP71W4tE
dWh7qSDBWvGZLOKMlTA/JEQYKvN0Bk2feGFHy127rZIGBrTcpWr+A7vVG+W8Prgu
i5QIYP4La4Y8Z4F8rd8svKLUOmiDF53eylJM8a/8Jxo/YDBZfeUoAr0RGE6miuCl
8asyO3fh62x8iWZfNGli+dzNAtQUFYRULjl+UekWAD1XZb/Zabe5NmYQI7lzkVO3
FxwLqYRsRIHBsEonbFaCRbgO1cf0DWFQNr6bR2KA8nK/yiF3qf8=
=AXB9
-----END PGP SIGNATURE-----

--nextPart2665215.ej8DetVK4u--





--===============2754466031428965613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2754466031428965613==--




