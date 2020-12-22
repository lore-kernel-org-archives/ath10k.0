Return-Path: <SRS0=CzWf=F2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA09C433DB
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 03:44:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E47D722ADC
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 03:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E47D722ADC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5b4dFVcC/0kK8etk0LiJkaDSPL3wxooKnQ+zXAGnVLY=; b=folV9igifmf2hT4g6erRSZKfy
	OgGVqcpjVs/Ke9A5AxnjJ3xrKpx+tjxcvXZtiiAwBYc0jIVOXn+GaCKTvap1Y3gHj7tUEbm/0IK72
	WDD4CBF668uToxSHNR+ZlcpObwDlM0FkVyl/uP4jS277z2dfbZwMSSZv4ckoQ+tb7VJzVkEFIDaGZ
	12tvY6K20WRlLoHj7Z4Ht2Kp8sEPhkEurUMJCPtsTRYEtdAZR0jT7yr9o5YgIBIEqOsIpqN+ld5Ip
	K/5PWbWtayyhauPEhCY7HENtgPzsWpXOUeyzUSJLHmqqPk1YVpscVSbjTI6zWlXZ+MKlhrNXDs+l8
	efvVIAg4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krYZS-0003mQ-6e; Tue, 22 Dec 2020 03:42:46 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krYZO-0003lu-Qp
 for ath10k@lists.infradead.org; Tue, 22 Dec 2020 03:42:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608608562; h=Message-ID: References: In-Reply-To: Subject:
 To: From: Date: Content-Transfer-Encoding: Content-Type: MIME-Version:
 Sender; bh=23siD49o+TgJ6zGpueIgyVTmgov7K/Bg2QXDvEgdk4o=;
 b=Ez9laGcvRmVVXREib1BuhuySWfAeY0eUi4M6AQ6lTjlZP6tKygbjlP3k2eBLhTv09z4+7Tg4
 7CDgHH9yF0NaLWegRtsek5hECWu1kSOqrgoQGHMVDZ0HnT1F6h9W7pfn5KmqZ9dl0uUNIEWk
 fC+HsNM8z4mWxgbcs7Bag84R0n8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fe16b28120d248bb5c4f552 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 03:42:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 16C62C433ED; Tue, 22 Dec 2020 03:42:31 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 08BDFC433C6;
 Tue, 22 Dec 2020 03:42:28 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 22 Dec 2020 11:42:28 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Sustek Goran <goran.sustek@adcubum.com>, ath10k@lists.infradead.org
