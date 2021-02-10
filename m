Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAC9C433E0
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:36:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FABA64E2E
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FABA64E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uO/bMiWD+L3xmusVeYZQrQPh9LzulkwNX8Cm4qPFnjQ=; b=b6mPGvDmFsenRtvJwifUq2ULe
	JaUnDIWMPGwyuMTI6SZ7cI6zw1zVv9NhjJ5YKkuGkjvZ4/BEHsa9Tz1rmvpKVgufwBgG4AQRO6R01
	mN/h3Dnlfx2JPiTttqPBeUaXMojOd3q4uTxG/SkwMV5q5KgEKsvx41FHrhsFiZi8dzkY4nQxH/dzI
	np1C9xnlp7PtPkQ2acfRXgIY8eZubwXFBUM2EnrkO9tR8sI/YfVw+ro5TlndXs9ZZ1IcarALPP9Gw
	qnNty86i5F7A8foa3FZSUpUuBgHUv98grJBH7IDvSsYK5w26uayLZ6yTpmM6eM5fpeGCpcqrZoSw2
	b2dN3wq7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9fMq-0003m1-LF; Wed, 10 Feb 2021 02:36:36 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9fMo-0003l3-4A
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 02:36:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612924594; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KP3hTxbzRxMtj43K3BWRTDhhCWad/fnTc01joBzCoVI=;
 b=vKCTWDUATxcGQ044GUBjv2P7+mzjmbbSIktDsm1I6FugI1m0/ImoTCCDXmo25/Otu8f06Unr
 t5+zm7A2voSv0lIWc6mV7UC3F2Eu3nLy4DGRI6EAV/n8RLCs/ZSTPOhy/g0LOXtyqPtdsdkV
 /RULKaEv74sWhjL2khjILe/t/zo=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 602346a981f6c45dce66a058 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 02:36:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 98AD9C433CA; Wed, 10 Feb 2021 02:36:24 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D431DC43461;
 Wed, 10 Feb 2021 02:36:23 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 10 Feb 2021 10:36:23 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 5/5] ath10k: reduce invalid ht params rate message noise
In-Reply-To: <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
Message-ID: <5c31f6dadbcc3dcb19239ad2b6106773@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_213634_511026_50DA7685 
X-CRM114-Status: GOOD (  17.03  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kuba@kernel.org,
 davem@davemloft.net, kvalo@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2021-02-10 08:42, Shuah Khan wrote:
> ath10k_mac_get_rate_flags_ht() floods dmesg with the following 
> messages,
> when it fails to find a match for mcs=7 and rate=1440.
> 
> supported_ht_mcs_rate_nss2:
> {7,  {1300, 2700, 1444, 3000} }
> 
> ath10k_pci 0000:02:00.0: invalid ht params rate 1440 100kbps nss 2 mcs 
> 7
> 
> dev_warn_ratelimited() isn't helping the noise. Use dev_warn_once()
> instead.
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
> b/drivers/net/wireless/ath/ath10k/mac.c
> index 3545ce7dce0a..276321f0cfdd 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -8970,8 +8970,9 @@ static void ath10k_mac_get_rate_flags_ht(struct
> ath10k *ar, u32 rate, u8 nss, u8
>  		*bw |= RATE_INFO_BW_40;
>  		*flags |= RATE_INFO_FLAGS_SHORT_GI;
>  	} else {
> -		ath10k_warn(ar, "invalid ht params rate %d 100kbps nss %d mcs %d",
> -			    rate, nss, mcs);
> +		dev_warn_once(ar->dev,
> +			      "invalid ht params rate %d 100kbps nss %d mcs %d",
> +			      rate, nss, mcs);
>  	}
>  }
The {7,  {1300, 2700, 1444, 3000} } is a correct value.
The 1440 is report from firmware, its a wrong value, it has fixed in 
firmware.
If change it to dev_warn_once, then it will have no chance to find the 
other wrong values which report by firmware, and it indicate
a wrong value to mac80211/cfg80211 and lead "iw wlan0 station dump" get 
a wrong bitrate.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
