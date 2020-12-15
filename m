Return-Path: <SRS0=cltn=FT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1290C4361B
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 18:23:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E72C2255F
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 18:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E72C2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rj4Lz/4Y9ah/k/wxDQiup8ENGyzzhOn0IBlv8iJnTjE=; b=z3qTBCk4NW/YTryZICXWmAcAF
	UY3pg7jCQu54LhDbkTeGIzxr+RQPv9/rimflc1VERg09gMJxdJP8YkPXyHxYnkjAwlAfjEu/4hI1R
	gAaf21qBil6ISZvck1GAycqP8mXKGvwe84oHPov8ZYJlU0NFjZL0riZovroGN/+0mqnGx4Q9vDd11
	IMUcsRV3Rgd15oBW+ST7ukifONLeQGk9+26666JDbGc4WeBND3E0rDW4SIadbF4GdX5xuwx08Bla0
	a0b0pMtbQ8/1U3ECvNHarnuNFk3liezqd4NtdUR1Xrh6dFAjw5enyR7/87usIupkQ5mRNJI1HCqYs
	Sug2tev8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpEz6-0004yw-PP; Tue, 15 Dec 2020 18:23:40 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpEz4-0004xj-8A
 for ath10k@lists.infradead.org; Tue, 15 Dec 2020 18:23:39 +0000
Received: from [192.168.254.6] (unknown [50.46.158.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id E2A4A13C2B0;
 Tue, 15 Dec 2020 10:23:33 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com E2A4A13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1608056615;
 bh=Rz9XVqzoDiWY4qxrJfScJDMVgdjjFU7rO5iNL7mHVFE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OxBC8b8E2ZapsnoHI686TBDWUQyyippu8dpvVVT38aCwUDQctQerrE9M8k8SvwOk/
 0BOz0fkSABRn9x3dYL+Udq8pzMdeJPOQrJTlJN4Xxn7EagWl3KGXMDhjENo36zxXeY
 D8pI+00hF8hwAbJ5Vv1QjNLIHxLfst5LDyocMOXY=
Subject: Re: [PATCH 0/3] mac80211: Trigger disconnect for STA during recovery
To: Youghandhar Chintala <youghand@codeaurora.org>,
 johannes@sipsolutions.net, ath10k@lists.infradead.org
References: <20201215172113.5038-1-youghand@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <18dfa52b-5edd-f737-49c9-f532c1c10ba2@candelatech.com>
Date: Tue, 15 Dec 2020 10:23:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201215172113.5038-1-youghand@codeaurora.org>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_132338_439933_61AAF104 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: kuabhs@chromium.org, netdev@vger.kernel.org, briannorris@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, pillair@codeaurora.org, kuba@kernel.org,
 davem@davemloft.net, kvalo@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 12/15/20 9:21 AM, Youghandhar Chintala wrote:
> From: Rakesh Pillai <pillair@codeaurora.org>
> 
> Currently in case of target hardware restart ,we just reconfig and
> re-enable the security keys and enable the network queues to start
> data traffic back from where it was interrupted.

Are there any known mac80211 radios/drivers that *can* support seamless restarts?

If not, then just could always enable this feature in mac80211?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
