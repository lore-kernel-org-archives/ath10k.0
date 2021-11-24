Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5850AC433F5
	for <ath10k@archiver.kernel.org>; Wed, 24 Nov 2021 08:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIOO4nMYmpI/7IiNdmmYI8KjjBhhUsFHRd12Kn1OYIk=; b=eQQCIt6pz/dBV2
	RQMAMs5I2Umb5+1dIfK+OxodkRkXvxMhRnaus/nBNlAk5/OG7g1eS6JfmdTHoSQRIgQgHxEfJOFzR
	9UgtplfgrkFNghdFTYhKAKwM27IW/2A0yseR/n7n/uZrJsKJ2+q5LEbeMuVi443nK/LZb3AP36QQR
	RotJWPKT7ApdPPpiHsCqV05SMivUK6zkbjto6meIjMQ22GlrU48g64gfB1BNqUd+n1Yfgc2Wecxbb
	vswOnPOtorSzu78VdV3RtPy5KozolDvys+mMU9g1XUgt/UQD4mNEYKKI7xgM+vZ5sdl51sBN67Dbw
	vrwYazmbjHNSEs0D0jEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpnHW-004DFB-3w; Wed, 24 Nov 2021 08:05:30 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpnHS-004DDd-Ss
 for ath10k@lists.infradead.org; Wed, 24 Nov 2021 08:05:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637741126; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=du/sjl1KFWHdjpn3FC6dINKkVGfUKDyYPcJdqoAnpoU=;
 b=p/GNL8rPbtjZvnyDHJlxAjPLHtOK0N7/mR9ihG6UIn9t5bBs9FdsPfV6RaF7/LGXTEmBuqcB
 fFMdtHxNqkGoRIHpt9IemR/A36KQbs4mONVxCjP4v7TJOzs2zZLz8Sri7N57Swp4g85NL620
 Rk4A8pKfke20efIQArIuGaO+Jyo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 619df245bebfa3d4d5a5e608 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 08:05:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D5035C43618; Wed, 24 Nov 2021 08:05:25 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 49165C4338F;
 Wed, 24 Nov 2021 08:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 49165C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>,
 <ath10k@lists.infradead.org>, linux-wireless <linux-wireless@vger.kernel.org>,
 <erik.stromdahl@gmail.com>, <alagusankar@silex-india.com>
Subject: Re: [PATCH] ath10k: Clean the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE flag
References: <20210915160422.2839595-1-festevam@denx.de>
 <CAOMZO5AYUxJg4bWudT3L1P=qNR2UBcNR1zmjCf5O9_ExyPw4ww@mail.gmail.com>
 <CAOMZO5AJ8q06YTHP=p84nJnKOYU+=MKVqJ3qz3XnUGcAg0xo=g@mail.gmail.com>
 <87ilwi6lo4.fsf@codeaurora.org>
 <5dc61605-2ada-3c0b-64de-ea16ad31efbc@quicinc.com>
Date: Wed, 24 Nov 2021 10:05:20 +0200
In-Reply-To: <5dc61605-2ada-3c0b-64de-ea16ad31efbc@quicinc.com> (Wen Gong's
 message of "Wed, 24 Nov 2021 15:55:17 +0800")
Message-ID: <87a6hu6ksf.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_000527_025122_810CFE9B 
X-CRM114-Status: GOOD (  20.69  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> On 11/24/2021 3:46 PM, Kalle Valo wrote:
>> Fabio Estevam <festevam@gmail.com> writes:
>>
>>> Hi Kalle,
>>>
>>> On Mon, Nov 15, 2021 at 3:06 PM Fabio Estevam <festevam@gmail.com> wrote:
>>>> Hi Kalle,
>>>>
>>>> On Wed, Sep 15, 2021 at 1:05 PM Fabio Estevam <festevam@denx.de> wrote:
>>>>> On an imx6dl-pico-pi board with a QCA9377 SDIO chip, the following
>>>>> errors are observed when the board works in STA mode:
>>>>>
>>>>> Simply running "ssh user@192.168.0.1" causes:
>>>>>
>>>>> [   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
>>>>> [   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
>>>>> [   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
>>>>> [   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
>>>>> [   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
>>>>> [   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12
>>>>>
>>>>> and it is not possible to connect via ssh to the other machine.
>>>>>
>>>>> One user inspected the size of frames on Wireshark and reported
>>>>> the followig:
>>>>>
>>>>> "I was able to narrow the issue down to the mtu. If I set the mtu for
>>>>> the wlan0 device to 1486 instead of 1500, the issue does not happen.
>>>>>
>>>>> The size of frames that I see on Wireshark is exactly 1500 after
>>>>> setting it to 1486."
>>>>>
>>>>> Clearing the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE avoids the problem and
>>>>> the ssh command works successfully after that.
>>>>>
>>>>> Tested with QCA9377 SDIO with firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1.
>>>>>
>>>>> Fixes: 2f918ea98606 ("ath10k: enable alt data of TX path for sdio")
>>>>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>>>> A gentle ping on this one.
>>> Any comments, please? Without this fix, we can not log via ssh to other machine.
>> I don't have much time for ath10k nowadays, so expect long delays in
>> reviews.
>>
>> I'm worried that this breaks QCA6174 SDIO support. Wen, what do you
>> think of this? Is this because of differences between firmware versions
>> or what?
>
> it is added by below commit, if disable it, will significant effect
> performance.

Thanks, I was worried it's something like this. One way to solve this
would be to add a new field to ath10k_hw_params so that the workaround
is done only on QCA9377 SDIO.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
