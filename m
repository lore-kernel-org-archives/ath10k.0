Return-Path: <SRS0=aH4t=LN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E29C2B9F4
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 09:13:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE4C611AC
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 09:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE4C611AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cduNOhA3SMbw0XIILmi2q+SBnwB9iJsRb9i5fz9Rrf4=; b=uiyDHgW5SCC3Xs
	rfXxnlOE2smpjyPpEmH3F7CrLnCe8jlAZ7JFclz7glKycxNl+WzTOPVAvpAZqInFXyYdM1aYFYcgC
	mWeicFe5pUIxsZ6CBzYmRClg6WnQtpKb+jSbB+KxLEpJAM4HDkoSX6ArPtbrn9AoudjwqbJLd/YKe
	F0T/rShH1pawD5FvmYXwKyL4btxS3Lh3OIvT3RAMZA2NC9ZXURP6uVFKX5QV0Z+BnCZ1lOiLotstW
	kQe0RAiPAyN/nT6f9pnKqpZp29JdR6pE7HBu5wdqbyLbx8vv9k0BfPrNMF46PdD6QO/QL5cxSS1it
	+ZGSj21+Ld861uCT/uTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luX2N-00GhEL-1G; Sat, 19 Jun 2021 09:13:11 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luX2K-00GhE2-Ah
 for ath10k@lists.infradead.org; Sat, 19 Jun 2021 09:13:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624093988; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=H0sbWODlKoSLIOSfRR0sPPZJCVLCPWUz5A6uE/iTadY=;
 b=i5zpjqEalBq/JUR68ZvUaUfKniKvHMU3jlFTDhDUMNe28YrO8RqfhctNLulz7Apj/tYTKls8
 y+7zq7m7rKaxy4Ys86/HeZk4jHF3CRDHKrp4+qzGfVEQWHWqpzfXGOO5xJXz/r1HCMYVFeJ1
 SgFvvYzy8U7J5blU6AWtfv5jE48=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60cdb520e570c056195392d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Jun 2021 09:13:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D877AC43217; Sat, 19 Jun 2021 09:13:03 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 83CA3C433F1;
 Sat, 19 Jun 2021 09:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 83CA3C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: demote chan info without scan request warning
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210522171609.299611-1-caleb@connolly.tech>
References: <20210522171609.299611-1-caleb@connolly.tech>
To: Caleb Connolly <caleb@connolly.tech>
Cc: caleb@connolly.tech, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210619091303.D877AC43217@smtp.codeaurora.org>
Date: Sat, 19 Jun 2021 09:13:03 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_021308_485697_A742C9F1 
X-CRM114-Status: UNSURE (   9.49  )
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

Caleb Connolly <caleb@connolly.tech> wrote:

> Some devices/firmwares cause this to be printed every 5-15 seconds,
> though it has no impact on functionality. Demote this to a debug
> message.
> 
> I see this on SDM845 and MSM8998 platforms, specifically the OnePlus 6 devices,
> PocoPhone F1 and OnePlus 5.  On the OnePlus 6 (SDM845) we are stuck with the
> following signed vendor fw:
> 
> [    9.339873] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> [    9.339897] ath10k_snoc 18800000.wifi: qmi fw_version 0x20060029 fw_build_timestamp 2019-07-12 02:14 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c8-00041-QCAHLSWMTPLZ-1
> 
> The OnePlus 5 (MSM8998) is using firmware:
> 
> [ 6096.956799] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002
> [ 6096.956824] ath10k_snoc 18800000.wifi: qmi fw_version 0x1007007e fw_build_timestamp 2020-04-14 22:45 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0.c6-00126-QCAHLSWMTPLZ-1.211883.1.278648.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00041-QCAHLSWMTPLZ-1
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.1.0.c6-00126-QCAHLSWMTPLZ-1.211883.1.278648
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8a952a955de7 ath10k: demote chan info without scan request warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210522171609.299611-1-caleb@connolly.tech/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
