Return-Path: <SRS0=JAVW=GS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07752C433E0
	for <ath10k@archiver.kernel.org>; Fri, 15 Jan 2021 13:26:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8EF423359
	for <ath10k@archiver.kernel.org>; Fri, 15 Jan 2021 13:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8EF423359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9KvBPYyv0sRD4QOWK2O41mKx43+TtWpntNg5GaYDhyU=; b=xAsFwqkJ4i9mOooPZ6mcUe6k1
	lEyN1wUjgWqFei7SR6Hk+4TQxsK4n2vFHCt1CnVSosN+lEztualM6/620vfUE6xx8kAanpiO9/mSy
	MurO0FFZre+9ARsZXY/WVLLOFFRTPuekvs9NPjEjmXGfhdwez4Kfm+BBMX9sZ+HsIaUxBYghjxoeF
	0pQFZbAn0onxVycx10jpTQ7HrR7rrTcoeFMyWAh2rUgIpYufLTk3rdFdN+FzVs42kdh6IdssDrllJ
	FkKX8qbMZekDaQcETXrb8JYjFyJ66vmXoj7eqdLeMxcxAHC/2AjymfYoqavV0+Xlp+pO+TN0xqSQ7
	HdE6SQsvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0P6u-0004ac-Kx; Fri, 15 Jan 2021 13:25:52 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0P6p-0004Z8-BZ
 for ath10k@lists.infradead.org; Fri, 15 Jan 2021 13:25:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610717149; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=VfNv5JfVDe8cpm3HhLuTk+6726uEESWvIr0zCga7Mpk=;
 b=WtLY7HDBTdjueh3l1kfp0+romoz069zh3gASeF8eyFRCGoPZZ6PX0QRzC65vlqw0NIw+rwcu
 Yv04QWRUi3saxkimFMGMYPJsxqsvpm8gm0QnXKqJ/S9L+U7SWhMo5lhcP8y0wIkGscaLmaKG
 EKBTC3qXJaNQM0eACr2b5QS3CG4=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 600197d375e5c01cbad988dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 13:25:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 16626C433ED; Fri, 15 Jan 2021 13:25:39 +0000 (UTC)
Received: from Pillair (unknown [103.149.159.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: pillair)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E2699C433C6;
 Fri, 15 Jan 2021 13:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2699C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=pillair@codeaurora.org
From: "Rakesh Pillai" <pillair@codeaurora.org>
To: "'Kalle Valo'" <kvalo@codeaurora.org>
References: <1593197633-9014-1-git-send-email-pillair@codeaurora.org>
 <87k0tbngz6.fsf@codeaurora.org>
In-Reply-To: <87k0tbngz6.fsf@codeaurora.org>
Subject: RE: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
Date: Fri, 15 Jan 2021 18:55:33 +0530
Message-ID: <005901d6eb41$e9ce47a0$bd6ad6e0$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHK1UA7L8ou4VjNidoeHu16b5pDlgHqoQMdqjGCxPA=
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_082549_997743_D3BF0A2B 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


> -----Original Message-----
> From: Kalle Valo <kvalo@codeaurora.org>
> Sent: Tuesday, December 22, 2020 12:07 AM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
> 
> Rakesh Pillai <pillair@codeaurora.org> writes:
> 
> > This patch series includes some fixes when the device
> > is in recovery mode, i.e. when the firmware goes down.
> >
> > - Pausing TX queues when FW goes down
> > - Removed unwanted/extra error logging in pkt TX path
> > - Skipping wait for FW response for delete cmds
> > - Handling the -ESHUTDOWN error code in case of SSR.
> >
> > Rakesh Pillai (2):
> >   ath10k: Pause the tx queues when firmware is down
> >   ath10k: Skip wait for delete response if firmware is down
> 
> This has been tested only on WCN3990. How do I know that this doesn't
> break other hardware families?

" ath10k: Pause the tx queues when firmware is down"
This is done only for SNOC (wcn3990) target and does not affect other
targets.

" ath10k: Skip wait for delete response if firmware is down"
The skip for wmi responses is done based on the flag
"ATH10K_FLAG_CRASH_FLUSH", which is generic for all targets.
Since if the FW is down, there wont be any response from the FW for any
target.

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
