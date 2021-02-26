Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FADC433DB
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 18:17:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F231C64F17
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 18:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F231C64F17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dw+PJmiBTJTYdi0QCLa7cxBibrqgLLj8bBpEke84j/w=; b=riyhBxfbWZYavp485sxqsN0bz
	Z+M8rj+fSjl1YRGvZBgF0B3S6dePaNZJelKKzd6Fw4lqtpy+KIhz7DgnY7r9zcrqC119CbgNadN6W
	Xa0MtrEOd3dkk66jqK6eNs1DQK5yLX2B9ILIluQcxN/C0943VhfZDIV5P4VuZq0+ZHNiB2mSUSBSt
	g6G6mT6AhG9g7Z96XiLTk+vLAW8JrynQnFYGjXi29q/qGhqkbVN//FtvWUafeq6qbDMiFrBmYnu6G
	s5bCJD6ipWMmEZ16/9RVjFCgQKTiHCWTUGPGIqwWHREPFVhyqaRcnCTLG3Nho5eIzllF7Wcz7y0AA
	t1gyzJ8ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhfS-0002vL-6D; Fri, 26 Feb 2021 18:16:46 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhfP-0002ub-TE
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 18:16:44 +0000
Received: by mail-io1-xd30.google.com with SMTP id g27so9208047iox.2
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 10:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=++70fAlAOH2s61QgMcTjkJmnOFcHIUa2TWnJxzUPnsQ=;
 b=U/cgqgeFEP7+jbZav60kIxVxhmp/WjepC70KAl79RUsnNypDQ7vIB9AKjaFuD1XImn
 +EsEWWlsekQYuYCc2I2X63/p8j7L9nOWK3h3XpoYp8m2cpLkVNlggFKqWZmCe0zHFiyt
 smEFFEssVXqte3MwHGZ/XtnMxduVXf8l/guIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=++70fAlAOH2s61QgMcTjkJmnOFcHIUa2TWnJxzUPnsQ=;
 b=Jpz2c84SMJSJlAgQ0qJcnp0dTDMeE/X7QHTyFDVH5FgZ2TRya5yVBZetikiuZWNHm+
 evBP4ZxSpQWUKXJOdM+gKoSG7E4U4CuJngHOej7xmx46hmnD/QfzXkWxtI3/yPzAcIQ7
 tBzxznOJSK16zX9y6l7AtSvX+8oW09m/P7eRva0Wx46G21mej9UK1jJiMk+wQDhxCA1l
 nqF/9C+R/PwTPYC0PP0IrYzZYDzfqj7PFHyL73G95s3Clv6Tl3Q3bB93gQFC7uPo8dRl
 KalB8x8fA6vBVGKJO+nG1YsXbjy1FXC9bwW0jBlxMB+rpIExWY6zEtgtUxTy0B6LxrjN
 G6Bw==
X-Gm-Message-State: AOAM531bNsS17mo2b3yoBRB3x/yTP98VBX1Em4JuHqYAJkh5FBNddy9j
 XbYvu4W3OddmUf8Le1sNeB6FibHVmB6mAQ==
X-Google-Smtp-Source: ABdhPJwpHZPEqcg0TRe5ho36fp9HDmq8putkCfuc32ip2fHjH1r7zpddswLZ6FdnDWpXc758aSMEqA==
X-Received: by 2002:a05:6638:e93:: with SMTP id
 p19mr4134186jas.10.1614363402047; 
 Fri, 26 Feb 2021 10:16:42 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id m11sm2318054iop.11.2021.02.26.10.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 10:16:41 -0800 (PST)
Subject: Re: [PATCH v2 2/3] lockdep: add lockdep lock state defines
To: Johannes Berg <johannes@sipsolutions.net>, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, kvalo@codeaurora.org,
 davem@davemloft.net, kuba@kernel.org
References: <cover.1614355914.git.skhan@linuxfoundation.org>
 <af1511df953fe49f95953cbc23d86fb7cdaff58d.1614355914.git.skhan@linuxfoundation.org>
 <4a997ea7b6625428c21dc3e423e96ee54d6785e2.camel@sipsolutions.net>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <bb815b1d-5377-95a1-9610-827a30cb8525@linuxfoundation.org>
Date: Fri, 26 Feb 2021 11:16:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4a997ea7b6625428c21dc3e423e96ee54d6785e2.camel@sipsolutions.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_131644_014517_AA650636 
X-CRM114-Status: GOOD (  10.83  )
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
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/26/21 11:03 AM, Johannes Berg wrote:
> 
>> @@ -5475,7 +5476,7 @@ noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
>>   		/* avoid false negative lockdep_assert_not_held()
>>   		 * and lockdep_assert_held()
>>   		 */
>> -		return -1;
>> +		return LOCK_STATE_UNKNOWN;
> 
> I'd argue that then the other two return places here should also be
> changed.
> 

Makes sense.

Since lock_is_held_type() simply returns what  __lock_is_held() for the
other cases, __lock_is_held() is the one that needs changes to use these 
defines.

thanks,
-- Shuah





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
