Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE41C3DA5D
	for <ath10k@archiver.kernel.org>; Mon, 15 Jul 2024 11:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rlxhlv4sEtMXzC1YTV5kDxkXImNQxemkqe4YaLjnH5s=; b=H0z1dIOuFA9fH4eP166jPfZh7U
	ITskR6cAX0gEvva3tgp35N4ioiHIB0pbqW2mbaeJSYHmzLp8cxZOdsrxuNRWsxTKfvK0WuoNs18HD
	tOzmqqjoMZ/xBJaRTwR/qzIMHt3nTI0k38oD12VVFXbpxRxa0+/bjxvihFeyBLnkyhOsQ1hBiWSuE
	l2KE/3dDz9gdO9QF0E1lCLoKrjp8YDV4qzQXshBe+UrjjvhOlPsLh42OCU4Km0Hx7Owj4WAbtlbp8
	x2iY0/AHWg+LL5ZzrykbN576+ZF/R2s0GFDoR83QMMADYpwUW7g/RGVgsHPzs/Sl5j77Daf91ba3c
	GQtofxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTKHS-00000006vqH-09xf;
	Mon, 15 Jul 2024 11:54:10 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTKHO-00000006vph-2X24
	for ath10k@lists.infradead.org;
	Mon, 15 Jul 2024 11:54:08 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e057bdc936fso4131871276.1
        for <ath10k@lists.infradead.org>; Mon, 15 Jul 2024 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721044445; x=1721649245; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rlxhlv4sEtMXzC1YTV5kDxkXImNQxemkqe4YaLjnH5s=;
        b=OiG+e5xtBsK+3hxfUBFJnQiBKSu5PGTYHOplTJfzZq3InAOEPLbO1d49BU9M+4OcR3
         l4Gu0gW8iS0Mvut6facXhnxqk3nb6TVS5vC8rvra6auzuJLMmD/LS4wJo6CSU9hhT+Q/
         zY/UMWYULssNLGGKgv90K2Vc++4vz4e9pfcIBSUkntXT5ZYKYpVmvR4s+roZnjiLNz0n
         duFKS+0FH6K4C9HvXLpAJ3Y7ZnjMeuLEiWbaTy2DM2OWRnCWBpkuK2IBV6GF96OgoRxC
         mtT8aNyQM/h5FfDLtndlHUYCPCGqR/rG2bH9qQusgWgSA00uv1UlC+KkDLF4suTHQd9C
         77DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721044445; x=1721649245;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rlxhlv4sEtMXzC1YTV5kDxkXImNQxemkqe4YaLjnH5s=;
        b=D6sGMJ0mxSzdRLcszKHeD26UqPOw1LlPsaFH9mbHGO2qPpM4MzRck7RkgfXKp6jodQ
         l3gjc3fjTvFOqJEFpiDfmymtLzQW+gmdJcX8v7f7Fnf55nz0rK81ka0PjQgmTYoc1+Cv
         CDchZiGk7eKQa+yyMsx86FRLl3MgeLWMZPjR+u+P9afoV/MqLRvlOR+bg/5sRgTNJyUF
         FFoFysg5UYOcbetej6Jvj6DFZDj79gJGcufLHXWQ6RUnt1puNDgoj5Cf/GBh00ApvRCV
         fLj0EUPoFKo0bSjeVz5xBNAyzJt0ba4lFAK/nFEOxEBq6H3oBlWf3kQ3Pa4ko6b++I68
         hvbg==
X-Forwarded-Encrypted: i=1; AJvYcCUUEsXCZ6DrwIRHkUslmv+Ov80ZrOpYpmeRGvAICOBJKgkwvqj40F7AlVLUa6TN7rc1bAYFe5dU48C21+cro0QrT24z4yYsOQ/Nww==
X-Gm-Message-State: AOJu0YxQrmzrBbs+lWpMCcaDI9wZgSlzOZnIlYryc3uypOG5vIr9Ifhd
	yBNS5hTFPYSuuYDqxDJbIpZlcqTwpDij7nimigaqY2xzHoWqssW30lo7Cg==
