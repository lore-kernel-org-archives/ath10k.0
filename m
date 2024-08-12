Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18629C3DA7F
	for <ath10k@archiver.kernel.org>; Mon, 12 Aug 2024 17:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNtiuyn57wimdjlrR1mgpCvsCFleEbroM/SCyyNnp7g=; b=1gDmN0Gv8QPgcsEOFLLM/7gJ3R
	9rm+g05SfcY9T3QyvuMAVHgxtYn6ZRzeSJSul1dtlBbLpH0YGkC6YZl5c0WXoHLEw3l2u1UwIt16L
	9kcjWd6Q32QQPMWjqfWU6/gBbNmIRH6YbfLVPafE/fHz2tdDIyYCtS9vqUHt9fIlt44fgjxjJTTAD
	PqW+peE9muZOj0JnMnBeLd0jdNsgTtrqlP7HYN/TnK9UAdyGHDz2ighnncFm7B85fQhFDMeTtAa04
	vkAov4Cub2WzKgNhi3p8NST9jb6F4kubFBJOpMZ8EdI3cxQdDhYL8X/ojL7eYTBxWndTA5sZnLW2W
	yFyRJHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdYvM-000000012IT-1JtO;
	Mon, 12 Aug 2024 17:33:40 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdYvJ-000000012Hh-0dKm
	for ath10k@lists.infradead.org;
	Mon, 12 Aug 2024 17:33:39 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5bb8e62570fso5588145a12.1
        for <ath10k@lists.infradead.org>; Mon, 12 Aug 2024 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723484015; x=1724088815; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNtiuyn57wimdjlrR1mgpCvsCFleEbroM/SCyyNnp7g=;
        b=mfhn5PY9SOpvv6IqHOEA5K1HSffAFruxIlcmdNntaLF77WUXgHwvjbQ4Rv2a2dWW7i
         7ZTJm94NELoC5+6ym3UQdkWfi00Jtvt5EjLdpvzTCqf7ff0dGXfI0v9XwFubHAQQLuXV
         XW4IUaXQn0JSV0X8Q9p+N47EBCmXucjGd1Auww6170HVxuZNHRzzn9IT3BESTDfO5Ay/
         tCXWy1ubfIDde8TjFird1hhrGXbo1CXYOeNm9sJMjAJDbh/M0xzbFtkQBZY9SASy7tS6
         p7PSywlI1uU4aNxGMaEE3kCLvFu7i22ISTq5kpm4GrnDYSZ5jgnRsMHD7obRcKfyQlZv
         R2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723484015; x=1724088815;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNtiuyn57wimdjlrR1mgpCvsCFleEbroM/SCyyNnp7g=;
        b=pyZtj/qD1bI0nbNYz0FMMTujN0Fr+mRxvcGGpVWknsEVvWo8l/QsHtPBCmkFsZKQvx
         rzwQtOpESHhyCvPFbamJTnoKkxxA+BfoAvtaAVaLFlWPvw57CpvqPDUDmaasCTUQpjLF
         oUKBhFw0tlAGJzFdxRRL0zPJFopKFRwEuKfomRxGzHWSRyCFxQJ9PFqEbVQTw/ekpSxC
         OmX4fJUWuUawR29+6As//+2exGTToI/N/LnwNtZOh/SoT6ebXyiLd/F+Rivff0tE8zNL
         D2Q6NApEcMsD+9i9nXC5/IY0c5ubt2WK01my5HH/9djkGEriQTCrltBBnG0bnqZa52KX
         H7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4+JT+1kG/22OerZdZdBdD0tLTxgH5sCtabJGFlpZvGfLO4+YSUtzoj2qZYCEplEpASGvYZbiF3X5fwCE692mLp8v43MbPIkPjvw==
X-Gm-Message-State: AOJu0YydlpuzOJMAvwAFjtljq3C+y0JdIe53n++EwOfX3kr8z9KP3pTN
	XK39t2xa17oMhU52lXIwvGcPBXp18/NdzPWAhnsXGAAzDJ3JadsK
X-Google-Smtp-Source: AGHT+IH2S/uqRvhXne/3rXJ59ZEqUDgqzmDZ4OLXaH8g+ZRO+A5MCHSsmA6rMDXpD4Ct57C3lEc6cQ==
X-Received: by 2002:a17:907:6d27:b0:a7a:b385:37c5 with SMTP id a640c23a62f3a-a80ed1d4638mr76024566b.17.1723484014742;
        Mon, 12 Aug 2024 10:33:34 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb1cce87sm249887766b.101.2024.08.12.10.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 10:33:34 -0700 (PDT)
