Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0404ACAC5BB
	for <ath10k@archiver.kernel.org>; Wed,  1 Oct 2025 06:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdheHrQW9kxZXh8tDuztO/Q3VZmSSOhMglvh4bhim+o=; b=oPaHpcszNwB+mKrCVlLIBUWHtP
	w64nIg52NH0SOcaDmaHTWLTjCEjJL9UgWbC2jKAzPU+DNRJBm0G+ZBgeOoAEQUr2c7YIcthTpOuyf
	58f9zeVCxl6KYLHI6jlQzTDCHUliXXuFrzZl4LRyUFpHI3oT7rps2z5yFdKM3xCAfNrrgERgE7G0i
	fOClDtMq09FEF3K0BusgsP1/NJU30/z5XWiTaiMQFzB21VyT+o6+UyWRPKwW9tmynp9wpJZoCcxpY
	hfu2FoCB97a3NpIoH/ZP4T5sVvlpCQaH4/TV/zNMWdlYswWnOiOb4orXb5zycYldf1odrmgVB4xxt
	I2z6ydug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3qEq-00000006nWc-0AkI;
	Wed, 01 Oct 2025 06:22:56 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3qEn-00000006nVO-0o11
	for ath10k@lists.infradead.org;
	Wed, 01 Oct 2025 06:22:54 +0000
Received: from [192.168.2.212] (p57bd9782.dip0.t-ipconnect.de [87.189.151.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CBA3D6028F357;
	Wed, 01 Oct 2025 08:22:38 +0200 (CEST)
Message-ID: <73fdb56c-df62-4576-8602-fb330cac0dd7@molgen.mpg.de>
Date: Wed, 1 Oct 2025 08:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: avoid unnecessary wait for service
 ready message
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_232253_379062_68251D62 
X-CRM114-Status: GOOD (  22.17  )
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

Dear Baochen,


Thank you for your patch, and sorry for the late reply.


Am 11.08.25 um 11:26 schrieb Baochen Qiang:
> Commit e57b7d62a1b2 ("wifi: ath10k: poll service ready message before
> failing") works around the failure in waiting for the service ready
> message by active polling. Note the polling is triggered after initial
> wait timeout, which means that the wait-till-timeout can not be avoided
> even the message is ready.
> 
> A possible fix is to do polling once before wait as well, however this
> can not handle the race that the message arrives right after polling.
> So the solution is to do periodic polling until timeout.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1
> 
> Fixes: e57b7d62a1b2 ("wifi: ath10k: poll service ready message before failing")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/all/97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/wmi.c | 39 +++++++++++++++++------------------
>   1 file changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index cb8ae751eb312109f74985580065c3b9d3806d51..e595b0979a56d3110ce0acf534e718a4a1f36a0b 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1764,33 +1764,32 @@ void ath10k_wmi_put_wmi_channel(struct ath10k *ar, struct wmi_channel *ch,
>   
>   int ath10k_wmi_wait_for_service_ready(struct ath10k *ar)
>   {
> +	unsigned long timeout = jiffies + WMI_SERVICE_READY_TIMEOUT_HZ;
>   	unsigned long time_left, i;
>   
> -	time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
> -						WMI_SERVICE_READY_TIMEOUT_HZ);
> -	if (!time_left) {
> -		/* Sometimes the PCI HIF doesn't receive interrupt
> -		 * for the service ready message even if the buffer
> -		 * was completed. PCIe sniffer shows that it's
> -		 * because the corresponding CE ring doesn't fires
> -		 * it. Workaround here by polling CE rings once.
> -		 */
> -		ath10k_warn(ar, "failed to receive service ready completion, polling..\n");
> -
> +	/* Sometimes the PCI HIF doesn't receive interrupt
> +	 * for the service ready message even if the buffer
> +	 * was completed. PCIe sniffer shows that it's
> +	 * because the corresponding CE ring doesn't fires
> +	 * it. Workaround here by polling CE rings. Since
> +	 * the message could arrive at any time, continue
> +	 * polling until timeout.

I would have also re-flowed the comment to make it take up less lines.

> +	 */
> +	do {
>   		for (i = 0; i < CE_COUNT; i++)
>   			ath10k_hif_send_complete_check(ar, i, 1);
>   
> +		/* The 100 ms granularity is a tradeoff considering scheduler
> +		 * overhead and response latency
> +		 */
>   		time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
> -							WMI_SERVICE_READY_TIMEOUT_HZ);
> -		if (!time_left) {
> -			ath10k_warn(ar, "polling timed out\n");
> -			return -ETIMEDOUT;
> -		}
> -
> -		ath10k_warn(ar, "service ready completion received, continuing normally\n");
> -	}
> +							msecs_to_jiffies(100));
> +		if (time_left)
> +			return 0;
> +	} while (time_before(jiffies, timeout));
>   
> -	return 0;
> +	ath10k_warn(ar, "failed to receive service ready completion\n");
> +	return -ETIMEDOUT;
>   }
>   
>   int ath10k_wmi_wait_for_unified_ready(struct ath10k *ar)

Great to have this improved upstream!

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

