Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBCCC433E0
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 14:41:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009F864E28
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 14:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 009F864E28
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FES8YSrhfB6pzY3oU/oK8RBCyZfZaxf098/R/YwcdJA=; b=Ozzo6XfLbx1m12eKZhW9r5LY0
	3OlPgASvL5pDcPd4iBRCZIgP/H4Hw8Yp4aRcRXaDiHF2rkI7SuaCG8ONLr9zFdHneWBAOUQLpdUfN
	vOY3AjTzN9Kp3Ua7EoZpRTXYvD7abzTvn5gOY27fE2n70eO1TeMtsGv9swSo8Tv6zjs6Sf0/m7mSJ
	g4mfTAZ5NvSYyYHcM62XXMLU8kp6kDvCXCPmPe4muOsOKorWE1irKTl7IIrjKSZOc8ZYyFMW4o5Uc
	g5vgklZKyGDXUV3/WJEjDpwQ6S1rQhx1k9Avgv6IPnXuBeXND8CNhxwqfeAYyJ6p7VPACj1NB0N17
	bD2VjyIdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFeIs-0000W7-FX; Fri, 26 Feb 2021 14:41:14 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFeIo-0000Vf-TN
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 14:41:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614350471; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=QKnTlpsb0EuIYLzuabumyRuDVAYh1JzK2VWq+csCaVU=;
 b=Jo1a/x2ImqBmyDf4XTLvQhfSL4U7dt4sKVMtkbm9/gQWKsKNRIdCPFECVCPxahwYpVx9y1dG
 qMX/TkhxS5KlsO9mjDKhdeiE9tfJEiNEXYLiv+Eu3Uq6benQl/I8Jx2AWchMSKE+4ZKzaLKm
 NMPl4TGHj3p43T6K0UM2XdmQWjQ=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6039087775e4458f08605dbe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 14:40:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6D6FEC433ED; Fri, 26 Feb 2021 14:40:55 +0000 (UTC)
Received: from Pillair (unknown [103.149.159.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: pillair)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 159B7C433C6;
 Fri, 26 Feb 2021 14:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 159B7C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=pillair@codeaurora.org
From: "Rakesh Pillai" <pillair@codeaurora.org>
To: "'Kalle Valo'" <kvalo@codeaurora.org>
References: <1593197633-9014-1-git-send-email-pillair@codeaurora.org>
 <87k0tbngz6.fsf@codeaurora.org> 
In-Reply-To: 
Subject: RE: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
Date: Fri, 26 Feb 2021 20:10:48 +0530
Message-ID: <002901d70c4d$6282e6c0$2788b440$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHK1UA7L8ou4VjNidoeHu16b5pDlgHqoQMdAewVlEiqZDo1MA==
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_094111_541785_0EFF40B6 
X-CRM114-Status: GOOD (  17.96  )
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
 ath10k@lists.infradead.org, 'Youghandhar Chintala' <youghand@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Rakesh Pillai <pillair@codeaurora.org>
> Sent: Friday, January 15, 2021 6:56 PM
> To: 'Kalle Valo' <kvalo@codeaurora.org>
> Cc: 'ath10k@lists.infradead.org' <ath10k@lists.infradead.org>; 'linux-
> wireless@vger.kernel.org' <linux-wireless@vger.kernel.org>; 'linux-
> kernel@vger.kernel.org' <linux-kernel@vger.kernel.org>
> Subject: RE: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
> 
> 
> > -----Original Message-----
> > From: Kalle Valo <kvalo@codeaurora.org>
> > Sent: Tuesday, December 22, 2020 12:07 AM
> > To: Rakesh Pillai <pillair@codeaurora.org>
> > Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
> >
> > Rakesh Pillai <pillair@codeaurora.org> writes:
> >
> > > This patch series includes some fixes when the device
> > > is in recovery mode, i.e. when the firmware goes down.
> > >
> > > - Pausing TX queues when FW goes down
> > > - Removed unwanted/extra error logging in pkt TX path
> > > - Skipping wait for FW response for delete cmds
> > > - Handling the -ESHUTDOWN error code in case of SSR.
> > >
> > > Rakesh Pillai (2):
> > >   ath10k: Pause the tx queues when firmware is down
> > >   ath10k: Skip wait for delete response if firmware is down
> >
> > This has been tested only on WCN3990. How do I know that this doesn't
> > break other hardware families?
> 
> " ath10k: Pause the tx queues when firmware is down"
> This is done only for SNOC (wcn3990) target and does not affect other
> targets.
> 
> " ath10k: Skip wait for delete response if firmware is down"
> The skip for wmi responses is done based on the flag
> "ATH10K_FLAG_CRASH_FLUSH", which is generic for all targets.
> Since if the FW is down, there wont be any response from the FW for any
> target.
> 

Hi Kalle,
I see that these patches are in "deferred" state. Is there any info/change
needed in this patch ?

Thanks,
Rakesh Pillai.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
