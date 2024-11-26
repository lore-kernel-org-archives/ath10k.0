Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514BBD3B98E
	for <ath10k@archiver.kernel.org>; Tue, 26 Nov 2024 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmuzQHP8M/5vwjzhJEB1na265cXygkcCdDHq3RqQfr4=; b=ITvtfHSr5Uckb1G9dnpRz422BE
	5xaDdR+L3J5UjVQGG3cZiTfPRk1ynJsHmU1o/VxtL15p2iklb03xo70relWrrxQZosatAPeX5dFz2
	MKVCA1V+vNxMqsIJ/oBTpijGhExsCcA7Ios443D8qBt8fDFcC+Hh3GiSEnimOZYJuxFD1np44rV6r
	aoF1CAHd2bU6HaOxBF2x1dvZzwCWA+wQNp9tB0Up2/j0rZfIJIGxmQYp2rYkHkS3ODsmnz+iJ4XPF
	awN0ltBlORasc/3hWF4HH85p5WCl+Q1/viavxID0Hoz/Vcs4SuoYBYChcNsWW0y2BD9OL02jMdSNr
	ehJXMAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvRF-0000000AgI6-09g8;
	Tue, 26 Nov 2024 13:17:09 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvAJ-0000000AdPL-3uVJ
	for ath10k@lists.infradead.org;
	Tue, 26 Nov 2024 12:59:41 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6d41dbf6cfbso41530946d6.3
        for <ath10k@lists.infradead.org>; Tue, 26 Nov 2024 04:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732625979; x=1733230779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tmuzQHP8M/5vwjzhJEB1na265cXygkcCdDHq3RqQfr4=;
        b=Md/qbo1KTwLvamJmo8qxDyAQZTNC2DUYWfio+LpDcOL+vQp44Jy+F81gjlDFHBg4oY
         rFP5FOk//gA88JgwkLQ4/1CVntWKYJwbc+Xj9Dm6nZxueN2drb/2K5GHAwTbb2zrdFn1
         MmhwVZ1DR2QbSyfrNmKhvQC0F4WmAXRWvweaSoKd7e3rGhYf4LUYlgAK4BgXjozaoGLr
         dod4wITbQcA2Tnezx5llNiqyWZa99NQP4M6y0K/OIN8Pfx2poK/jZ4e4X2YeuyIKZgYz
         FDMZfRFvIMlcADfnBWRAIEp4cQoeXhqPixqShzw2Iuk4tg3HPegXDqPutaQqHVtWD0cd
         HO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732625979; x=1733230779;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmuzQHP8M/5vwjzhJEB1na265cXygkcCdDHq3RqQfr4=;
        b=R6ZLXO0j+RX/U1a9Cjp/leOrkc7FbrGHygK4SvB/p4Po9kaxeo6elTcvdovPgC60Fp
         bQe5Ojc8y5ylUEqn/JL/ScZwZOHQRHP1RtT5x7Mjkl+V0zdmRkt7omsgSas8c6AkuoNG
         j90pp5CZ8Qjn/dsvRWOlefp4Px+RDpOSs9/ibZRzpP3ZqgRKKCrUJTgxL2DM36XyzpmP
         x8qZZs9FQT2w4ohQraoxd8FxvRJD/r+YkLn9LpsvtE9pdk4arM2XRjNZzyLurtWyqBRI
         gju1VK+iUvLXPj58etUfWX5ELrY3w8h1yyj1davyAzED0WlnFskifX2079LZF3WmOTiQ
         /DsA==
X-Forwarded-Encrypted: i=1; AJvYcCUcWiAc38toZb0ghl9UkV6guAjrbJf1SlO/XfwtRz9hqzceX9L2wBmUAq/Sd+nLmWsDTuxoGHg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2dWBejhCMTKGLxU7j9dRmwMLJVZI79bzzxzoFvHEnZe8tDsoc
	B9Mc++W7bjkkNkpRbeaxR3pEAYBPk4P8+802IVtsckJL/+AuSXHEPw9ejw==
X-Gm-Gg: ASbGncuqweK9l6vGP9jRBMN67QHYqTYqpxC1eBrHR00pRNh5/J5JSq1qte/U0XxU6uz
	8OcDvAKM1mA83SpclBHWxsm4Ef6E+RAeh14KCztGdEX9OI3nuDFSWtOhoyJ0FB15H7KCXkULvzo
	QmaE8FidksFsHnWx4GYmsCCBzvGqzmKl+X6mV+2oqB6Y6XWSbdodKEZZuHVR1rXYxSUulgVz+5W
	yeYcCY+MfsRVI0vED/3xIRfdnJ86fmWnGLe/qk5NkXbPTH1Uv9thw==
X-Google-Smtp-Source: AGHT+IFyie6MMV1m5Z0np/9hEs9i8B3quTAjMwTDJzLJDJ2GdA7uHhlYgt7uUdvINSCAXbnRqtmhow==
X-Received: by 2002:a05:6214:2a4c:b0:6d4:1a99:427f with SMTP id 6a1803df08f44-6d45136853cmr296619076d6.49.1732625978632;
        Tue, 26 Nov 2024 04:59:38 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b6670dsm54649206d6.124.2024.11.26.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 04:59:38 -0800 (PST)