X-Google-Smtp-Source: AGHT+IEJmXThxojsIZ+WjF1f4KWp/8RJs/LynNKJvDBDQusPvQlX0tkx4rkLWpDAKvI6jGlCQHQh2w==
X-Received: by 2002:a25:a369:0:b0:e03:48ed:d275 with SMTP id 3f1490d57ef6-e041b173dfemr19456559276.61.1721044444776;
        Mon, 15 Jul 2024 04:54:04 -0700 (PDT)
Received: from [10.102.4.159] ([50.78.19.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b761a0f7e2sm20369516d6.100.2024.07.15.04.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 04:54:04 -0700 (PDT)
Message-ID: <c407064a-1c2f-46ec-ac57-32bf9cf6f5c6@gmail.com>
Date: Mon, 15 Jul 2024 04:54:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
From: James Prestwood <prestwoj@gmail.com>
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
Content-Language: en-US
In-Reply-To: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_045406_666549_4DF6B97A 
X-CRM114-Status: GOOD (  24.18  )
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

I forgot to mention:

QCA6174 hw3.0 firmware WLAN.RM.4.4.1-00288-

The higher rate of frequency is happening on kernel 5.15, although as I 
said only at one location with a different AP vendor. We have many other 
5.15 devices with significantly less instances of this happening. I also 
checked a few of our newer software releases using kernel 6.2, and the 
timeout occurred there as well, but no real impact (no disconnect, no 
assoc timeout).

On 7/12/24 6:11 AM, James Prestwood wrote:
> Hi,
>
> I've seen this error mentioned on random forum posts, but its always 
> associated with a kernel crash/warning or some very obvious negative 
> behavior. I've noticed this occasionally and at one location very 
> frequently during FT roaming, specifically just after CMD_ASSOCIATE is 
> issued. For our company run networks I'm not seeing any negative 
> behavior apart from a 3 second delay in sending the re-association 
> frame since the kernel waits for this timeout. But we have some 
> networks our clients run on that we do not own (different vendor), and 
> we are seeing association timeouts after this error occurs and in some 
> cases the AP is sending a deauthentication with reason code 8 instead 
> of replying with a reassociation reply and an error status, which is 
> quite odd.
>
> We are chasing down this with the vendor of these APs as well, but the 
> behavior always happens after we see this key removal failure/timeout 
> on the client side. So it would appear there is potentially a problem 
> on both the client and AP. My guess is _something_ about the 
> re-association frame changes when this error is encountered, but I 
> cannot see how that would be the case. We are working to get PCAPs 
> now, but its through a 3rd party, so that timing is out of my control.
>
> From the kernel code this error would appear innocuous, the old key is 
> failing to be removed but it gets immediately replaced by the new key. 
> And we don't see that addition failing. Am I understanding that logic 
> correctly? I.e. this logic:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/key.c#n503 
>
>
> Below are a few kernel logs of the issue happening, some with the 
> deauth being sent by the AP, some with just timeouts:
>
> --- No deauth frame sent, just association timeouts after the error ---
>
> Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous BSS> for 
> new assoc to <new BSS>
> Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to install key 
> for vdev 0 peer <previous BSS>: -110
> Jul 11 00:05:33 kernel: wlan0: failed to remove key (0, <previous 
> BSS>) from hardware (-110)
> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
> Jul 11 00:05:33 kernel: wlan0: association with <new BSS> timed out
> Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
> Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
> Jul 11 00:05:36 kernel: wlan0: authenticated
> Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
> Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> 
> (capab=0x1111 status=0 aid=16)
> Jul 11 00:05:36 kernel: wlan0: associated
>
> --- Deauth frame sent amidst the association timeouts ---
>
> Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous BSS> for 
> new assoc to <new BSS>
> Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to install key 
> for vdev 0 peer <previous BSS>: -110
> Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, <previous 
> BSS>) from hardware (-110)
> Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
> Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> while 
> associating (Reason: 8=DISASSOC_STA_HAS_LEFT)
> Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
> Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
> Jul 11 00:43:24 kernel: wlan0: authenticated
> Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
> Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> 
> (capab=0x1111 status=0 aid=101)
> Jul 11 00:43:24 kernel: wlan0: associated
>

