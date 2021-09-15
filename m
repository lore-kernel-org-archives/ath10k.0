Return-Path: <SRS0=MUiD=OF=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA975C433F5
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 19:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACFEF6103C
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 19:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACFEF6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P54AKu+Z/qi9HQkxSoLBd0/udtKhh2zb5qmAUKQ0BE=; b=tAJEYNowSsxXCtNyteOTNXd0ZZ
	VkPPoCqKvcGJusluFGLWDlub2h8551qo0pwJL7PMcGC0q5T9VwPVCAO0o11TXy2WKwCGaIQ2PwS7a
	LABMV0/4zCs7CB/PC3mMuTT7zBAzeh6076gnB3dShscTkf/7e1YVJPN76DlIAhSmO2Oj+O44fvJN5
	D1/67l1IT+H5vV2qLVKJVbKAx5iamnxGSd06NI0QXoyWVRux576yds3ycSDvouzc8v4AJBNtCYs3N
	dnx33j7M7T+6VogbzZlJ45L2yGW0W26NueXBrjjuOlOpCeXP+7sBXM7V1FFa7tHUmAFm4IPN2gKTM
	NvWRe+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQaDG-009l8b-3Q; Wed, 15 Sep 2021 19:04:54 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQaD8-009l6j-LN
 for ath10k@lists.infradead.org; Wed, 15 Sep 2021 19:04:47 +0000
Received: by mail-oi1-x229.google.com with SMTP id 6so5550250oiy.8
 for <ath10k@lists.infradead.org>; Wed, 15 Sep 2021 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JKkOwZuvZKIeu7efGajXGlD+snfoAf+v8fNQmncZFXc=;
 b=tGoVyX94TJeanqGxi3PM2Ukp5wS61jqLDIb1gp8otWP1mAL946xYOaBqOI1XeTiRAd
 MEtgFRLb3wcu1RCn3nr9xcNZno3V6fMo2gCTOGpOtwXJyWvCG15s9lSdw8ofPMkqW9cp
 3r4gHO9nsLU+8+Y6kmjfSI55ydwTfKn8EcRM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JKkOwZuvZKIeu7efGajXGlD+snfoAf+v8fNQmncZFXc=;
 b=LQgcXE+5nwfKpO43bOL9irMnGZBjFYMBlnfN+0mUIY06YgC1W0l4F8sQIDsc3GjYUW
 qrsCO4VwZxXmFCKeB2BEAowExDFzFK3B01uLnPeDVjLDDL43d0ahY8BOVMjPhoZ4/h32
 kH50+ssovArvXxiQrBeUFsQbirH9LKo665hFZ4Mqs/m/Gr4HtqhlHm6JiIHN7/FXsKes
 scHCU/LT9Z/hl4UJJD7oJPwNuh4cYOWtC5cOvkNFNycRvmNG6hhttBHqTQ8+kSuqLBxy
 hEDzlMnCokBTlCyiZ7e8mCpt1sdFZwojphVPsaJBBtxel8df6afDn0gw0yJ+8XsK0FBD
 ldAQ==
X-Gm-Message-State: AOAM533VunOCYCdOPLFFTi3pE7hwI9OlCyqyq/g/nfJFEKcAf+ZXX5rl
 Vk/UhQANUvSQThCQWBh7cS1Iig==
X-Google-Smtp-Source: ABdhPJzLvAnKQxliQBVfQy/2cMv0B1nlzK1X2skFE6KLpS9d/a3Yjef9kgs4SkJCsMShms3mb0mLrQ==
X-Received: by 2002:a05:6808:1787:: with SMTP id
 bg7mr6527395oib.39.1631732683773; 
 Wed, 15 Sep 2021 12:04:43 -0700 (PDT)
Received: from ?IPv6:2600:1700:38c5:675f:1e0:5e11:1b48:4db0?
 ([2600:1700:38c5:675f:1e0:5e11:1b48:4db0])
 by smtp.gmail.com with ESMTPSA id z25sm220545oic.24.2021.09.15.12.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 12:04:43 -0700 (PDT)
Subject: Re: [PATCH] ath: regdom: extend South Korea regulatory domain support
To: Peter Oh <ebmajor.dev@gmail.com>, ath10k@lists.infradead.org,
 kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, andreas.tepe@debitel.net
References: <20210915185611.6195-1-ebmajor.dev@gmail.com>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <cf9e7515-edea-61a5-269c-10613db15e19@eero.com>
Date: Wed, 15 Sep 2021 12:04:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915185611.6195-1-ebmajor.dev@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_120446_772087_F35BABA3 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


On 9/15/21 11:56 AM, Peter Oh wrote:
> South Korea manufacturer, Samsung, has extended South Korea
> regulatory domain pair with 0x5F and has used it for their
> devices such as Samsung Galaxy book. Hence add support
> 0x5F as a regulatory domain pair along with extended country
> code, 413.

I don't see a problem or conflict with extending it.


Thanks,

Peter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
