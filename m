Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C34CFD364
	for <ath10k@archiver.kernel.org>; Tue, 25 Nov 2025 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw/rfighClYLAxIAUhzAnVeXPvkLgvFR+fZRkYa2n20=; b=sr7L6DqVZtrfUGgLT/GXJqo2XO
	jZDj89bRg62MYEXs9oL4qvoMzpjMceq0WdUXZNp19OaMh4Pvkk4t/P/P+0mHObwKqB7atDvW+V8D0
	+q0auKtwIAp39xOlTly5PqgcRurugkENFeiD93Qow3TQVDz3vHyIDNkl6R5PWceawxpZNOzqal9a+
	dxcHImga8jodel4T3rb5JgR+AtEZkKZvujjnmUyv+1D4PS8bxQfuDSsHo5C9n+HzCNDGti4temYdo
	vKo+dmtXux5/6/lbyZD2ykzUw5dgQwuL0xUbuZe4cYpGWEVdzfFYWjbMufx2XiCd1dDPEWKtRH1cJ
	AjSl64NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpKt-0000000D1ZL-1mCD;
	Tue, 25 Nov 2025 09:27:47 +0000
Received: from ip-94-112-25-9.bb.vodafone.cz ([94.112.25.9] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpKn-0000000D1XV-0ZQi
	for ath10k@lists.infradead.org;
	Tue, 25 Nov 2025 09:27:44 +0000
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 4740A534106A;
	Tue, 25 Nov 2025 10:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1764062853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yw/rfighClYLAxIAUhzAnVeXPvkLgvFR+fZRkYa2n20=;
	b=FlXReBgfe740BM6vFF1xDCJy0p/zPApvJ7xX8D/gYhgGoqEQzczueA9Z82taWLyxXTyF46
	+igUioG1ms6XDeQ26JdpcitUvXw9QQqQfN+z6fXN8IeTPIDU/Fu3fjmu7YyO3ELxQ8c2CB
	5UQ/O3rL1KjAFOLBryNiwFPlpWXIhBI=
Message-ID: <313b36d3-e1b4-4e80-8d5d-d65981abb34b@ixit.cz>
Date: Tue, 25 Nov 2025 10:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ath10k: Introduce a firmware quirk to skip host cap
 QMI requests
To: Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-1-836b9c51ad86@ixit.cz>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20251111-xiaomi-beryllium-firmware-v1-1-836b9c51ad86@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_012741_486284_F86F297C 
X-CRM114-Status: GOOD (  27.59  )
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

Sadly, this is too early in the initialization process and we get NULL 
deref, similar to [1].

Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000058
Mem abort info:
   ESR = 0x0000000096000004
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x04: level 0 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000010f838000
[0000000000000058] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in: qrtr_smd fastrpc rpmsg_ctrl des_generic 
algif_skcipher md5 md4 algif_hash snd_soc_sdm845 snd_soc_rt5663 
snd_soc_qcom_sdw snd_soc_qcom_common snd_soc_rl6231 hci_uart 
snd_soc_core nft_reject_inet nf_reject_ipv4 btqca nf_reject_ipv6 
nft_reject btbcm snd_compress nft_ct bluetooth nf_conntrack nxp_nci_i2c 
snd_pcm nxp_nci nf_defrag_ipv6 ecdh_generic nf_defrag_ipv4 nci snd_timer 
ecc soundwire_bus nfc pwrseq_core rmi_i2c snd nf_tables qcom_camss 
venus_core qcom_spmi_haptics soundcore rmi_core leds_qcom_flash 
videobuf2_dma_sg qcom_spmi_rradc ath10k_snoc bq27xxx_battery_i2c 
videobuf2_memops v4l2_mem2mem qcom_smbx bq27xxx_battery rtc_pm8xxx 
v4l2_fwnode videobuf2_v4l2 ath10k_core videobuf2_common v4l2_async ath 
qcom_refgen_regulator qcom_stats videodev reset_qcom_pdc mac80211 mc 
camcc_sdm845 i2c_qcom_cci coresight_tmc qcom_rng coresight_stm stm_core 
coresight_replicator coresight_funnel qcom_q6v5_mss coresight cfg80211 
qrtr ipa qcom_q6v5_pas slim_qcom_ngd_ctrl rfkill qcom_pil_info qcom_wdt 
qcom_q6v5
  qcom_sysmon qcom_common qcom_glink_smem icc_bwmon uhid uinput zram 
zsmalloc fuse nfnetlink ipv6
CPU: 4 UID: 0 PID: 154 Comm: kworker/u32:7 Tainted: G        W 
6.18.0-rc5-next-20251111-sdm845-00134-gfb2106976a5c-dirty #2 PREEMPT
Tainted: [W]=WARN
Hardware name: OnePlus 6T (DT)
Workqueue: ath10k_qmi_driver_event ath10k_qmi_driver_event_work 
[ath10k_snoc]
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : ath10k_qmi_driver_event_work+0x1ec/0x440 [ath10k_snoc]
lr : ath10k_qmi_driver_event_work+0x1dc/0x440 [ath10k_snoc]
sp : ffff8000819b3cf0
x29: ffff8000819b3d40 x28: ffff00008d823c00 x27: dead000000000122
x26: 0000000000000000 x25: ffff00008fab2060 x24: dead000000000100
x23: ffff00008d823d50 x22: ffff00008d81bd28 x21: ffff00008d823d28
x20: ffff00008d823d28 x19: ffff0000901c5120 x18: ffff56858e1da000
x17: ffff56858e1da000 x16: ffffa97c6467f1b8 x15: ffffa97c6569dbd0
x14: ffffa97c655a1440 x13: 0000000000000000 x12: ffff00008a12e4a8
x11: ffff00008d823cd8 x10: ffff00008a12e480 x9 : ffffa97c640314c4
x8 : ffff00008d823cd8 x7 : 0000000000000000 x6 : ffff00008a12e6a8
x5 : fffffffffffffffe x4 : 0000000000000000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
  ath10k_qmi_driver_event_work+0x1ec/0x440 [ath10k_snoc] (P)
  process_one_work+0x15c/0x3c0
  worker_thread+0x2d0/0x400
  kthread+0x148/0x208
  ret_from_fork+0x10/0x20
Code: 350001a0 39488380 37000de0 f9487b20 (f9402c00)
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------

If no objection raised, I would go back to the original device-tree 
property way then (as also another device in need of this quirk showed up).

David

[1] 
https://lore.kernel.org/ath10k/54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr/

On 11/11/2025 13:34, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> There are firmware versions which do not support host capability
> QMI request. We suspect either the host cap is not implemented or
> there may be firmware specific issues, but apparently there seem
> to be a generation of firmware that has this particular behavior.
> 
> For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> 
> If we do not skip the host cap QMI request on Xiaomi Poco F1,
> then we get a QMI_ERR_MALFORMED_MSG_V01 error message in the
> ath10k_qmi_host_cap_send_sync(). But this error message is not
> fatal to the firmware nor to the ath10k driver and we can still
> bring up the WiFi services successfully if we just ignore it.
> 
> Hence introducing this firmware quirk to skip host capability
> QMI request for the firmware versions which do not support this
> feature.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/net/wireless/ath/ath10k/core.c |  1 +
>   drivers/net/wireless/ath/ath10k/core.h |  3 +++
>   drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>   3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 7c2939cbde5f0..7602631696798 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -773,6 +773,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
>   	[ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
>   	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
>   	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
> +	[ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ] = "no-host-cap-qmi-req",
>   };
>   
>   static unsigned int ath10k_core_get_fw_feature_str(char *buf,
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 73a9db302245d..b20541e4046f8 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -838,6 +838,9 @@ enum ath10k_fw_features {
>   	/* Firmware support IRAM recovery */
>   	ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
>   
> +	/* Firmware does not support host capability QMI request */
> +	ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ = 23,
> +
>   	/* keep last */
>   	ATH10K_FW_FEATURE_COUNT,
>   };
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 8275345631a0b..5dc8ea39372c1 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -819,9 +819,16 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>   		return;
>   	}
>   
> -	ret = ath10k_qmi_host_cap_send_sync(qmi);
> -	if (ret)
> -		return;
> +	/*
> +	 * Skip the host capability request for the firmware versions which
> +	 * do not support this feature.
> +	 */
> +	if (!test_bit(ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ,
> +		      ar->running_fw->fw_file.fw_features)) {
> +		ret = ath10k_qmi_host_cap_send_sync(qmi);
> +		if (ret)
> +			return;
> +	}
>   
>   	ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
>   	if (ret)
> 

-- 
David Heidelberg


