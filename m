Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71885C3DA4A
	for <ath10k@archiver.kernel.org>; Mon, 19 Aug 2024 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1RcudAHew7wdiiwttKmKJv8z0Zu8tmv5zsg/ho7Z4g=; b=GgJrr4U/ROFn3QKoTZJi5LJyzP
	vR3Xt8icB3HBDpWdf1aibJuRASORB+HT8kDPceqi8Sug8a7xKerhfPQRzOP7L4htK1RlmiB0OxYUk
	tegFrPjzWnM2GnXU3jIIvBCRFKK2esyz4dtsRSLw+pYpyL4UlgVmeA7YSJ1eHJ+RUG343n13hJLOj
	yGtDm4QAI4m7DPUze6nxLodvXjWDlEDokCShSs13X+LB2eG8+pL0XlFBfVHb45Lv1ZKA4MIrFVPqh
	BL2EnpRc2TzTWff8TZlorl6dJa97xLOBPyzxIaCpfwxNH9B7BQS/Ui+mFm4BwL4jhufLdU3bP7v3D
	lzif4Kug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6t1-00000002WKU-3Hom;
	Mon, 19 Aug 2024 18:13:47 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6sw-00000002WJC-2aQu
	for ath10k@lists.infradead.org;
	Mon, 19 Aug 2024 18:13:46 +0000
