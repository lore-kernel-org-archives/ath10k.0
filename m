Return-Path: <SRS0=wW+L=GX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D832C433DB
	for <ath10k@archiver.kernel.org>; Wed, 20 Jan 2021 01:34:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B81F32222F
	for <ath10k@archiver.kernel.org>; Wed, 20 Jan 2021 01:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B81F32222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1GEP0Bg3bHHM6EUsQU36003rz2RTzdfqCwq2WxjopT0=; b=Ypsf+ipjClk8sXCeuGhbpQ+wK
	70udJmsJ8bmPecPlooFxPbt+uCXjAEMp2bRIHYfIptZFTFqKZHGwr+9LbDJJvyk7sVQ0fEf/6pcj2
	hQcU7nCsO6Ioi6+1lJSX28jLcuQtySFIMmRa2GZVjNesoUWRhTyjHWAJ0SlfyAJ1UrCgoCGjSNW3M
	qs2/MKKMRNGLfxxBMha6YdG4+dI0b9/oVMcHqm9hXiPjHlRfuFAlXX+aFBJnsZs9KHzcA31QqTKOK
	UGjTbaAw/4rVj7wId73fO7G7L6zvKHe/R6r6SFvIiLnO8qYzEW7Fyzz4t2lhSLIkslHCofuvN4h8O
	f3oefXi4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22Np-0007EO-Is; Wed, 20 Jan 2021 01:34:05 +0000
Received: from a1.mail.mailgun.net ([198.61.254.60])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22Nk-0007BJ-AS
 for ath10k@lists.infradead.org; Wed, 20 Jan 2021 01:34:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611106438; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=42dKRppIOyrdZZlZCu6ORjPRXglZK5b6ce6DTvCMMn8=;
 b=JP3AW6VNJQh648PQ9JlJE2zHdZlD8RqQzoAKlI1xzbz/TPKAUI6oRBNcbmfip/nOuyTXy4Vv
 MG19CiOOP4cLdAfADnRxL2MkyTTbcT7FPkRmJ03xdkY2V1N2jtPlIbSX4j1FLgBzIE88mtIy
 9QpFaNr/r7vhGuSWjvOfSUE3Ejs=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 600788853b6dceb1324f4805 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Jan 2021 01:33:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2465DC433C6; Wed, 20 Jan 2021 01:33:57 +0000 (UTC)
Received: from miaoqing1 (unknown [183.195.1.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: miaoqing)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B7D89C433ED;
 Wed, 20 Jan 2021 01:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7D89C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=miaoqing@codeaurora.org
From: <miaoqing@codeaurora.org>
To: "'Kalle Valo'" <kvalo@codeaurora.org>
References: <1608515579-1066-1-git-send-email-miaoqing@codeaurora.org>
 <20210118161650.4B9BAC43461@smtp.codeaurora.org>
In-Reply-To: <20210118161650.4B9BAC43461@smtp.codeaurora.org>
Subject: RE: [PATCH] ath10k: fix wmi mgmt tx queue full due to race condition
Date: Wed, 20 Jan 2021 09:33:51 +0800
Message-ID: <00b001d6eecc$51284120$f378c360$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHx/gcHY99Iai/GqEFrts5lbNgOgAI8Q3ECqee6IgA=
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_203400_404868_C68BDB9E 
X-CRM114-Status: UNSURE (   6.16  )
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

> Please address Brian's comments and send v2.
> 
> Patch set to Changes Requested.

Updated.
https://patchwork.kernel.org/project/linux-wireless/patch/1608618887-8857-1-git-send-email-miaoqing@codeaurora.org/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
