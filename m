Return-Path: <SRS0=B0Fa=PI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFBCC4332F
	for <ath10k@archiver.kernel.org>; Wed, 20 Oct 2021 08:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACB36115A
	for <ath10k@archiver.kernel.org>; Wed, 20 Oct 2021 08:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ACB36115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6INuW0F0V5yBumsDXhNcfSneurnruETuA7GEikA2W8E=; b=Sw5vzfKtDpAem/
	VgMp1SvLEGuxTRsMDP37wCOX59Xdfst3Jwxaz5eJEPOzrZRkAmSyIQymcTShB5pTVgClJX54DV5vN
	VkJFQt56WE5O2eBBBBV0PY3Bi089nU7i2l3WAOYKNkY/QQkpxbfH7Ly1lBDI0uYe6SDegDcxywIiW
	0/cbxNR8nPqFARgmdaSXQT76u+N1daGdYS2XZ8ZizPRWzh6sFBPSBWkmhZ6udi/Vo8RpAz/06T/L3
	XCW2fAguv8/JTZbHHxAJiZsV5hCm5dQPSDfweVrA7itDwqjaatHQIp+wt+rTBWzhM9agX1Pwp09Uo
	oKxWSWL8jbN0a60g9KvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md6R1-003kiO-5n; Wed, 20 Oct 2021 07:54:51 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md6Qy-003kgS-2b
 for ath10k@lists.infradead.org; Wed, 20 Oct 2021 07:54:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634716487; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=l1wCt2XwuXKYZBLiuE4Mb1G+nUelwSpcbnLazoCaWbw=;
 b=X3fy4nwD/WhMnxHP3wok93fePol3YR8Moc+8gaGSarjk1dBC2G0iTuVbs9XhzoAQnO2V3dgZ
 HrQ6GHPB09kf/QeypPdQAu/0a4DgDFHGSHyxDapVBqgmsU4py+j+dwguzEYLjlv9pOtOo8dm
 7edUIKiQdXK3SQMpRQzkHVGNuqY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 616fcb3259612e0100b3c301 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 07:54:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A578DC4360C; Wed, 20 Oct 2021 07:54:25 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D33B8C4360C;
 Wed, 20 Oct 2021 07:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D33B8C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210722193459.7474-1-ojab@ojab.ru>
References: <20210722193459.7474-1-ojab@ojab.ru>
To: ojab <ojab@ojab.ru>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 ojab <ojab@ojab.ru>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163471645955.23156.7506403648173685920.kvalo@codeaurora.org>
Date: Wed, 20 Oct 2021 07:54:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_005448_222783_6C8744A0 
X-CRM114-Status: GOOD (  10.92  )
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

ojab <ojab@ojab.ru> wrote:

> After reboot with kernel & firmware updates I found `failed to copy
> target iram contents:` in dmesg and missing wlan interfaces for both
> of my QCA9984 compex cards. Rolling back kernel/firmware didn't fixed
> it, so while I have no idea what's actually happening, I don't see why
> we should fail in this case, looks like some optional firmware ability
> that could be skipped.
> 
> Also with additional logging there is
> ```
> [    6.839858] ath10k_pci 0000:04:00.0: No hardware memory
> [    6.841205] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
> [    6.873578] ath10k_pci 0000:07:00.0: No hardware memory
> [    6.875052] ath10k_pci 0000:07:00.0: failed to copy target iram contents: -12
> ```
> so exact branch could be seen.
> 
> Signed-off-by: Slava Kardakov <ojab@ojab.ru>
> Tested-by: Axel Rasmussen <axelrasmussen@google.com>

I'm planning to take this patch instead:

https://patchwork.kernel.org/project/linux-wireless/patch/20211020075054.23061-1-kvalo@codeaurora.org/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210722193459.7474-1-ojab@ojab.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
