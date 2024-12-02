Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361A0D7832F
	for <ath10k@archiver.kernel.org>; Mon,  2 Dec 2024 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpHtEoVQT/+1mheZMHNstVnKoPavKC8kFC2zHFzplvs=; b=H8DQO4ccO9G9Xo6IqhCptpvJ0S
	oUSXu5NnI00lrdXaD+qjP9YjXYqqjlksdLyAZ8ILP+v0mkmJlWSX9bMtkazhTu/joyCvCpvrCCw2n
	ibo9wQJy/Y/uZG6P2Zg/MJbcPfRahG8lf3TXr4/9iO1sYuaOnkZIonpIFBwhagKsKoMhcQendpJip
	G8XyYoDHvI3zn387zVKzKNCjqLh2bkpPJakxYLnGLpUUhiKatOpoPTE508p10kJvO6moCFx6Xot46
	XWDBpBORQckzaATSUM92PH2agDDsMvgkpngQlnF38Gc7LsUUWquKo/rcfpAi1bQHMNQRL7vX05IkH
	EVjL5K3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8NK-00000006f16-1T9g;
	Mon, 02 Dec 2024 15:30:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Io-00000006e47-3AWK
	for ath10k@lists.infradead.org;
	Mon, 02 Dec 2024 15:25:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-214d1c6d724so33725235ad.3
        for <ath10k@lists.infradead.org>; Mon, 02 Dec 2024 07:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733153133; x=1733757933; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpHtEoVQT/+1mheZMHNstVnKoPavKC8kFC2zHFzplvs=;
        b=jsacNDHtequW21fw/ThzE4wVweeMaqiOgQDHh8A5NgJCqm0LMBAx34EsP9yVWqAd0v
         RvP+3pnl86pJM5IPVXi42TSZYC2HDTZAh8BBgniRxygEmsfufvnTeIpnQY/AvBE4Rtis
         Hjm/TXte/UPKLy8O0ZjVIiG8OLzE+TyCJCDRC0FT9JmqZIXH0ImSdZiWUCkReYP+HPRw
         rFEx/fr+xSKZm+POeUnu/3noNTO3aZuUPws0sRI9ZgKzMZNzdL6eVByj9jAetiBKZr47
         qpdori58wD+WthbnCLUiTdcQ72l7gkekipaBkGj7HxglG0QwC52/WoD56e4kkl3vKgr0
         Vgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153133; x=1733757933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpHtEoVQT/+1mheZMHNstVnKoPavKC8kFC2zHFzplvs=;
        b=HTA1hJx0iylmeLI90TE06YLAg9MSggmkA/LZHnokauXhqYID3uPpeRO6FFZrPF1d2T
         eFZqYhBd7WMEuSeY6L5K6EzEixWuxylZujVm4SgitaqtH1zCFVQLacbJFki2D6SGE+Pj
         oCAqEpeUoRbMmGkBJqxWjZ0O2RhBonpsA5G9AyAbZI7ShQ1DA7EiAh/ivGFWethmCl1K
         1fYejpE6d4IxfybB9HeC9qACfguVvuOlju0PlZD3M7b8wLUSr3BuOcojnbuUIbf/1gJM
         1OrLTeIP2hTnkIaetw/OkLrybhKw8DpfYtGTsqH0moPITmYmGKPQoSfazvC2Vaw/uYsF
         jkqg==
X-Gm-Message-State: AOJu0Yx4Avmym8spZgHu23jmqPOeUXIZlI2t/CplfmRxR/zk8T5GxUoM
	CNXKcze5F9juGWRwH0eTkY3k50zaUL7qA9XZ4cJ5EfrM0T8cYHeF
X-Gm-Gg: ASbGncvLbtbcwZKwFWW9rTWNZ6OgaMC3czrCwbyy7Io5BX6MZ3nZFRZsURjWMpTiXBq
	/ez3hU8WuaqOhYD8wDy3tLWXsp326YWnsKAoO7NgYD/tVuLS8tUU0NCUuFRyoRRCeVDEuFZrxg3
	uoE74vRCq6h5g7AXnRD/yedVw50+4DCYChTE0aQYEbClu7cr+R0RWYoz2dZ+3V19KwAbqcb8TSO
	+KgUbT+un2RATWrN266z7QKFCh3+1mqWLRU9JlMrEtQ3kvsXTM25w==
X-Google-Smtp-Source: AGHT+IHs6Zg/q+Mom3d2oxd1f1h8lVQiA/g/pyUTMYgRVSJh39AGgZPkleLdZOm9nAaSqgBUuRv/Ng==
X-Received: by 2002:a17:902:cf4a:b0:215:4a31:47d4 with SMTP id d9443c01a7336-2154a314b2cmr198391635ad.56.1733153133101;
        Mon, 02 Dec 2024 07:25:33 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f25easm78183965ad.27.2024.12.02.07.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:25:32 -0800 (PST)