Message-ID: <8c2f274b-cf05-4fad-b9d6-fa9de1363d42@gmail.com>
Date: Tue, 26 Nov 2024 04:59:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v3 0/2] Improve ath10k flush queue mechanism
From: James Prestwood <prestwoj@gmail.com>
To: Remi Pommarel <repk@triplefau.lt>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
References: <cover.1732293922.git.repk@triplefau.lt>
 <20215f63-e2e6-4f9a-bbbe-d7535c5ce9d2@gmail.com>
Content-Language: en-US
In-Reply-To: <20215f63-e2e6-4f9a-bbbe-d7535c5ce9d2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045939_969538_D566C4D0 
X-CRM114-Status: GOOD (  25.92  )
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


On 11/26/24 4:57 AM, James Prestwood wrote:
> Hi Remi,
>
> On 11/22/24 8:48 AM, Remi Pommarel wrote:
>> It has been reported [0] that a 3-4 seconds (actually up to 5 sec) of
>> radio silence could be observed followed by the error below on ath10k
>> devices:
>>
>>   ath10k_pci 0000:04:00.0: failed to flush transmit queue (skip 0 
>> ar-state 1): 0
>>
>> This is due to how the TX queues are flushed in ath10k. When a STA is
>> removed, mac80211 need to flush queues [1], but because ath10k does not
>> have a lightweight .flush_sta operation, ieee80211_flush_queues() is
>> called instead effectively blocking the whole queue during the drain
>> causing this radio silence. Also because ath10k_flush() waits for all
>> queued to be emptied, not only the flushed ones it could more easily
>> take up to 5 seconds to finish making the whole situation worst.
>>
>> The first patch of this series adds a .flush_sta operation to flush only
>> specific STA traffic avoiding the need to stop whole queues and should
>> be enough in itself to fix the reported issue.
>>
>> The second patch of this series is a proposal to improve ath10k_flush so
>> that it will be less likely to timeout waiting for non related queues to
>> drain.
>>
>> The abose kernel warning could still be observed (e.g. flushing a dead
>> STA) but should be now harmless.
>>
>> [0]: 
>> https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
>> [1]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")
>
> I saw in the original report that it indicated it was only for AP mode 
> but after seeing this and checking some of our clients I saw that this 
> is also happening in station mode too. I only have clients on 6.2 and 
> 6.8. I can confirm its not occurring on 6.2, but is on 6.8. I also 
> tried your set of patches but did not notice any behavior difference 
> with or without them. When it happens, its always just after a roam 
> scan, ~4 seconds go by and we get the failure followed by a 
> "Connection to AP <mac> lost". Oddly the MAC address is all zeros.
>
> Nov 25 09:09:50 iwd[16256]: src/station.c:station_start_roam() Using 
> cached neighbor report for roam
> Nov 25 09:09:54 kernel: ath10k_pci 0000:02:00.0: failed to flush 
> transmit queue (skip 0 ar-state 1): 0
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME 
> notification Del Station(20)
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_link_notify() event 16 
> on ifindex 7
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME 
> notification Deauthenticate(39)
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_deauthenticate_event()
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME 
> notification Disconnect(48)
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_disconnect_event()
> Nov 25 09:09:54 iwd[16256]: Received Deauthentication event, reason: 
> 4, from_ap: false
> Nov 25 09:09:54 kernel: wlan0: Connection to AP 00:00:00:00:00:00 lost
>
> Other times, the above logs are preceded by this:
>
> Nov 26 00:25:25 kernel: ath10k_pci 0000:02:00.0: failed to flush sta 
> txq (sta ca:55:b8:7a:91:4b skip 0 ar-state 1): 0
>
> Note, the above logs are with your patches applied. Maybe this is a 
> separate issue? Or do you think its related?

Forgot to mention, this is on the QCA6174 hw 3.2

firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp 
crc32 bf907c7c

>
> Thanks,
>
> James
>
>>
>> V3:
>>    - Initialize empty to true to fix smatch error
>>
>> V2:
>>    - Add Closes tag
>>    - Use atomic instead of spinlock for per sta pending frame counter
>>    - Call ath10k_htt_tx_sta_dec_pending within rcu
>>    - Rename pending_per_queue[] to num_pending_per_queue[]
>>
>> Remi Pommarel (2):
>>    wifi: ath10k: Implement ieee80211 flush_sta callback
>>    wifi: ath10k: Flush only requested txq in ath10k_flush()
>>
>>   drivers/net/wireless/ath/ath10k/core.h   |  2 +
>>   drivers/net/wireless/ath/ath10k/htt.h    | 11 +++-
>>   drivers/net/wireless/ath/ath10k/htt_tx.c | 49 +++++++++++++++-
>>   drivers/net/wireless/ath/ath10k/mac.c    | 75 ++++++++++++++++++++----
>>   drivers/net/wireless/ath/ath10k/txrx.c   | 11 ++--
>>   5 files changed, 127 insertions(+), 21 deletions(-)
>>

