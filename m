Return-Path: <SRS0=oQud=OO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC443C433F5
	for <ath10k@archiver.kernel.org>; Fri, 24 Sep 2021 08:00:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9681B60F3A
	for <ath10k@archiver.kernel.org>; Fri, 24 Sep 2021 08:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9681B60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8whw/9Uzd/wGSr+uuOXu8TpWoIGZ0yjdkbxwXjBqRA=; b=geaZDaM+RE2c7L
	iTV++/bNqgGKBSIY6dGQQcSxhBX746exNSeWc948e1n6GgedGXpCwM5iHNGohT2d9JGdSSsHRz0tQ
	xctemVbLCt1TarUbll7X48caHxmLb2UAJ/EjGcVuXTCb4NctwFJMT/rI4fKM8wHc0j0boH5j1N8c3
	YSKs453XpOCf9pfQi5fbVsJ6BO78abIGcep3kiBUCdol0734IndKBr/pQw7/Edra13J/ob9KJXjhy
	35s6EdNm8XDKAoxex843IIHDMYj7UHj2NGAKVxboRvtxDt/ZZePprElp01tKeB8+OaZi7hgIGggzy
	4LZFmX4/QDSC8CxXCoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTg7k-00DQcM-6M; Fri, 24 Sep 2021 08:00:00 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTg7i-00DQbp-4U
 for ath10k@lists.infradead.org; Fri, 24 Sep 2021 07:59:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632470397; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=TSws/164fiyq3oktWfzcBH/e+yGW2wBhhF/5uUAH+OQ=;
 b=K/L7E0GRPtMJ7huK5rnQfOJlJuCugf6dsiyFzjmfMEO43QqXLd4NJgO1ZnNkdIPBbkCB6/zg
 82Kiva9P0HjnDomqKFmTM8GbTZIrQ1eV1I6sIenwNjDcraY5tW8ocUTNGUZAB2CP/zed0KKt
 DOUXUqQvGQakoXJ8TOtrn4wOc0o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 614d857be0f78151d683a47a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 07:59:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6818EC43460; Fri, 24 Sep 2021 07:59:55 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B3E77C4338F;
 Fri, 24 Sep 2021 07:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B3E77C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: pillair@codeaurora.org, ath10k@lists.infradead.org, govinds@codeaurora.org,
 kuabhs@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, youghand@codeaurora.org
Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as crashes
References: <002501d7af73$ae0a7620$0a1f6260$@codeaurora.org>
 <CAE-0n52DcCwcdR07fvMLrj=RJFtNthy0FdWmt1gBWiD9eLrOvQ@mail.gmail.com>
Date: Fri, 24 Sep 2021 10:59:47 +0300
In-Reply-To: <CAE-0n52DcCwcdR07fvMLrj=RJFtNthy0FdWmt1gBWiD9eLrOvQ@mail.gmail.com>
 (Stephen Boyd's message of "Wed, 22 Sep 2021 15:20:07 -0700")
Message-ID: <87bl4itnd8.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_005958_284983_F7CF18EE 
X-CRM114-Status: GOOD (  13.78  )
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

Stephen Boyd <swboyd@chromium.org> writes:

> Quoting pillair@codeaurora.org (2021-09-21 22:35:34)
>> On 9/5/21 4:04 PM, Stephen Boyd wrote:
>>
>> > +static int ath10k_snoc_modem_notify(struct notifier_block *nb, unsigned long
> [...]
>>
>> > +
>>
>> > +          return NOTIFY_OK;
>>
>> > +}
>>
>>
>>
>> Thanks for posting the patch. It would be preferable to use a different flag
>> instead of ATH10K_SNOC_FLAG_UNREGISTERING,
>>
>> since we are not unloading the ath10k driver.

Weird, I don't see pillair's email on patchwork[1] and not in the ath10k
list either. Was it sent as HTML or something?

[1] https://patchwork.kernel.org/project/linux-wireless/patch/20210905210400.1157870-1-swboyd@chromium.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
