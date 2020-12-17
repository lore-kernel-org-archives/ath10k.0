Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACC3C4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 22:58:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6241823A51
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 22:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6241823A51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WEFzche8BIHHxyprL+F65VrphYGC5JjC64fdysJvr/0=; b=iTlu4o38OtoaKrgllpzMJZmK8
	VcJUcCJ0hTu6IPtoQ5t3xooffUH7+da5Pw2TVol4ePPxb+SdtHq6Ubo34HmOZts5ij+8NAeOmBwqz
	y1grlfTzF0iLqr2y0wFlBoVhvia5o+1cMpf/GPJkywc41VRviEiLmHiX6KYEcxvNorjxB55vKzrEY
	PNu/HzHsiM72IFcD9fJfH3EU6fAgI0n4YPOT3belx6UPnAd6e8x2R19ef/MxXtNyIgiUpncT4OGvg
	4Bn0FWIgna1pz6zzdjzgOlRWy7AJljsOdJ/svG6M4ZhaYTa+rc3SNzs83CJmPesDb/ddM49ONqJha
	PnNqYyQng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq2DB-0004iq-Hz; Thu, 17 Dec 2020 22:57:29 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq2D9-0004iP-0o
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 22:57:28 +0000
Received: from [192.168.254.6] (unknown [50.46.158.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id AE28313C2B0;
 Thu, 17 Dec 2020 14:57:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com AE28313C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1608245845;
 bh=wKglh9KlDBoYb5sTHp2Zpmla8eV1kaQDIWTUPzEfRyo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cS/WEcr87wlLHpBF0id46WWTxCo51XmGYj77Tvo56pnMTrdwLdNB1MtH4HaHyOAjN
 k+8SxCI7rDeTEcSIPDsVOXRHUWtq7yCy9xsWK0ZvwduUSkfRkXuifou+H8Ku+zn8yO
 vDCDCIgoHcJwGiTSQV/1oN9T5wv6BwL5dbn9uSl4=
Subject: Re: [PATCH 0/3] mac80211: Trigger disconnect for STA during recovery
To: Brian Norris <briannorris@chromium.org>
References: <20201215172113.5038-1-youghand@codeaurora.org>
 <18dfa52b-5edd-f737-49c9-f532c1c10ba2@candelatech.com>
 <X9vaqxub2F/8YPT8@google.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <6cec8a4c-620f-093d-2739-7eafe89cd79a@candelatech.com>
Date: Thu, 17 Dec 2020 14:57:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <X9vaqxub2F/8YPT8@google.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_175727_158295_BDF4EB18 
X-CRM114-Status: GOOD (  19.07  )
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
Cc: kuabhs@chromium.org, Youghandhar Chintala <youghand@codeaurora.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 dianders@chromium.org, pillair@codeaurora.org, kuba@kernel.org,
 johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 12/17/20 2:24 PM, Brian Norris wrote:
> On Tue, Dec 15, 2020 at 10:23:33AM -0800, Ben Greear wrote:
>> On 12/15/20 9:21 AM, Youghandhar Chintala wrote:
>>> From: Rakesh Pillai <pillair@codeaurora.org>
>>>
>>> Currently in case of target hardware restart ,we just reconfig and
>>> re-enable the security keys and enable the network queues to start
>>> data traffic back from where it was interrupted.
>>
>> Are there any known mac80211 radios/drivers that *can* support seamless restarts?
>>
>> If not, then just could always enable this feature in mac80211?
> 
> I'm quite sure that iwlwifi intentionally supports a seamless restart.
>  From my experience with dealing with user reports, I don't recall any
> issues where restart didn't function as expected, unless there was some
> deeper underlying failure (e.g., hardware/power failure; driver bugs /
> lockups).
> 
> I don't have very good stats for ath10k/QCA6174, but it survives
> our testing OK and I again don't recall any user-reported complaints in
> this area. I'd say this is a weaker example though, as I don't have as
> clear of data. (By contrast, ath10k/WCN399x, which Rakesh, et al, are
> patching here, does not pass our tests at all, and clearly fails to
> recover from "seamless" restarts, as noted in patch 3.)
> 
> I'd also note that we don't operate in AP mode -- only STA -- and IIRC
> Ben, you've complained about AP mode in the past.

I complain about all sorts of things, but I'm usually running
station mode :)

Do you actually see iwlwifi stations stay associated through
firmware crashes?

Anyway, happy to hear some have seamless recovery, and in that case,
I have no objections to the patch.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
