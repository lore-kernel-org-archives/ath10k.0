Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B14AC433DB
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 21:16:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF0564DCF
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 21:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF0564DCF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SvVVG5dQT69gpBr+XnLxh2KklJ2GJ2KRPezEh5fwOfQ=; b=N0agdDtPstjgDNwbdThYXWxpQ
	7vcD7q8hUSkg3RLDi3JH5TjrjO8W4/PE/EzGm/KjNBx791Z8I5nvtBepWdwVhMoI2ci/zNklMg6Pg
	WuMqLHymn1TGmNZ7beExEPDGX3itc1TArgZhyQp4qPrBWQcxWYaBC0j9hMYLAG0t+LUUHKUvxsVwy
	QVrJvL/W8hvK2aqinIUQrBI3sTfRN7YMbG3m6DiHgrUJDmdY45MLowyGci5nSBsPVr5wZywffRqvt
	QCNLrZShpkTAGT21D8FJO252YnIJGDidtTMNb1akfxUK4iVLD1Uhu2F3JHWchrcwW5JvTvPWM0cjr
	mKXaMhicw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFkTC-0008ME-Au; Fri, 26 Feb 2021 21:16:18 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFkT9-0008LE-KA
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 21:16:16 +0000
Received: by mail-io1-xd29.google.com with SMTP id e2so7822759iog.0
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 13:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aEkqz2u+mz0t/VSEBaPY0HHIl5fJzCg4LIHOIOyh/9w=;
 b=XkvlS/0/K8mzVYjc2SkwA1orhL7/IIKO+AlU1wIH6Yw7SKfNfEllTE0zHUERYgRN1k
 alNACxacCD+FKU0qObNNT7n59QnH5+Nx0ATyOZeMJ3PkOqD2hSLHgr8UnENQgyenn06d
 eG8mFZceeK++R9zJ1tRuh4KGxdyJyJZMKp1hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aEkqz2u+mz0t/VSEBaPY0HHIl5fJzCg4LIHOIOyh/9w=;
 b=U2y6tN/fZ/cwmt5Mk/xIYluSp/b6V0fXwIi97n577iEcNjtcaHVmyAtwzO+hU6BG4Y
 bTfVzZwCQvYbMpLWiVicy9Wf/9GaOQJCEvmXjr0aN+0his37zvDg8wFiGjIDD4V8qvaq
 OQ6qBWzDy449a4JioWNi9e8Gwr6yIeZfx3VWQjuXNJX32TU8avQFNz0iFS051Yea18OL
 T93xX8l/ZDFcU3S3HzVF32zyeF9HWkUabWbuCAF3nnbUV4KGKIQ4uPtt9DUXA8WTXTW3
 s7q3uN5xlhJIFz2xXi+sULqxNDQpUYZHxrKY2AHfMdBKFScoOwO7awzum8/Nnlm9X5up
 XYmw==
X-Gm-Message-State: AOAM532Riq6ctqI/vHoPBExWdUYDQXxxXzayXQO3cYGG6otZq+ROaM7T
 BYu55S0+wssOCWQhaFZGA5y1tw==
X-Google-Smtp-Source: ABdhPJya4CVD+12xGI84DX9yRpBbPixLWbm2kpiFEPOxywzbJ0rPRLUtdkh2MXAsoQVrNpOXNqNePg==
X-Received: by 2002:a05:6602:1799:: with SMTP id
 y25mr4200492iox.55.1614374173505; 
 Fri, 26 Feb 2021 13:16:13 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id v8sm5223997ilg.21.2021.02.26.13.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 13:16:13 -0800 (PST)
Subject: Re: [PATCH v2 1/3] lockdep: add lockdep_assert_not_held()
To: Peter Zijlstra <peterz@infradead.org>
References: <cover.1614355914.git.skhan@linuxfoundation.org>
 <a40d18bba5a52662ac8fc556e1fce3752ea08472.1614355914.git.skhan@linuxfoundation.org>
 <YDli+H48Ft3F6k9/@hirez.programming.kicks-ass.net>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0ee409b7-b0d5-43c2-c247-b0482c392dea@linuxfoundation.org>
Date: Fri, 26 Feb 2021 14:16:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDli+H48Ft3F6k9/@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_161615_792637_D50C18B7 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, mingo@redhat.com,
 Shuah Khan <skhan@linuxfoundation.org>, kuba@kernel.org, will@kernel.org,
 davem@davemloft.net, kvalo@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/26/21 2:07 PM, Peter Zijlstra wrote:
> On Fri, Feb 26, 2021 at 10:52:13AM -0700, Shuah Khan wrote:
>> +		/* avoid false negative lockdep_assert_not_held()
>> +		 * and lockdep_assert_held()
>> +		 */
> 
> That's a coding style fail.
> 

Checkpatch didn't complain. What's your preference? Does the
following work for you?

/*
  * avoid false negative lockdep_assert_not_held()
  * and lockdep_assert_held()
  */

thanks,
-- Shuah

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