Received: from [192.168.0.2] (ip5f5af273.dynamic.kabel-deutschland.de [95.90.242.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1A7D861E5FE07;
	Mon, 19 Aug 2024 20:13:24 +0200 (CEST)
Message-ID: <672441c5-a344-4bcc-95e9-a2726bc69bdc@molgen.mpg.de>
Date: Mon, 19 Aug 2024 20:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath10k: fix invalid VHT parameters in
 supported_vht_mcs_rate_nss2
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 James Prestwood <prestwoj@gmail.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20240711020344.98040-1-quic_bqiang@quicinc.com>
 <20240711020344.98040-3-quic_bqiang@quicinc.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240711020344.98040-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_111342_976207_07053E70 
X-CRM114-Status: GOOD (  19.65  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Dear Boachen,


Thank you for your patch, I found by chance. ;-) (It’d be great if you 
could carbon-copy me in the future.)

Am 11.07.24 um 04:03 schrieb Baochen Qiang:
> In supported_vht_mcs_rate_nss2, the rate for MCS9 & VHT20 is defined as
> {1560, 1733}, this does not align with firmware's definition and therefore
> fails the verification in ath10k_mac_get_rate_flags_vht():
> 
> 	invalid vht params rate 1730 100kbps nss 2 mcs 9
> and:

(I’d add blank lines around the *and*.)

> 	invalid vht params rate 1920 100kbps nss 2 mcs 9
> 
> Change it to {1730,  1920} to align with firmware, so this issue could be
> fixed.

… to fix the issue.

> Since ath10k_hw_params::supports_peer_stats_info is enabled only for
> QCA6174, this change does not affect other chips.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1

How did you test it? Were you able to reproduce the errors?

Anyway, with Linux v6.11-rc3-306-gdf6cbc62cc9b (Merge tag 'scsi-fixes' 
of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi), I was able 
to reproduce the issue addressed in this patch at the airport BER (I 
guess they use Cisco), and applying your two patches, I wasn’t able to 
see the messages anymore.

> Fixes: 3344b99d69ab ("ath10k: add bitrate parse for peer stats info")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/lkml/fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath10k/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 3c34f3d8e555..e62b251405fc 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -9136,7 +9136,7 @@ static const struct ath10k_index_vht_data_rate_type supported_vht_mcs_rate_nss2[
>   	{6,  {5265, 5850}, {2430, 2700}, {1170, 1300} },
>   	{7,  {5850, 6500}, {2700, 3000}, {1300, 1444} },
>   	{8,  {7020, 7800}, {3240, 3600}, {1560, 1733} },
> -	{9,  {7800, 8667}, {3600, 4000}, {1560, 1733} }
> +	{9,  {7800, 8667}, {3600, 4000}, {1730, 1920} }
>   };
>   
>   static void ath10k_mac_get_rate_flags_ht(struct ath10k *ar, u32 rate, u8 nss, u8 mcs,

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de> # Dell XPS 13 9360
(qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535, 
firmware ver WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp 
crc32 0793bcf2)


Kind regards,

Paul


PS: For the record the log messages without your patches:

```
$ journalctl -b -2 _TRANSPORT=kernel -o short-monotonic -g ath10k | cat
[    9.235159] abreu kernel: ath10k_pci 0000:3a:00.0: enabling device 
(0000 -> 0002)
[    9.235737] abreu kernel: ath10k_pci 0000:3a:00.0: pci irq msi 
oper_irq_mode 2 irq_mode 0 reset_mode 0
[    9.536027] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 
target 0x05030000 chip_id 0x00340aff sub 1a56:1535
[    9.536283] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 
debugfs 0 tracing 0 dfs 0 testmode 0
[    9.536448] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
[    9.664028] abreu kernel: ath10k_pci 0000:3a:00.0: board_file api 2 
bmi_id N/A crc32 d2863f91
[    9.804022] abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 3.87 
wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[    9.888048] abreu kernel: ath10k_pci 0000:3a:00.0 wlp58s0: renamed 
from wlan0
[  513.580087] abreu kernel: ath10k_pci 0000:3a:00.0: failed to flush 
transmit queue (skip 0 ar-state 1): 0
[ 2567.504260] abreu kernel: ath10k_pci 0000:3a:00.0: pci irq msi 
oper_irq_mode 2 irq_mode 0 reset_mode 0
[ 2567.780099] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 
target 0x05030000 chip_id 0x00340aff sub 1a56:1535
[ 2567.780840] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 
debugfs 0 tracing 0 dfs 0 testmode 0
[ 2567.781291] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
[ 2567.856082] abreu kernel: ath10k_pci 0000:3a:00.0: board_file api 2 
bmi_id N/A crc32 d2863f91
[ 2567.948225] abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 3.87 
wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[ 2568.055481] abreu kernel: ath10k_pci 0000:3a:00.0 wlp58s0: renamed 
from wlan0
[ 2594.004036] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2606.716035] abreu kernel: ath10k_pci 0000:3a:00.0: pci irq msi 
oper_irq_mode 2 irq_mode 0 reset_mode 0
[ 2606.996065] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 
target 0x05030000 chip_id 0x00340aff sub 1a56:1535
[ 2606.997132] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 
debugfs 0 tracing 0 dfs 0 testmode 0
[ 2606.997787] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
[ 2607.076065] abreu kernel: ath10k_pci 0000:3a:00.0: board_file api 2 
bmi_id N/A crc32 d2863f91
[ 2607.172110] abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 3.87 
wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[ 2607.288083] abreu kernel: ath10k_pci 0000:3a:00.0 wlp58s0: renamed 
from wlan0
[ 2619.004042] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2634.004063] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2634.004555] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2646.008072] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2658.004636] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2670.004124] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2676.004124] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2682.008029] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2694.008097] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2700.008035] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2706.008036] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2712.008036] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2718.013839] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2724.008034] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2730.008047] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2736.008160] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2742.012285] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2754.004105] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1730 100kbps nss 2 mcs 9
[ 2760.008098] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2766.008097] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2772.008111] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2784.008045] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2790.008116] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2796.004150] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2802.008109] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2808.008074] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2820.008060] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2838.008137] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2844.008135] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2856.008179] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2862.008038] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2874.004098] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2892.008086] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2898.008175] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2904.008100] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2910.008031] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2940.008087] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2946.008062] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2964.008098] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2970.008089] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2976.008094] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2982.004167] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2988.012097] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 2994.008078] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3000.008129] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3018.008091] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1730 100kbps nss 2 mcs 9
[ 3036.008060] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3042.004087] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3048.008104] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3054.012046] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3060.008090] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3066.008157] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3072.008299] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3078.004268] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3084.012112] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3102.004068] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3108.012337] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3114.008081] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3120.008092] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3126.004109] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3132.008110] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3162.004063] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3168.008092] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3192.012049] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1730 100kbps nss 2 mcs 9
[ 3198.008053] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3204.012100] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3210.012098] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3216.008087] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3222.008052] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3228.012313] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3246.008047] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1730 100kbps nss 2 mcs 9
[ 3252.008035] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3258.004121] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3264.008099] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3270.012084] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3276.008129] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3282.004088] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3294.004099] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3318.004049] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3324.008203] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3330.008069] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3336.012074] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3342.008087] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3348.004111] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3366.008075] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3372.008026] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3378.008111] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3384.008285] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3390.008103] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3396.008092] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3402.008038] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3408.008092] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3414.008273] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3438.008111] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1730 100kbps nss 2 mcs 9
[ 3444.004040] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3450.008046] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3456.008056] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3462.008052] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
[ 3467.020210] abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht params 
rate 1920 100kbps nss 2 mcs 9
```

With both of your patches:

```
$ journalctl -b -1 _TRANSPORT=kernel -o short-monotonic -g ath10k | cat
[   15.136140] abreu kernel: ath10k_pci 0000:3a:00.0: enabling device 
(0000 -> 0002)
[   15.148602] abreu kernel: ath10k_pci 0000:3a:00.0: pci irq msi 
oper_irq_mode 2 irq_mode 0 reset_mode 0
[   15.468121] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 
target 0x05030000 chip_id 0x00340aff sub 1a56:1535
[   15.468401] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 
debugfs 0 tracing 0 dfs 0 testmode 0
[   15.468598] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
[   15.568036] abreu kernel: ath10k_pci 0000:3a:00.0: board_file api 2 
bmi_id N/A crc32 d2863f91
[   15.672086] abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 3.87 
wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[   15.788147] abreu kernel: ath10k_pci 0000:3a:00.0 wlp58s0: renamed 
from wlan0
[   75.232061] abreu kernel: ath10k_pci: unknown parameter 'debug_mask' 
ignored
[   75.240101] abreu kernel: ath10k_pci 0000:3a:00.0: pci irq msi 
oper_irq_mode 2 irq_mode 0 reset_mode 0
[   75.516113] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 
target 0x05030000 chip_id 0x00340aff sub 1a56:1535
[   75.516835] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 
debugfs 0 tracing 0 dfs 0 testmode 0
[   75.517283] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
[   75.592080] abreu kernel: ath10k_pci 0000:3a:00.0: board_file api 2 
bmi_id N/A crc32 d2863f91
[   75.684191] abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 3.87 
wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[   75.787369] abreu kernel: ath10k_pci 0000:3a:00.0 wlp58s0: renamed 
from wlan0
```