Message-ID: <670b209b-dd5d-4b77-9b21-7cb1e3fc036e@gmail.com>
Date: Mon, 2 Dec 2024 07:25:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v3 0/2] Improve ath10k flush queue mechanism
To: Remi Pommarel <repk@triplefau.lt>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
References: <cover.1732293922.git.repk@triplefau.lt>
 <20215f63-e2e6-4f9a-bbbe-d7535c5ce9d2@gmail.com> <Z0nsfoiPOHiKIXvH@pilgrim>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <Z0nsfoiPOHiKIXvH@pilgrim>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_072534_803517_62E17D45 
X-CRM114-Status: GOOD (  33.28  )
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

Hi Remi,

On 11/29/24 8:31 AM, Remi Pommarel wrote:
> Hi James,
>
> On Tue, Nov 26, 2024 at 04:57:36AM -0800, James Prestwood wrote:
>> Hi Remi,
>>
>> On 11/22/24 8:48 AM, Remi Pommarel wrote:
>>> It has been reported [0] that a 3-4 seconds (actually up to 5 sec) of
>>> radio silence could be observed followed by the error below on ath10k
>>> devices:
>>>
>>>    ath10k_pci 0000:04:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
>>>
>>> This is due to how the TX queues are flushed in ath10k. When a STA is
>>> removed, mac80211 need to flush queues [1], but because ath10k does not
>>> have a lightweight .flush_sta operation, ieee80211_flush_queues() is
>>> called instead effectively blocking the whole queue during the drain
>>> causing this radio silence. Also because ath10k_flush() waits for all
>>> queued to be emptied, not only the flushed ones it could more easily
>>> take up to 5 seconds to finish making the whole situation worst.
>>>
>>> The first patch of this series adds a .flush_sta operation to flush only
>>> specific STA traffic avoiding the need to stop whole queues and should
>>> be enough in itself to fix the reported issue.
>>>
>>> The second patch of this series is a proposal to improve ath10k_flush so
>>> that it will be less likely to timeout waiting for non related queues to
>>> drain.
>>>
>>> The abose kernel warning could still be observed (e.g. flushing a dead
>>> STA) but should be now harmless.
>>>
>>> [0]: https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
>>> [1]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")
>> I saw in the original report that it indicated it was only for AP mode but
>> after seeing this and checking some of our clients I saw that this is also
>> happening in station mode too. I only have clients on 6.2 and 6.8. I can
>> confirm its not occurring on 6.2, but is on 6.8. I also tried your set of
>> patches but did not notice any behavior difference with or without them.
>> When it happens, its always just after a roam scan, ~4 seconds go by and we
>> get the failure followed by a "Connection to AP <mac> lost". Oddly the MAC
>> address is all zeros.
>>
>> Nov 25 09:09:50 iwd[16256]: src/station.c:station_start_roam() Using cached
>> neighbor report for roam
>> Nov 25 09:09:54 kernel: ath10k_pci 0000:02:00.0: failed to flush transmit
>> queue (skip 0 ar-state 1): 0
>> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME
>> notification Del Station(20)
>> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_link_notify() event 16 on
>> ifindex 7
>> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME
>> notification Deauthenticate(39)
>> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_deauthenticate_event()
>> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME
>> notification Disconnect(48)
>> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_disconnect_event()
>> Nov 25 09:09:54 iwd[16256]: Received Deauthentication event, reason: 4,
>> from_ap: false
>> Nov 25 09:09:54 kernel: wlan0: Connection to AP 00:00:00:00:00:00 lost
>>
>> Other times, the above logs are preceded by this:
>>
>> Nov 26 00:25:25 kernel: ath10k_pci 0000:02:00.0: failed to flush sta txq
>> (sta ca:55:b8:7a:91:4b skip 0 ar-state 1): 0
>>
>> Note, the above logs are with your patches applied. Maybe this is a separate
>> issue? Or do you think its related?
> Thanks fot the test. Yes this patchset is here only to fix the issue for
> AP (this caused AP to stall all traffic for every STA connected to it).
> So while this issue is interesting it is not addressed by this patchset.
Thanks for the clarification.
>
> Out of curiosity I tried to reproduce it currently trying to roam an
> ath10k sta back and forth two APs (same SSID/psk, different channels)
> and wasn't able to reproduce with wpa_supplicant, didn't try with iwd
> though. Or maybe the AP the sta is roaming away from has stopped
> responding, in that case I don't know what can be done here as it does
> not seem we want to drop pending frames (as we would prefer to deauth
> cleanly from AP in main case).
We have quite a lot of clients on ath10k and the issue is rare(ish). But 
you may be right and its spurred from the AP not responding. I need to 
dig in more to see if there is anything to be done on the client side, I 
just figured implementing the flush queue op would apply to both station 
and AP mode.
>
> In any case still I think this is a separate issue and it is also way
> less critical than the AP one (one STA can create ~4sec DOS to the
> entire BSS vs a STA took more time to roam away if AP crashed).

So for my companies use case a 4 second DOS to an individual BSS can be 
potentially bad. This doesn't really differ from an outright disconnect 
but I'm still trying to limit any lapse in connectivity if at all 
possible. If I can gather more info I'll report back.

Thanks,

James

>
> Thanks,
>

