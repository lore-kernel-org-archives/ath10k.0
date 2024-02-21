Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0052DC48BC3
	for <ath10k@archiver.kernel.org>; Wed, 21 Feb 2024 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI0ppqpQX94Yu79Tq3Cq2zj5iCtQ44NJHr7Cb/yza1A=; b=lusPqeY5/RvzzCeoXoSiOJcAut
	Xtpz+8LwDQ82P/eNfZx6WqrLBLYNdjY77Onwwtw2H8wySoc2Z7BBSR3ZnkPdMsw1hwfBKdlDLEyBX
	Io6Ee5YNFx7IgXdK59fP5dXAm+aicBINRfMFiX+QhQmpou8dsUim6e/PwZzEFJYZGaaiFBHf+AOof
	FxTPDMe4KPCnimbtPSapYLlCBElLjTIAv6oVoPtGHEk3HvGQ0Sb1MJdYiiiwkUEhg6WCIreoZFTgD
	/hsCvAI+HuyUaEjhGC4tzYv/06utjlVV9tgt7zTVoHJDpA1FVqRfDcblhm/ACdVPOpE8Baw4sxEj9
	egvqbFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rclrd-00000000rid-0E4t;
	Wed, 21 Feb 2024 12:38:17 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rclra-00000000riD-3Z63
	for ath10k@lists.infradead.org;
	Wed, 21 Feb 2024 12:38:16 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so5373191a12.0
        for <ath10k@lists.infradead.org>; Wed, 21 Feb 2024 04:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708519094; x=1709123894; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eI0ppqpQX94Yu79Tq3Cq2zj5iCtQ44NJHr7Cb/yza1A=;
        b=WAi3MCEaSSmKlZTt7Jd8wicVEJiPvHzdRJ4l9wr5MwDg6oCTtFIk6ZjeQa7b2xghcU
         sH8TyiHjVlaeFW1EfKszjLwNsamiMGJaiwzbytxg4fPzX+RuzuUPLXgOtQT2rvU+bA10
         oWCANvq2KtIIdKLdzOzvZuET85dPo9+Hw7AAQ2gPib86O0waOCXe+V8lLRWLnBrlz+xz
         XAtSlNzElyjwwJB50GqcgmHUHCHHOCPrp9CDcWNMIzwDexaSJCA0o09KKSiTkJghd/dM
         r/GE72wg/JTS5/LkwjUnQZSmR/W0VZ1avRyT7RckOe4KPlJVpubeq4WZFjY0/osELpak
         w7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519094; x=1709123894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eI0ppqpQX94Yu79Tq3Cq2zj5iCtQ44NJHr7Cb/yza1A=;
        b=OQT6uRE+ijxdW3iHFNhKz4D07l5lAMN4hruFJW/Xyn/zA+5IcShiEwm7Ac1zaLXhU5
         THgIBNXmcqPchGHZgK/G56/t6VQ2S5xPzCof/9I++pM7F64e0N6Ri7uxKk/JD2MTpT5J
         j46Y0Kbr49WfLvu594i2BC0P+rtrHu/SkyuZUOMyeUNYk7412WDWWW/fYL4yeZmMWUUC
         VXHLkoZx9ZlzEdRy0nPQDbxVsuAga8Z6AM+ctWwQiP/L5HusItKjviSAWZ11ddLRl0XK
         DXAWKtZwA2QyAZD/C3eLHyfj6bM/OJuBe0MGVHDbC8c3IA3ZamzToet4uusfOOFDV5v3
         eGwg==
X-Forwarded-Encrypted: i=1; AJvYcCXGqQLL/wVbsmzA+83al9XnU9udCMgvlClhgz1/1yr4Q7MFp5eAJ/UDlEi5Yxx6UHljVIMhq+ithepmJMRDCYRHv/LMCzG3uViFPA==
X-Gm-Message-State: AOJu0YxHgT3yeDcuXLo3gNnru5M4T6aN0HCvQZ5YYzkrTNWHOCYhks1i
	z9EnoR/5qRPpMJrXoVfnIlrs14vp2u5mSVmRXGatp7ZirLBPBf0p
