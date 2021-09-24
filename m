Return-Path: <SRS0=oQud=OO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2123DC433F5
	for <ath10k@archiver.kernel.org>; Fri, 24 Sep 2021 08:08:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E261161211
	for <ath10k@archiver.kernel.org>; Fri, 24 Sep 2021 08:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E261161211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5mDQUe87JBNdlLVveH7Gg3oAwzVpc1JFCgLSqWbhgc=; b=UQ+XnBjNwmSHPW
	s+jtl2ZhUbhDuo7zx+AJew/6G/54U0nB5k77fbxs4H1vhAn1h3vivDd7Op+d8ZLTkV8RqF43avh6V
	b3ybZXcjOgN8GxteTrZx2fT2YoAQ1fDLIsOlvQGETWx3PVq3abxDHqeBzWraSk/hCDi6BGiSzg/Aj
	VwNq/yyWDkBkfZMFB9V8d+pyD2nH+iLZqt7TSusxX2aQDnYq0fRQUOyct2rzxgkxl4/xkpOgt/ymd
	ek7uKt+S5yjh1nJfIFodoJHeWpt+qud240/4HQdw1b6PQjqkuWHrzo/4OZtCsMoJ6c8xdrhwwA7ff
	ABUcVtU28Cs59mejjjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTgFi-00DRi8-AF; Fri, 24 Sep 2021 08:08:14 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTgFc-00DRf4-Dk
 for ath10k@lists.infradead.org; Fri, 24 Sep 2021 08:08:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632470891; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=oagsw+UheuBzr8hFvh9igKPmwL4Ple1Gl74ol+OtCSE=;
 b=iPXxmJXRb26OFkghTbSR8ep/8NaCEWGQSrQLdSQx+6T0bKRjhMq/kjUwatbPvvcONjEgBrBD
 ervRwDu36vS6hK8FuphK7UBGQrUm6auN8uI730/LnNkWqYEgr/3895s6GrunnRtxKtRujUw2
 yKFb9zVOh5mlEhvQBHorJ2DmxK8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 614d8751ec62f57c9a6b670c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 08:07:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DE4D5C43460; Fri, 24 Sep 2021 08:07:44 +0000 (UTC)
Received: from PILLAIR1 (unknown [103.155.222.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: pillair)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 63179C43618;
 Fri, 24 Sep 2021 08:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 63179C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: <pillair@codeaurora.org>
To: "'Kalle Valo'" <kvalo@codeaurora.org>,
 "'Stephen Boyd'" <swboyd@chromium.org>
Cc: <ath10k@lists.infradead.org>, <govinds@codeaurora.org>,
 <kuabhs@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <youghand@codeaurora.org>
References: <002501d7af73$ae0a7620$0a1f6260$@codeaurora.org>	<CAE-0n52DcCwcdR07fvMLrj=RJFtNthy0FdWmt1gBWiD9eLrOvQ@mail.gmail.com>
 <87bl4itnd8.fsf@codeaurora.org>
In-Reply-To: <87bl4itnd8.fsf@codeaurora.org>
Subject: RE: [PATCH] ath10k: Don't always treat modem stop events as crashes
Date: Fri, 24 Sep 2021 13:37:37 +0530
Message-ID: <005101d7b11b$405bf280$c113d780$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIYJ9kKn6Tt/ByohP9gdNhIBlqrqgHHLrXjAbRpcN6rFgnMgA==
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_010811_952766_B5752B11 
X-CRM114-Status: GOOD (  17.59  )
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



> -----Original Message-----
> From: Kalle Valo <kvalo@codeaurora.org>
> Sent: Friday, September 24, 2021 1:30 PM
> To: Stephen Boyd <swboyd@chromium.org>
> Cc: pillair@codeaurora.org; ath10k@lists.infradead.org;
> govinds@codeaurora.org; kuabhs@chromium.org; linux-arm-
> msm@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> wireless@vger.kernel.org; netdev@vger.kernel.org;
> youghand@codeaurora.org
> Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as
> crashes
> 
> Stephen Boyd <swboyd@chromium.org> writes:
> 
> > Quoting pillair@codeaurora.org (2021-09-21 22:35:34)
> >> On 9/5/21 4:04 PM, Stephen Boyd wrote:
> >>
> >> > +static int ath10k_snoc_modem_notify(struct notifier_block *nb,
> >> > +unsigned long
> > [...]
> >>
> >> > +
> >>
> >> > +          return NOTIFY_OK;
> >>
> >> > +}
> >>
> >>
> >>
> >> Thanks for posting the patch. It would be preferable to use a
> >> different flag instead of ATH10K_SNOC_FLAG_UNREGISTERING,
> >>
> >> since we are not unloading the ath10k driver.
> 
> Weird, I don't see pillair's email on patchwork[1] and not in the ath10k
list
> either. Was it sent as HTML or something?

Hi Kalle,
Yes, I replied via the "In-reply-to" from the patchworks[1] link.

Thanks,
Rakesh Pillai

> 
> [1] https://patchwork.kernel.org/project/linux-
> wireless/patch/20210905210400.1157870-1-swboyd@chromium.org/
> 
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingp
> atches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
