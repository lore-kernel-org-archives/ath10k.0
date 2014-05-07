Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Whtb5-0002nK-Nw
 for ath10k@lists.infradead.org; Wed, 07 May 2014 04:36:48 +0000
Message-ID: <5369B848.606@candelatech.com>
Date: Tue, 06 May 2014 21:36:24 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: spurious quick kickout and ath10k firmware crash
References: <536670A2.1080908@elisanet.fi>
In-Reply-To: <536670A2.1080908@elisanet.fi>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Matti Laakso <malaakso@elisanet.fi>, ath10k@lists.infradead.org



On 05/04/2014 09:53 AM, Matti Laakso wrote:
> I have one Android device (Nexus 7 2013 model), which doesn't like to
> play with ath10k. I often get dmesg full of spurious quick kickouts for
> that device, and this time it was accompanied with a firmware crash:

Looks like you hit an assert in the firmware.

If you feel adventurous and have not gotten any solution elsewhere,
you could try my firmware.  It will require a small patch to ath10k
source, but aside from that it should be compatible with standard
ath10k kernel drivers.

If you crash my firmware, please let me know the crash dump and
I will have a better chance of figuring out why it crashed.

Info on my firmware is here, mixed in with some other things:

http://www.candelatech.com/vsta.php

I'd suggest using a 3.14.x kernel if you can.

Thanks,
Ben


>
> ...
> [152937.200000] ath10k: Spurious quick kickout for STA d8:50:e6:8f:bd:ef
> ... continues ...
> [153128.210000] ath10k: Spurious quick kickout for STA d8:50:e6:8f:bd:ef
> [153129.850000] ath10k: firmware crashed!
> [153129.860000] ath10k: hardware name qca988x hw2.0 version 0x4100016c
> [153129.860000] ath10k: firmware version: 10.1.467.2-1
> [153129.870000] ath10k: target register Dump Location: 0x0040AB94
> [153129.880000] ath10k: target Register Dump
> [153129.880000] ath10k: [00]: 0x4100016C 0x000015B3 0x0099D923 0x00955B31
> [153129.890000] ath10k: [04]: 0x0099D923 0x00060330 0x0000001C 0x0040AD04
> [153129.890000] ath10k: [08]: 0x0000000D 0x0040AE10 0x00442088 0x00955A00
> [153129.900000] ath10k: [12]: 0x00000009 0x00000007 0x009AB338 0x009AB369
> [153129.910000] ath10k: [16]: 0x00958080 0x00953869 0x00000000 0x00000000
> [153129.910000] ath10k: [20]: 0x4099D923 0x0040ACA4 0x00000028 0x00407120
> [153129.920000] ath10k: [24]: 0x8099C99C 0x0040AD04 0x00000000 0xC099D923
> [153129.930000] ath10k: [28]: 0x8098EB29 0x0040AD74 0x00442088 0x0040AE08
> [153129.930000] ath10k: [32]: 0x80994E4B 0x0040ADD4 0x0041ED48 0x00439EB0
> [153129.940000] ath10k: [36]: 0x809968F1 0x0040ADF4 0x0041ED48 0x0042503C
> [153129.950000] ath10k: [40]: 0x80942EB3 0x0040AEE4 0x00423348 0x00000002
> [153129.950000] ath10k: [44]: 0x80940F18 0x0040AF14 0x00000005 0x004039E4
> [153129.960000] ath10k: [48]: 0x80940EEA 0x0040AF44 0x00400000 0x00000000
> [153129.970000] ath10k: [52]: 0x80940F31 0x0040AF64 0x00401C10 0x00400600
> [153129.970000] ath10k: [56]: 0x40940024 0x0040AF84 0x004068E8 0x004068E8
> [153130.980000] ath10k: suspend timed out - target pause event never came
> [153131.500000] ieee80211 phy0: Hardware restart was requested
> [153132.780000] ath10k: device successfully recovered
>
> My ath10k is not quite up to date, it is from backports at the end of
> March, up to and including ath10k: do not overwrite max_antenna_gain.
> I'll update soon and see if I can reproduce that. Any other way to help
> (suitable debug mask for example)?
>
> Matti Laakso
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
