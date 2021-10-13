Return-Path: <SRS0=ohlR=PB=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D0AC43217
	for <ath10k@archiver.kernel.org>; Wed, 13 Oct 2021 07:49:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3758960E96
	for <ath10k@archiver.kernel.org>; Wed, 13 Oct 2021 07:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3758960E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkGhFzd6fbB0mfpmBh4Oot+G0ULknY11QAEi+snfj1E=; b=cpV96QpnJqQtkI
	60HrVIaCdBGTbPlzRa6S2tb3ZQO1BLLuDhPI5ayJa18EoYoaaJvk8AfOMTUfgsLGMOUFfGI6gn1FP
	moSKrsjyDGbQr+DA6cN/5PsWZOR4MmhtT3ajd6OmIBeO5PKhqK51coh3rG/SCuCLcGPZHNXnPrjKD
	Q541PYugQJBz7pVtaP2D5D+hu2RC+zl+kWWCQwbNMhWPv29A188YPcCjvc20JnclG6RO7BN/0/GCb
	oJIIvCx7FbzugmcQG69tvgBtm6tf0dG3d5KxgnaL0Rt+yaRb/bNeRlWA35lh742mCYqW4SSid84jd
	LfMtQwOkHvs7K67jbquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZ0A-00FRh5-Hq; Wed, 13 Oct 2021 07:48:38 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXf7-00F8Ql-Kr
 for ath10k@lists.infradead.org; Wed, 13 Oct 2021 06:22:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634106174; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=AhXYz1Ss+Q8rkEhE3NsNaZvgoGqRaJkpgTQWVFfUO3s=;
 b=vzoEiEllBtv07Gxuj4e7EV8Ab1ufbGoH4hNWLIPfJxVngr/UP32NdUCj38cO2GSU1yJz84eM
 O7tIMwqPhSlUwgvBJkulxYpzKeaG6x+QoiZbZxmWAdKKZiM104qVBMKWELJH9sGS7iLku/N6
 vYEBmxpeqQBLI5o5GrAiPYydPiI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61667b2a446c6db0cba25996 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 06:22:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E0071C43616; Wed, 13 Oct 2021 06:22:33 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9CEB0C4338F;
 Wed, 13 Oct 2021 06:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9CEB0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] wireless: Remove redundant 'flush_workqueue()' calls
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0855d51423578ad019c0264dad3fe47a2e8af9c7.1633849511.git.christophe.jaillet@wanadoo.fr>
References: <0855d51423578ad019c0264dad3fe47a2e8af9c7.1633849511.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, kuba@kernel.org, stf_xl@wp.pl,
 luciano.coelho@intel.com, amitkarwar@gmail.com, ganapathi017@gmail.com,
 sharvari.harisangam@nxp.com, huxinming820@gmail.com,
 ajay.kathat@microchip.com, claudiu.beznea@microchip.com,
 imitsyanko@quantenna.com, geomatsi@gmail.com, pkshih@realtek.com,
 jussi.kivilinna@iki.fi, pizza@shaftnet.org, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163410614672.12983.17840128488800374930.kvalo@codeaurora.org>
Date: Wed, 13 Oct 2021 06:22:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_232254_416890_55C0FC76 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - 	flush_workqueue(E);
> 	destroy_workqueue(E);
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-drivers-next.git, thanks.

ff1cc2fa3055 wireless: Remove redundant 'flush_workqueue()' calls

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/0855d51423578ad019c0264dad3fe47a2e8af9c7.1633849511.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
