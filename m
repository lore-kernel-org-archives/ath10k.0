Return-Path: <SRS0=F+kR=HJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5970BC433DB
	for <ath10k@archiver.kernel.org>; Sun,  7 Feb 2021 17:43:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D991264DFF
	for <ath10k@archiver.kernel.org>; Sun,  7 Feb 2021 17:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D991264DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aFGpyb19VmiG4QB/6DLqQXXie1ITY9zMpZIDck3IDWU=; b=ds7iGO4lCGHxOwWaUoRyfweoo
	F76/yY1ZNZ1rb2tghg4/EGXtPbHYG4LXv8QoFRkv/06H/0K+EYXeZnEgzK+QhzGcqQD2VPFpClN1j
	+6eS8rQXWz0hLJg2eTMvPKYGQDVgejn9V/EaCACnqXR0qPepJmwj0hUYXNNnms6LjSZMSF19cE4zX
	I2A8fzFpQmJnjdgtxUke5jHHSkhxVszGjTYoZajWV13NEXLYWRu2XruJJgYnnzaXM42DkZMwEjb92
	ewv1cnZyqjbhSHNEMLk8qwwRrQhXG9sMdmjZ9c8Dhq+zKvPFxkxU7ilaE3Bs+nIMWvG/QVOJJ3oJO
	4t9JiPfyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8o58-0003Ot-95; Sun, 07 Feb 2021 17:42:46 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8o56-0003OU-2c
 for ath10k@lists.infradead.org; Sun, 07 Feb 2021 17:42:44 +0000
Received: from [192.168.254.6] (unknown [50.34.172.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id D6BE713C2B0;
 Sun,  7 Feb 2021 09:42:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com D6BE713C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1612719763;
 bh=VDia/FP7SwB3TPSTEwW3Q3pQTKpuKz5FWCR7eDaakX8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C3xrTu3KOtvtcdIlFcNNmD8ZjI1DvZSmqUz/jnibVKIjLdE6rIi76ivVoPqMFh1RF
 PK/REyB8NFKQ1RGg92Kg5ed9XFKXV8vfzRFp8olXmp0hdVI5qLiaRSAIHVJA7dH8Ty
 I/yQ2/pOF1PrRJNsFUNWa6QFuY20COqCe/xcw/wk=
Subject: Re: EAP AP/VLAN: multicast not send to client
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org
References: <268706864.fOQeQAt3TZ@ripper> <3442403.JAWNrhsyWg@ripper>
 <1d04209b-f7dd-41e8-b290-cc82ec43186a@candelatech.com>
 <2516016.JH6pyVjoBS@sven-edge>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <fe6fa272-30ac-9588-d2a2-c89647beefbb@candelatech.com>
Date: Sun, 7 Feb 2021 09:42:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2516016.JH6pyVjoBS@sven-edge>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_124244_262794_61FC2472 
X-CRM114-Status: GOOD (  18.53  )
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
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/7/21 9:13 AM, Sven Eckelmann wrote:
> On Sunday, 7 February 2021 17:50:11 CET Ben Greear wrote:
>> Here are the images:
>>
>> http://www.candelatech.com/downloads/ath10k-4019-10-4b/bisect/
> 
> Thanks, will try to have look at them tomorrow evening. Can you confirm which
> QCA ath10k version was used as the base for this one? I've read somewhere on
> your page 10.4.3.3-25 - which doesn't seem to be in Kalles' repository. And my
> original plan was to test the relevant QCA firmware first and check if the
> problem might already be in the base version which you've used for your
> builds. But maybe I will just start with the oldest one in you tree and check
> if the problem is also there and based on the result decide how to continue.

I don't know exactly how qca versioning works, but my notes are that the initial
upstream wave-2 code was 3.5.3-00050, from back in 2018.

The first commit in the series should be very similar to stock FW, though perhaps
missing some feature flags.  Maybe try forcing the driver to try to allow
vlans...if it is missing feature flag only, that might work around it.

Somewhere along the way I fixed up raw transmit in my firmware, so possibly
only then will vlans really have a chance of working.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
