Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4RzV-00029D-1D
 for ath10k@lists.infradead.org; Sat, 18 Jan 2014 09:14:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] Initial 11ac support using ath10k
References: <1513091.zjVOOQ7NvD@bentobox>
 <87mwitpsmn.fsf@kamboji.qca.qualcomm.com>
Date: Sat, 18 Jan 2014 11:14:28 +0200
In-Reply-To: <87mwitpsmn.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Sat, 18 Jan 2014 11:05:20 +0200")
Message-ID: <878uudps7f.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@open-mesh.com>
Cc: simon@open-mesh.com, openwrt-devel@lists.openwrt.org, ath10k@lists.infradead.org, Matti Laakso <malaakso@elisanet.fi>

(resending my mail due to a stupid rule in ath10k-devel, I need to be
subcribed before posting to that list)

Hi Sven,

adding ath10k@lists.infradead.org.

Sven Eckelmann <sven@open-mesh.com> writes:

> Hi,
>
> support for ath10k cards was added a while ago to OpenWrt. Unfortunately, the 
> actual 802.11ac support was never added (patches on the mailing lists were 
> just ignored). This is a rather unpleasant situation when trying to get some 
> 11ac test hardware working.

Yeah, it would be great to get proper ath10k support to OpenWrt. Thanks
for working on this!

> I've picked up the patches and rebased them on top of the current master 
> branch/trunk.

Where did you take the ath10k patches? ath10k is under heavy
development, so I strongly recommend taking patches directly from
ath-next branch of my ath.git. That way you would be using the latest
and greatest.

> Just as general information to the state of ath10k, my current test showed 
> some problems with it:
>
>  * Samsung GT-I9300 only got horrible slow connections to an QCA9880 but
>    an Intel N6205 (using iwlwifi from v3.12) or Samsung S4 worked
>    "fine"

Could you report the I9300 issue to the ath10k list with more details,
please? We can try to investigate it.

>  * Adhoc mode doesn't work at all

That was with 10.1 firmware? AFAIK it doesn't support adhoc at all. I
think we need to add a firmware feature flag to disable adhoc with that
firmware.

>  * TX bitrate information is bogus (iw XXX station dump)

Yeah, this is annoying. But firmware doesn't report this to the host at
all so there is not much ath10k can do right now. But I'll send a query
to the firmware team if they could provide that information to ath10k.

>  * Crashed relative often on reconfiguration:
>    Data bus error, epc 87b7a864, ra 87b7a864

On some QCA988x boards cold reset seems to cause problems on the PCI
bus. We are investigating this.

>  * Sometimes adding of station seems to fail:
>    ath10k: Failed to add peer 5c:0a:5b:4e:6a:c4 for vdev 1 when adding a new
>    sta: -145

This is new to me. Can you report this to the ath10k list, please?

>  * Adhoc interface +  "iw dev wlan0 scan trigger" just crashes the firmware:
>    [ 296.160000] ath10k: firmware crashed!
>    [ 296.170000] ath10k: hardware name qca988x hw2.0 version 0x4100016c
>    [ 296.170000] ath10k: firmware version: 65.467.0.0

What firmware version was this? The version printed here seems to be
corrupted.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
