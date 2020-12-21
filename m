Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7046BC433DB
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 22:22:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F366D22B3F
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 22:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F366D22B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V8dIQJVJSe/nxY+cVlALqcYu4zkyQXSeRzc4ufJ6OHQ=; b=2ITtwvkwsHY+PvabnVkPwwK1q
	EtG69u+xt9pKrSd6MSSMfSkxyIRr88z2A+eFUZp6psjdwogCnMOUJtl95ZZ8TzG4f/gnbdeG/q3uA
	DmORGdXJEjb9mm3cLHh9MJYwNCrS2MA01VNziAX5+NRTyLGpuZYVqYteZTnrEY6u4lU018RVEmonT
	wI+woNFiVRIMw/rhtL6ZXC1lq9Us+Yt2QmBgQqt/uGyyiN9Sx1GVX4VjE17Byzt0kke7diR/tfhgM
	hLt2VJW+V7NHz3LzkRHRbRK7LEY12warSo90nLAeIdXcHcTnOBt2uYJ13Oh2ivdt8jKEp2Z1SrzRX
	CmIIkHeiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krTYp-0007uE-7p; Mon, 21 Dec 2020 22:21:47 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krTYl-0007ta-UP
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 22:21:45 +0000
Received: from [192.168.254.6] (unknown [50.46.158.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 2539113C2B0;
 Mon, 21 Dec 2020 14:21:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 2539113C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1608589302;
 bh=u1kcYItexzSqhZ/LdK+cgKFiRExwyVnWjAL3XOvHJuA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EOXB7iDHKaoeaTVuZOuPrO5CYcPhkz6qwxS8sU5bwEb5tCaLbQCQZPDI4PYAEw6GD
 aPbOarnxWa2oM0+upV4JA8qNF4wkZfwT/BF4gJbTzcMT7d43MleUeTDxFPwTTpxEMM
 E2WjNVO+yMAO5FTQVa8+41GSAMYIb6tHD1XU8g0U=
Subject: Re: [PATCH v2] ath10k: Per-chain rssi should sum the secondary
 channels
To: Kalle Valo <kvalo@codeaurora.org>
References: <20191217183343.25585-1-greearb@candelatech.com>
 <20201221183044.9016DC433C6@smtp.codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <ff0dde53-8483-88c9-3b7a-65e905bca632@candelatech.com>
Date: Mon, 21 Dec 2020 14:21:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201221183044.9016DC433C6@smtp.codeaurora.org>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_172144_170438_4ECB2716 
X-CRM114-Status: GOOD (  15.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 12/21/20 10:30 AM, Kalle Valo wrote:
> greearb@candelatech.com wrote:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> This makes per-chain RSSI be more consistent between HT20, HT40, HT80.
>> Instead of doing precise log math for adding dbm, I did a rough estimate,
>> it seems to work good enough.
>>
>> Tested on ath10k-ct 9984 firmware.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> Commented out code etc so I assume this is an RFC. Has anyone tested
> this with upstream firmware?

I probably tweaked this patch since sending.  my wave-1 didn't work with this approach,
and in the end, to get a valid RSSI, I ended up reading the
per-chain noise-floor periodically and storing that so I could use proper noise-floor
instead of just -95.  I am not sure upstream firmware can support that, so probably
not worth adding just the sum logic unless someone can figure out how to get the noise
floor out of the firmware...

Thanks,
Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
