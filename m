Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34820C25B74
	for <ath10k@archiver.kernel.org>; Mon, 27 May 2024 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjTTB7EvpWLbHYBeJu7TXnB19IeUF15/w3FcypXQJ8o=; b=2SpA2UyOQASIr5DQiCVgrKLMqy
	V3mCD2AMWK8x8cDsjrMH/FmtCDVdM7XpBG0FQX0YhpxIsDuy2An34k8cxIvvKCOwvux+0Z0fTNGQZ
	eVCDPjuPpVr60x3LEpVCIipowLXnMB5ZCIXCWBMb4Mo+NUsr4nj6+/UlvcTjJN2ousXOlw9nDe5vv
	kgoh1HKdQcY6MKcf8OfXtt1vez581m13jdyC6Yxnhdo5mnJskXGUkzl6+EGriM+dwhKUUYPXypEoI
	eqo8ve3tCFIxMSLFYMISlc1+2PgW4L+85oBEbjlmUOU5XJg6vMaP7mI3VBIEUcnrVOgT7iAZ28SBR
	f8Dl8PDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXXg-0000000EZoE-0bR0;
	Mon, 27 May 2024 10:25:24 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXXc-0000000EZnA-2c84
	for ath10k@lists.infradead.org;
	Mon, 27 May 2024 10:25:23 +0000
Received: from [141.14.220.56] (g56.guest.molgen.mpg.de [141.14.220.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5A5E861E5FE01;
	Mon, 27 May 2024 12:25:00 +0200 (CEST)
Message-ID: <96828117-2cf8-4a34-a8e6-78ace96b32d3@molgen.mpg.de>
Date: Mon, 27 May 2024 12:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k_pci 0000:3a:00.0: Could not init core: -110
To: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 James Prestwood <prestwoj@gmail.com>
References: <0c544b16-5c0d-4687-9f96-8ff1f3269f79@molgen.mpg.de>
 <e1bc0bb8-a66e-4e03-bc22-3dc506b6fb59@quicinc.com>
 <87sey38vte.fsf@kernel.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87sey38vte.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_032520_869782_3BDC3385 
X-CRM114-Status: GOOD (  11.20  )
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

Dear Kalle, dear Baochen,


Am 27.05.24 um 11:10 schrieb Kalle Valo:
> Baochen Qiang writes:
> 
>> On 5/27/2024 4:42 PM, Paul Menzel wrote:

>>> On the Intel Kaby Lake notebook Dell XPS 13 with
>>>
>>>      3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
>>>
>>> with at least a self-built Linux 6.9-rc5, on April 26th, 2024, and
>>> Linux 6.8.11, today, May 27th, 2024, the error below happened, and
>>> the device couldn’t authenticate to a WiFi network until reloading
>>> the module *ath10k_core* and *ath10k_pci* (didn’t check just
>>> *ath10k_pci*):
>>>
>>>      $ sudo modprobe -r ath10k_pci
>>>      $ sudo modprobe -r ath10k_core
>>>      $ sudo modprobe ath10k_pci
>>>
>>> ```
>>> [   49.441618] ath10k_pci 0000:3a:00.0: wmi service ready event not received
>>> [   49.523814] ath10k_pci 0000:3a:00.0: Could not init core: -110
> 
> [...]
> 
>> Are you using a distro kernel?

The 6.8.11 is Debian’s current Linux kernel in the suite *unstable/sid*
(*linux-image-6.8.11-amd64* 6.8.11-1).

>> Could you check if below patch merged in your kernel? if not can
>> you merge it and try again?
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath10k?id=e57b7d62a1b2f496caf0beba81cec3c90fad80d5
> 
> Paul, if you are feeling brave to try out an -rc this commit is in just
> released v6.10-rc1.

Thank you. I haven’t found out yet, how to reproduce this. I’ll keep an 
eye on it.

As the commit message says:

> This results in timeout issue if the interrupt is not fired, due to
> some unknown reasons.

There are reports from 2016 to 2021 with similar symptoms. These were 
supposedly fixed with 
`/usr/lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin` [1][2]:

     $ md5sum /usr/lib/firmware/ath10k/QCA6174/hw3.0/board.bin 
/usr/lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin
     cb37c63d9ca28f53fea1ff09ad7c7a82 
/usr/lib/firmware/ath10k/QCA6174/hw3.0/board.bin
     651e921b372848b3928621e6f1d34b01 
/usr/lib/firmware/ath10k/QCA6174/hw3.0/board-2.bin


Kind regards,

Paul


[1]: https://github.com/kvalo/ath10k-firmware/pull/2
[2]: https://github.com/linux-surface/linux-surface/issues/41

