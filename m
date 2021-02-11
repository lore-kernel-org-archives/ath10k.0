Return-Path: <SRS0=C/UJ=HN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83ADC433E0
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 18:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7498264E5F
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 18:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7498264E5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z8XkvnvFC/zdklMWTWu4MVuF6UgbPfbzX2WoALQm2Bc=; b=IqgEB5K5RDf0xs0vLiqpMCaob
	hkOd9aSuzNlnYToi7MgGEbn79Tsh3DPJROLpMKfT8k9OQb4NjZIcTrT4BQIJuu1ydx4stnOh578x3
	RdeEIeJexvvUQmtcn37dUQNNoeKTNMLjuyrV1zsViOrzOjc2TIIJMM5K05HQm9cCS/qq4aSKej3Be
	aFRHQnSgFZO8jcUnjJzb+0qlqIMmyRAFu/mu2R6BRwLcEpLToNGZR8LC6MdB58i+ghe8aMN5QGNmp
	thpUuGLtshbChFJLzBLC6rLeKF2TQBIw6MKGlxKjlQ2v99mFbyq42+Q/XYa0xkioCtHDWoTU/o4rn
	1M9qI7Kxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAGg4-0002Lc-Tf; Thu, 11 Feb 2021 18:26:56 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAGg1-0002L0-JG
 for ath10k@lists.infradead.org; Thu, 11 Feb 2021 18:26:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613068013; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=XQMYp79ftc2CD2w0g/sVHwqX5MSlVZ7BvVff5QTyZow=;
 b=k8Pp978TMwnhcnlbWHaT15/PYlkA/szkXGHZX7pePTWDRXbFn8tedrj21CSkh8I7a5Lg1bZk
 fJQuc6HE9/9F69ElyxJMU3px/MDtond4EiDr5KhRAoLxzePpBEpAyQNQzH1MxHh0wqKymrnt
 onlDapH7ZPcey7KAmz/Kb7gHPDc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 602576eb3919dfb455d7bb35 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 18:26:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A636EC43463; Thu, 11 Feb 2021 18:26:50 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 08C17C433C6;
 Thu, 11 Feb 2021 18:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 08C17C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: hold RCU lock when calling
 ieee80211_find_sta_by_ifaddr()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210210212107.40373-1-skhan@linuxfoundation.org>
References: <20210210212107.40373-1-skhan@linuxfoundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210211182650.A636EC43463@smtp.codeaurora.org>
Date: Thu, 11 Feb 2021 18:26:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_132653_966927_4880A1AE 
X-CRM114-Status: GOOD (  10.20  )
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
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Shuah Khan <skhan@linuxfoundation.org> wrote:

> ieee80211_find_sta_by_ifaddr() must be called under the RCU lock and
> the resulting pointer is only valid under RCU lock as well.
> 
> Fix ath10k_wmi_tlv_op_pull_peer_stats_info() to hold RCU lock before it
> calls ieee80211_find_sta_by_ifaddr() and release it when the resulting
> pointer is no longer needed.
> 
> This problem was found while reviewing code to debug RCU warn from
> ath10k_wmi_tlv_parse_peer_stats_info().
> 
> Link: https://lore.kernel.org/linux-wireless/7230c9e5-2632-b77e-c4f9-10eca557a5bb@linuxfoundation.org/
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

09078368d516 ath10k: hold RCU lock when calling ieee80211_find_sta_by_ifaddr()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210210212107.40373-1-skhan@linuxfoundation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