Subject: Re: [PATCH] ath: add support for special 0x0 regulatory domain
In-Reply-To: <0BEB3EB4-E3AF-4236-BACC-E42CE2D094B7@adcubum.com>
References: <0BEB3EB4-E3AF-4236-BACC-E42CE2D094B7@adcubum.com>
Message-ID: <3a3815a68576f1715fcc6db590099b84@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_224243_021059_389D66AF 
X-CRM114-Status: GOOD (  13.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2020-12-21 05:06, Sustek Goran wrote:
> Hi, on my ath10k Chipset,
> QCA9984(https://compex.com.sg/shop/wifi-module/802-11ac-wave-2/wle1216v5-20-2/)
> afetr this patch i can not longer to initialize my card.
> 
> my dmesg log: So i need to revert this patch! Is my card need
> aditional support? Can you please guide what to do for my card to ahve
> OOB support in streamline kernels?
> 

If this patch introduce issue to you,
I think you can try to revert this patch.

> Regards,
> Goran.
> 
>  [Sun Dec 20 21:41:47 2020] ath: EEPROM regdomain sanitized
>  [Sun Dec 20 21:41:47 2020] ath: EEPROM regdomain: 0x64
>  [Sun Dec 20 21:41:47 2020] ath: EEPROM indicates we should expect a
> direct regpair map
>  [Sun Dec 20 21:41:47 2020] ath: Country alpha2 being used: 00
>  [Sun Dec 20 21:41:47 2020] ath: Regpair used: 0x64
>  [Sun Dec 20 21:41:47 2020] ath10k_pci 0000:07:00.0 wlp7s0: renamed
> from wlan0
> 
>  iw list
>  Wiphy phy0
>  max # scan SSIDs: 16
>  max scan IEs length: 199 bytes
>  max # sched scan SSIDs: 0
>  max # match sets: 0
>  Retry short limit: 7
>  Retry long limit: 4
>  Coverage class: 0 (up to 0m)
>  Device supports RSN-IBSS.
>  Device supports AP-side u-APSD.
>  Supported Ciphers:
>  * WEP40 (00-0f-ac:1)
>  * WEP104 (00-0f-ac:5)
>  * TKIP (00-0f-ac:2)
>  * CCMP-128 (00-0f-ac:4)
>  * CMAC (00-0f-ac:6)
>  * CMAC-256 (00-0f-ac:13)
>  * GMAC-128 (00-0f-ac:11)
>  * GMAC-256 (00-0f-ac:12)
>  * GCMP-128 (00-0f-ac:8)
>  * GCMP-256 (00-0f-ac:9)
>  * CCMP-256 (00-0f-ac:10)
>  Available Antennas: TX 0xf RX 0xf
>  Configured Antennas: TX 0xf RX 0xf
>  Supported interface modes:
>  * managed
>  * AP
>  * AP/VLAN
>  * monitor
>  * mesh point
>  Band 2:
>  Capabilities: 0x19ef
>  RX LDPC
>  HT20/HT40
>  SM Power Save disabled
>  RX HT20 SGI
>  RX HT40 SGI
>  TX STBC
>  RX STBC 1-stream
>  Max AMSDU length: 7935 bytes
>  DSSS/CCK HT40
>  Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
>  Minimum RX AMPDU time spacing: 8 usec (0x06)
>  HT TX/RX MCS rate indexes supported: 0-31
>  VHT Capabilities (0x339b79fa):
>  Max MPDU length: 11454
>  Supported Channel Width: 160 MHz, 80+80 MHz
>  RX LDPC
>  short GI (80 MHz)
>  short GI (160/80+80 MHz)
>  TX STBC
>  SU Beamformer
>  SU Beamformee
>  MU Beamformer
>  MU Beamformee
>  RX antenna pattern consistency
>  TX antenna pattern consistency
>  VHT RX MCS set:
>  1 streams: MCS 0-9
>  2 streams: MCS 0-9
>  3 streams: MCS 0-9
>  4 streams: MCS 0-9
>  5 streams: not supported
>  6 streams: not supported
>  7 streams: not supported
>  8 streams: not supported
>  VHT RX highest supported: 1560 Mbps
>  VHT TX MCS set:
>  1 streams: MCS 0-9
>  2 streams: MCS 0-9
>  3 streams: MCS 0-9
>  4 streams: MCS 0-9
>  5 streams: not supported
>  6 streams: not supported
>  7 streams: not supported
>  8 streams: not supported
>  VHT TX highest supported: 1560 Mbps
>  Bitrates (non-HT):
>  * 6.0 Mbps
>  * 9.0 Mbps
>  * 12.0 Mbps
>  * 18.0 Mbps
>  * 24.0 Mbps
>  * 36.0 Mbps
>  * 48.0 Mbps
>  * 54.0 Mbps
>  Frequencies:
>  * 5180 MHz [36] (24.0 dBm) (no IR)
>  * 5200 MHz [40] (24.0 dBm) (no IR)
>  * 5220 MHz [44] (24.0 dBm) (no IR)
>  * 5240 MHz [48] (24.0 dBm) (no IR)
>  * 5260 MHz [52] (24.0 dBm) (no IR, radar detection)
>  * 5280 MHz [56] (24.0 dBm) (no IR, radar detection)
>  * 5300 MHz [60] (24.0 dBm) (no IR, radar detection)
>  * 5320 MHz [64] (24.0 dBm) (no IR, radar detection)
>  * 5500 MHz [100] (disabled)
>  * 5520 MHz [104] (disabled)
>  * 5540 MHz [108] (disabled)
>  * 5560 MHz [112] (disabled)
>  * 5580 MHz [116] (disabled)
>  * 5600 MHz [120] (disabled)
>  * 5620 MHz [124] (disabled)
>  * 5640 MHz [128] (disabled)
>  * 5660 MHz [132] (disabled)
>  * 5680 MHz [136] (disabled)
>  * 5700 MHz [140] (disabled)
>  * 5720 MHz [144] (disabled)
>  * 5745 MHz [149] (30.0 dBm) (no IR)
>  * 5765 MHz [153] (30.0 dBm) (no IR)
>  * 5785 MHz [157] (30.0 dBm) (no IR)
>  * 5805 MHz [161] (30.0 dBm) (no IR)
>  * 5825 MHz [165] (30.0 dBm) (no IR)
>  * 5845 MHz [169] (disabled)
>  * 5865 MHz [173] (disabled)
>  Supported commands:
>  * new_interface
>  * set_interface
>  * new_key
>  * start_ap
>  * new_station
>  * new_mpath
>  * set_mesh_config
>  * set_bss
>  * authenticate
>  * associate
>  * deauthenticate
>  * disassociate
>  * join_ibss
>  * join_mesh
>  * remain_on_channel
>  * set_tx_bitrate_mask
>  * frame
>  * frame_wait_cancel
>  * set_wiphy_netns
>  * set_channel
>  * set_wds_peer
>  * probe_client
>  * set_noack_map
>  * register_beacons
>  * start_p2p_device
>  * set_mcast_rate
>  * connect
>  * disconnect
>  * channel_switch
>  * set_qos_map
>  * set_multicast_to_unicast
>  software interface modes (can always be added):
>  * AP/VLAN
>  * monitor
>  valid interface combinations:
>  * #{ managed } <= 1, #{ AP, mesh point } <= 16,
>    total <= 16, #channels <= 1, STA/AP BI must match
>  HT Capability overrides:
>  * MCS: ff ff ff ff ff ff ff ff ff ff
>  * maximum A-MSDU length
>  * supported channel width
>  * short GI for 40 MHz
>  * max A-MPDU length exponent
>  * min MPDU start spacing
>  Device supports TX status socket option.
>  Device supports HT-IBSS.
>  Device supports SAE with AUTHENTICATE command
>  Device supports scan flush.
>  Device supports AP scan.
>  Device supports per-vif TX power setting
>  Driver supports full state transitions for AP/GO clients
>  Driver supports a userspace MPM
>  Driver/device bandwidth changes during BSS lifetime (AP/GO mode)
>  Device supports static SMPS
>  Device supports configuring vdev MAC-addr on create.
>  max # scan plans: 1
>  max scan plan interval: -1
>  max scan plan iterations: 0
>  Supported TX frame types:
>  * IBSS: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0
> 0xc0 0xd0 0xe0 0xf0
>  * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
> 0xb0 0xc0 0xd0 0xe0 0xf0
>  * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0
> 0xc0 0xd0 0xe0 0xf0
>  * AP/VLAN: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
> 0xb0 0xc0 0xd0 0xe0 0xf0
>  * mesh point: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
> 0xb0 0xc0 0xd0 0xe0 0xf0
>  * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
> 0xb0 0xc0 0xd0 0xe0 0xf0
>  * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0
> 0xc0 0xd0 0xe0 0xf0
>  * P2P-device: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0
> 0xb0 0xc0 0xd0 0xe0 0xf0
>  Supported RX frame types:
>  * IBSS: 0x40 0xb0 0xc0 0xd0
>  * managed: 0x40 0xb0 0xd0
>  * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>  * AP/VLAN: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>  * mesh point: 0xb0 0xc0 0xd0
>  * P2P-client: 0x40 0xd0
>  * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
>  * P2P-device: 0x40 0xd0
>  Supported extended features:
>  * [ VHT_IBSS ]: VHT-IBSS
>  * [ RRM ]: RRM
>  * [ SET_SCAN_DWELL ]: scan dwell setting
>  * [ FILS_STA ]: STA FILS (Fast Initial Link Setup)
>  * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
>  * [ CONTROL_PORT_OVER_NL80211 ]: control port over nl80211
>  * [ TXQS ]: FQ-CoDel-enabled intermediate TXQs
>  * [ AIRTIME_FAIRNESS ]: airtime fairness scheduling
>  * [ STA_TX_PWR ]: TX power control per station
>  root@u1804:~# dmesg -T

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
