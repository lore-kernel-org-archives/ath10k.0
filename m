Return-Path: <SRS0=NYaa=LG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A25CC48BCF
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 10:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5603610A7
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 10:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5603610A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nj/OOE7tC0AWce3LQtcZVrcJP3O8o+MMePLO6kkna6Y=; b=Wgk/oPGfmTzCrP
	zDV3cAZybjAkL3G8rr7xiIa+EhtY4CtmxYM982vHPGs1zeWV9eP513/RmVDJZgOeAkdOcpQyDp+15
	Rs86NAqK2EQpFq5wapR5rrsdDk4KwwbS70/bs5yA2PVfisdPkumUvlK7+bzk6IBWJJjkd9l5VzBg8
	4oLBrSCb1lJRMHFPPV1dIyRp2k0HW8ECKd6oVSBzhaKPNuhmFPPIzE0+9hKsijIKEjvOESeIKIwrT
	M0bc6Dixs2Oq8u7Oej+6A2Uo2RqdCGCZTah4BsS6/N/CV4q9kMeF/eM6hemAPUOr26tg307T5Wgk0
	KbqsfYdbdGSkbFbHeWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls10s-008IVJ-FE; Sat, 12 Jun 2021 10:37:14 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls10o-008IUy-Kz
 for ath10k@lists.infradead.org; Sat, 12 Jun 2021 10:37:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623494232; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=brVC1m2uQ7jacnf+j+PhnRqs+Cy6+AllMm/70hQRjPg=;
 b=dzLn6HGHsjcr2bBxxl9+xCyhMIDwntvUXy2YP6JGw5EKkx+o2rX35uEB+Eec5DGn5WJhKL24
 kkVtXYoATAJC9EeX/TfSO66fVa9sTNPzwyngZlRE+qL8HaXpxxji72mrKqQISmlbuFRlTFm9
 SXnOEUTNrIKK5E8JUdWxY96+ic8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60c48e38ed59bf69cce6bc81 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Jun 2021 10:36:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2C65EC43217; Sat, 12 Jun 2021 10:36:40 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EEF44C433F1;
 Sat, 12 Jun 2021 10:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EEF44C433F1
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
Message-Id: <20210612103640.2C65EC43217@smtp.codeaurora.org>
Date: Sat, 12 Jun 2021 10:36:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_033712_398714_1FB9F1C0 
X-CRM114-Status: UNSURE (   6.67  )
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
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

On what hardware and firmware version do you see this?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210522171609.299611-1-caleb@connolly.tech/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