Message-ID: <9eafac85-2262-4f92-a70b-32109f65c05a@gmail.com>
Date: Mon, 12 Aug 2024 10:33:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
From: James Prestwood <prestwoj@gmail.com>
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
 <c407064a-1c2f-46ec-ac57-32bf9cf6f5c6@gmail.com>
Content-Language: en-US
In-Reply-To: <c407064a-1c2f-46ec-ac57-32bf9cf6f5c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_103337_263592_8B995807 
X-CRM114-Status: GOOD (  27.69  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

So I have no resolution to this (trying to get the AP vendor to chase it 
down), but I'm toying with the idea of trying to work around whatever 
issue the AP is having when this occurs. The only thing I can think of 
is that there is a 3 second delay between the authentication and 
reassociation, and perhaps this is causing some timeout in the AP and in 
turn the deauth.

I'm wondering how long it should take to add/remove a key from the 
firmware? 3 seconds seems very long, and I question if this timeout is 
really necessary or was just chosen arbitrarily? Is this something that 
could be lowered down to e.g. 1 second without negative impacts? The 
code in question is in ath10k_install_key:

ret = ath10k_send_key(arvif, key, cmd, macaddr, flags);
if (ret)
     return ret;

time_left = wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
if (time_left == 0)
     return -ETIMEDOUT;

Thanks,

James

On 7/15/24 4:54 AM, James Prestwood wrote:
> I forgot to mention:
>
> QCA6174 hw3.0 firmware WLAN.RM.4.4.1-00288-
>
> The higher rate of frequency is happening on kernel 5.15, although as 
> I said only at one location with a different AP vendor. We have many 
> other 5.15 devices with significantly less instances of this 
> happening. I also checked a few of our newer software releases using 
> kernel 6.2, and the timeout occurred there as well, but no real impact 
> (no disconnect, no assoc timeout).
>
> On 7/12/24 6:11 AM, James Prestwood wrote:
>> Hi,
>>
>> I've seen this error mentioned on random forum posts, but its always 
>> associated with a kernel crash/warning or some very obvious negative 
>> behavior. I've noticed this occasionally and at one location very 
>> frequently during FT roaming, specifically just after CMD_ASSOCIATE 
>> is issued. For our company run networks I'm not seeing any negative 
>> behavior apart from a 3 second delay in sending the re-association 
>> frame since the kernel waits for this timeout. But we have some 
>> networks our clients run on that we do not own (different vendor), 
>> and we are seeing association timeouts after this error occurs and in 
>> some cases the AP is sending a deauthentication with reason code 8 
>> instead of replying with a reassociation reply and an error status, 
>> which is quite odd.
>>
>> We are chasing down this with the vendor of these APs as well, but 
>> the behavior always happens after we see this key removal 
>> failure/timeout on the client side. So it would appear there is 
>> potentially a problem on both the client and AP. My guess is 
>> _something_ about the re-association frame changes when this error is 
>> encountered, but I cannot see how that would be the case. We are 
>> working to get PCAPs now, but its through a 3rd party, so that timing 
>> is out of my control.
>>
>> From the kernel code this error would appear innocuous, the old key 
>> is failing to be removed but it gets immediately replaced by the new 
>> key. And we don't see that addition failing. Am I understanding that 
>> logic correctly? I.e. this logic:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/key.c#n503 
>>
>>
>> Below are a few kernel logs of the issue happening, some with the 
>> deauth being sent by the AP, some with just timeouts:
>>
>> --- No deauth frame sent, just association timeouts after the error ---
>>
>> Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous BSS> for 
>> new assoc to <new BSS>
>> Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to install 
>> key for vdev 0 peer <previous BSS>: -110
>> Jul 11 00:05:33 kernel: wlan0: failed to remove key (0, <previous 
>> BSS>) from hardware (-110)
>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
>> Jul 11 00:05:33 kernel: wlan0: association with <new BSS> timed out
>> Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
>> Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
>> Jul 11 00:05:36 kernel: wlan0: authenticated
>> Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
>> Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> 
>> (capab=0x1111 status=0 aid=16)
>> Jul 11 00:05:36 kernel: wlan0: associated
>>
>> --- Deauth frame sent amidst the association timeouts ---
>>
>> Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous BSS> for 
>> new assoc to <new BSS>
>> Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to install 
>> key for vdev 0 peer <previous BSS>: -110
>> Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, <previous 
>> BSS>) from hardware (-110)
>> Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
>> Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> while 
>> associating (Reason: 8=DISASSOC_STA_HAS_LEFT)
>> Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
>> Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
>> Jul 11 00:43:24 kernel: wlan0: authenticated
>> Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
>> Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> 
>> (capab=0x1111 status=0 aid=101)
>> Jul 11 00:43:24 kernel: wlan0: associated
>>

