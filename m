Return-Path: <SRS0=4y1J=OS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A1CC433F5
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 14:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED7460F0F
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 14:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1ED7460F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eI+G6aHCaWKDcaFEBi5dGxct2vgRenCnl4bkeUyRmw=; b=v+SjFvP9RUTK+I
	me2ZpaOT5pla7xuteyoeZz9Z8NpQCmbEN+aCwDRrkWUKQ3uC+ywX9kLWT+5rLSKfwbXPcJKdMTpJl
	2qhyggh9iBezw/PVIhVJyy0H6mYX10sjsti36tqQp9gLBRdeiXl4+k2rrXAzflAC00K/il0MxvVwl
	qpzXTcvQWEzbYm3zsZFytrXPfN7vMj5vHVDNjFuBcE648rQ4nSJAzfan3zLEvup4dTyw06WHYo8y3
	iC4ArjOZnXhZKXjaTps4nchDsr9kgLbqMB6C8DQ5qy8WEl6lBIp1GgnBoVeZVmYeVQHvgNxLWOa8b
	6B93LGjhFo0F0H812U4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVEEv-007ct6-HO; Tue, 28 Sep 2021 14:37:49 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVEEf-007cq6-Cp
 for ath10k@lists.infradead.org; Tue, 28 Sep 2021 14:37:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632839866; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=EDw3PyEIfg3aWiJp4IxUccYqKwjHMVaT8ASH+yp4NG8=;
 b=GWJoWwGI8UhfOK13exeY4ZQqHrdLQRvcgf8jZ/9CP8uqw/u9wtQcoxDA4dsF95DjbRY4gDaz
 q+jkGpSJGh6puJRFa1p9t7pTX4cVlte0ia54q1y98EYu6CiCy1LbpeAmiXo9UcEE7JVbcGr6
 KVkQqbcexnWkpbjptVqv/aG1gq4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6153285c8578ef11edb5b777 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 14:36:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 28826C4338F; Tue, 28 Sep 2021 14:36:12 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 17DB7C4338F;
 Tue, 28 Sep 2021 14:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 17DB7C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: sdio: Add missing BH locking around napi_schdule()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210824144339.2796122-1-festevam@denx.de>
References: <20210824144339.2796122-1-festevam@denx.de>
To: Fabio Estevam <festevam@denx.de>
Cc: kuba@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, paulmck@kernel.org, marex@denx.de,
 wgong@codeaurora.org, alagusankar@silex-india.com, erik.stromdahl@gmail.com,
 Fabio Estevam <festevam@denx.de>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928143612.28826C4338F@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 14:36:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_073746_714736_20D8124B 
X-CRM114-Status: GOOD (  13.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Fabio Estevam <festevam@denx.de> wrote:

> On a i.MX-based board with a QCA9377 Wifi chip, the following errors
> are seen after launching the 'hostapd' application:
> 
> hostapd /etc/wifi.conf
> Configuration file: /etc/wifi.conf
> wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> Using interface wlan0 with hwaddr 00:1f:7b:31:04:a0 and ssid "thessid"
> IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> wlan0: interface state COUNTRY_UPDATE->ENABLED
> wlan0: AP-ENABLED
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> ...
> 
> Fix this problem by adding the BH locking around napi-schedule(),
> in the same way it was done in commit e63052a5dd3c ("mlx5e: add
> add missing BH locking around napi_schdule()").
> 
> Its commit log provides the following explanation:
> 
> "It's not correct to call napi_schedule() in pure process
> context. Because we use __raise_softirq_irqoff() we require
> callers to be in a context which will eventually lead to
> softirq handling (hardirq, bh disabled, etc.).
> 
> With code as is users will see:
> 
> NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> "
> 
> Fixes: cfee8793a74d ("ath10k: enable napi on RX path for sdio")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

019edd01d174 ath10k: sdio: Add missing BH locking around napi_schdule()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210824144339.2796122-1-festevam@denx.de/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
