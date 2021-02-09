Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7FAC433DB
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 07:26:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2814964E9D
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 07:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2814964E9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6GjnNHMvo+UX1M9Sav7vZp7mMRGVzeN8HhX6l2WzrQw=; b=Ep7mSwGjqS3tfIXYeiAyxYQAe
	WcFnL5S/XHXKNe177OzgiVLVmsoMZEqQjyQDCWKk0Ug68YDa2kPl6oNk/1MgzcDs1VEqKpFH+gikV
	KU+/7nNontfPAyZDzSvChRq83SqdxZnpfFx4AKwELnGRUimV5pJj0hjVG/oT71aut4CQiOh1oKDD6
	PkoqHLT8lTOkBaBRe3VSs4ZS2oqUzUXa8Go1Cse1ZELOgWCFNEnjhU9Z58itYCqf6e9B8iXpxWYCx
	IRxdbougeTJxWK7J+E3Y2IvKKH6Dm/M0u0ySvbEaj9vqKhxz1KLfsB+9pbC06q03XgYq8E+dqgfcK
	qFb5mSTCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9NOz-0002w8-Pg; Tue, 09 Feb 2021 07:25:37 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9NOv-0002vB-Ii
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 07:25:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612855535; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=04UGIPgX5fRUfTH4wAz78bAt4RZFa/likoC69uKcovk=;
 b=HL78ar0vT5aA6Iv7TWXH3y44036GsFnKAK5YATzXNKtaGNhNbTOWJgs18/K/ohx0ABXzSvug
 t0DqF0zwqAH2veYrftUOLOxqc8/Mgo4bNshotqoFBOjp6CdVRZz08iEL7B9FvcpOOBM0pM4q
 5P4dCUOdv+ZrVrBA50LNoJBsJPc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 602238e4e4842e91284a30f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 07:25:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3D95FC433ED; Tue,  9 Feb 2021 07:25:24 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C9955C433CA;
 Tue,  9 Feb 2021 07:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9955C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add new debug_mask for sta related logs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1612463738-16542-1-git-send-email-tamizhr@codeaurora.org>
References: <1612463738-16542-1-git-send-email-tamizhr@codeaurora.org>
To: Tamizh chelvam <tamizhr@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210209072524.3D95FC433ED@smtp.codeaurora.org>
Date: Tue,  9 Feb 2021 07:25:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_022535_442511_B5D5C9DB 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>,
 ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Tamizh chelvam <tamizhr@codeaurora.org> wrote:

> Add new level ATH10K_DBG_STA debug_mask for printing
> sta related logs. This will be useful to check the
> debug logs of connection and changes related to
> station.
> 
> Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00021
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

97614c59cb72 ath10k: Add new debug level for sta related logs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1612463738-16542-1-git-send-email-tamizhr@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
