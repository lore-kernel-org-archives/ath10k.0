Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA62C43334
	for <ath10k@archiver.kernel.org>; Tue, 19 Jul 2022 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uUpPH+DLt9zuxCWiFqtghlbPMT8+fVexhn7hayRW1g=; b=OWnMEQ0kBQrnqJ
	LKAQnT7jHzUIzY9rz11oT4tBxRO1gH8IuZyMV7jM7UhXSH6uApVZA8AKExuNaiTeEXVavRTUB+WNp
	ID9NrV1/MoxCpWtPtuyN2uJvwQmy37CtFIue5WyX0J69It9YbsjoKTP4RE+Jgeiy7RIuUQFVwkQqp
	pQe3OjhX5hHad1MmtYluFwzYOxSMIKPqnyx8IYBZzJZDc72vQQTVPNaY9hHLurCorgxcA0a7woBP4
	Jq9NaP4mlbuSsV7kKVb8oaJuClvRJkqiv7inPPL4EbSFq7NrK2S0b3VDXI9zTCdr84DJ42M7+/Gwi
	dZZMcFAkPW/ADKbC4kAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDpPo-00ACyu-QZ; Tue, 19 Jul 2022 15:45:40 +0000
Received: from simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDpPl-00ACwY-Rg
	for ath10k@lists.infradead.org; Tue, 19 Jul 2022 15:45:39 +0000
Received: from [IPV6:2003:c5:973c:81a8::792] (p200300C5973c81a80000000000000792.dip0.t-ipconnect.de [IPv6:2003:c5:973c:81a8::792])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by simonwunderlich.de (Postfix) with ESMTPSA id 3F354FA86A;
	Tue, 19 Jul 2022 17:36:34 +0200 (CEST)
Message-ID: <31e87fa2-6fea-5fe2-ab80-6050da9af7ce@simonwunderlich.de>
Date: Tue, 19 Jul 2022 17:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH] mac80211: Fix wrong channel bandwidths reported for
 aggregates
To: Adrian Chadd <adrian@freebsd.org>,
 =?UTF-8?Q?Linus_L=c3=bcssing?= <linus.luessing@c0d3.blue>
Cc: Johannes Berg <johannes.berg@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?=
 <toke@toke.dk>, Kalle Valo <kvalo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Simon Wunderlich <sw@simonwunderlich.de>, Sven Eckelmann
 <sven@narfation.org>, ath10k <ath10k@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220718222804.21708-1-linus.luessing@c0d3.blue>
 <CAJ-VmomaQ-ai7n5i8-8sXsgaih4vjjHXyw+JQESGMERgC8Qqdw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Linus_L=c3=bcssing?= <ll@simonwunderlich.de>
In-Reply-To: <CAJ-VmomaQ-ai7n5i8-8sXsgaih4vjjHXyw+JQESGMERgC8Qqdw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_084538_099465_87E29671 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 19/07/2022 17:03, Adrian Chadd wrote:
> Hi!
> 
> It's not a hardware bug. Dating back to the original AR5416 11n chip,
> most flags aren't valid for subframes in an aggregate. Only the final
> frame has valid flags. This was explicitly covered internally way back
> when.

Ah, thanks for the clarification! I see it in the datasheet for the 
QCA9531, too, now. And thanks for the confirmation, that what we are 
doing so far is not correct for ath9k.

Words 0+2 are valid for all RX descriptors, 0+2+11 valid for the last RX 
descriptor of each packet and 0-11 for the last RX descriptor of an 
aggregate or last RX descriptor of a stand-alone packet. Or in other 
words, word 4, which contains the 20 vs. 40 MHz indicator, is invalid 
for any aggregate sub-frame other than the last one. I can rename that 
in the commit message.


Another approach that also came to my mind was introducing more explicit 
flags in cfg80211.h's "struct rate_info", like a RATE_INFO_BW_UNKNOWN in 
"enum rate_info_bw" and/or RATE_INFO_FLAGS_UNKNOWN in "enum 
rate_info_flags". And setting those flags in ath9k_cmn_process_rate().

The current approach is smaller though, as it simply uses the already 
existing flags. If anyone has any preferences, please let me know.

Regards, Linus

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