X-Google-Smtp-Source: AGHT+IGqtkxSLniu96E4rr3pDu1aapqH0m/3J++FYnoNms4oj3x2lG8eyPx+27WSjhh2/xOfNjUJLw==
X-Received: by 2002:a17:90b:11c4:b0:299:2c4b:5d21 with SMTP id gv4-20020a17090b11c400b002992c4b5d21mr12247399pjb.15.1708519093637;
        Wed, 21 Feb 2024 04:38:13 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id ee3-20020a17090afc4300b0029a04ec7084sm1621082pjb.54.2024.02.21.04.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 04:38:13 -0800 (PST)
Message-ID: <d67fb4f4-aea2-4668-aac4-6e7eca8db4fa@gmail.com>
Date: Wed, 21 Feb 2024 04:38:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: poll service ready message before failing
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240221031729.2707-1-quic_bqiang@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20240221031729.2707-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_043814_914793_0F593BB2 
X-CRM114-Status: GOOD (  25.89  )
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

Hi Baochen,

On 2/20/24 7:17 PM, Baochen Qiang wrote:
> Currently host relies on CE interrupts to get notified that
> the service ready message is ready. This results in timeout
> issue if the interrupt is not fired, due to some unknown
> reasons. See below logs:
>
> [76321.937866] ath10k_pci 0000:02:00.0: wmi service ready event not received
> ...
> [76322.016738] ath10k_pci 0000:02:00.0: Could not init core: -110
>
> And finally it causes WLAN interface bring up failure.
>
> Change to give it one more chance here by polling CE rings,
> before failing directly.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
>
> Fixes: 5e3dd157d7e7 ("ath10k: mac80211 driver for Qualcomm Atheros 802.11ac CQA98xx devices")
> Reported-by: James Prestwood <prestwoj@gmail.com>
> Link: https://lore.kernel.org/linux-wireless/304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath10k/wmi.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index ddf15717d504..bf6cb2c73128 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1763,12 +1763,28 @@ void ath10k_wmi_put_wmi_channel(struct ath10k *ar, struct wmi_channel *ch,
>   
>   int ath10k_wmi_wait_for_service_ready(struct ath10k *ar)
>   {
> -	unsigned long time_left;
> +	unsigned long time_left, i;
>   
>   	time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
>   						WMI_SERVICE_READY_TIMEOUT_HZ);
> -	if (!time_left)
> -		return -ETIMEDOUT;
> +	if (!time_left) {
> +		/* Sometimes the PCI HIF doesn't receive interrupt
> +		 * for the service ready message even if the buffer
> +		 * was completed. PCIe sniffer shows that it's
> +		 * because the corresponding CE ring doesn't fires
> +		 * it. Workaround here by polling CE rings once.
> +		 */
> +		ath10k_warn(ar, "failed to receive service ready completion, polling..\n");
> +
> +		for (i = 0; i < CE_COUNT; i++)
> +			ath10k_hif_send_complete_check(ar, i, 1);
> +
> +		time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
> +							WMI_SERVICE_READY_TIMEOUT_HZ);
> +		if (!time_left)
> +			return -ETIMEDOUT;
> +	}
> +
>   	return 0;
>   }
>   
>
> base-commit: 707e306f3573fa321ae197d77366578e4566cff5

Thank you for looking at this I will test this and see if it resolves 
the problem we're seeing but since its somewhat rare it may take me a 
bit to validate.

Is this any different than just trying to bring up the interface again 
from userspace? I could be wrong, but my concern with this is that when 
I retried in userspace things got into a very odd state:

  - IWD starts

  - ifdown interface

  - ifup interface, timeout -110

  - Retry ifup, success

  - Authenticate/associate succeed

  - 4-way handshake fails because the device never received the 1/4 frame.

IWD would then retry indefinitely with auth/assoc succeeding but never 
receiving any 4-way handshake frames. The only way to get things working 
again was reloading the ath10k driver/reboot. Maybe this patch is 
different because its waiting for the initial request and no issuing a 
second one? Just wanted to point that out in case it sheds any light.

Thanks,

James


