Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0590EC433E6
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:24:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3D864DEE
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C3D864DEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t7uNN0X+x32KwmRNEQ83A5u5aYaNGVyeqFuM1QPsJvU=; b=qUTGpuEZFOFJoxKzskcQXHzva
	X11wXNGiGw0qRmL5fqFKHlzsHGufbvrlKDFHzJZXq6BVgObQe2GoDjEiimgYMcLURZ7f0IGFhA0N1
	FaDM/NYDRbt0O+QuyzSxxV3s2PEGOD+DWmEKboKeEg4aMViqnfWZKBc7upLgQpsatI/tV1KwbG1p9
	QHr2GYlOKouALKF9KwsyKXR1BZhAWr6lOOZDpEX+AjGJauQRjiWTZA1Wr4fE7kzAAM731+COT6K3a
	uApJZvD2PVgajv3B+eV+eDILny/MpVt/I4YPLPy8ZLRszxGdPLEkegMG1DbaD1yEUJYR1xgJDCTah
	OMqrc1/uQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9fB9-0002Ui-59; Wed, 10 Feb 2021 02:24:31 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9fB3-0002Tp-TB
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 02:24:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612923867; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MMitM/P4fuEQUAofCsu/bu93d22qS0ZPd+4W8m85C1g=;
 b=Hjfj+cPp06sIJLmd88lyC1PuZjHB7VRVPHyX1jc5AaQmOAy3+PhKw0dSieO/a4VPxHpWBNUe
 AzwL4lUOy+a1O6LNGD5PKzzPkRLi10w1scPkoYvG4ncVErPE92tOhLfnC3Ox8W76JtyMFhJ4
 PdJXDlllQUDM82IvePIBPC+wvW0=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 602343cf830f898bac63a67c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 02:24:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0151CC43467; Wed, 10 Feb 2021 02:24:15 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 60A15C43464;
 Wed, 10 Feb 2021 02:24:14 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 10 Feb 2021 10:24:14 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: change len of trace_ath10k_log_dbg_dump for large
 buffer size
In-Reply-To: <CA+ASDXNYO+w254D2Uh3OSfTGjJEkbOCX=hq+XaWe9DtjbuOy3g@mail.gmail.com>
References: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
 <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
 <19b6ad684a01718c3823f882581fca36@codeaurora.org>
 <CA+ASDXNYO+w254D2Uh3OSfTGjJEkbOCX=hq+XaWe9DtjbuOy3g@mail.gmail.com>
Message-ID: <79f57b7531b862648afdfc5531b2effd@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_212427_799060_AD414A8A 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, ath10k <ath10k@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2021-02-10 10:14, Brian Norris wrote:
> On Tue, Feb 9, 2021 at 6:12 PM Wen Gong <wgong@codeaurora.org> wrote:
>> On 2021-02-10 03:35, Brian Norris wrote:
>> so this patch is to dump the top 1024 bytes only,
>> its 1st goal is make log smaller.
> 
> Agreed. I wasn't objecting to this patch. I just wanted to highlight
> the second part should probably also be considered as not exclusively
> an ath10k bug:
> 
>> its 2nd effect is fix the crash issue,
> 
> but I guess if you're not testing the latest upstream, it's a little
> hard to tell for sure whether the crash still exist at all anyway...
> 
Yes.
It is hard for me to test with the latest upstream, because the kernel 
is v4.19 for my SDIO chip.
I do not have the environment with latest kernel.:).
If someone use the other environment(not V4.19+SDIO) which is the latest 
kernel,
and if it not crash, it can not conclude it also will not crash on my 
v4.19 for SDIO chip without this patch.:)
It will not crash with this patch on my v4.19 for SDIO, this have been 
verified my me.
If someone want to check the same crash with latest kernel, he/she can 
generate a simulate test and analyze with latest kernel.:)
> Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
