Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W7n2G-0007EX-Kb
 for ath10k@lists.infradead.org; Mon, 27 Jan 2014 14:19:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] Initial 11ac support using ath10k
References: <1513091.zjVOOQ7NvD@bentobox>
 <87mwitpsmn.fsf@kamboji.qca.qualcomm.com>
 <878uudps7f.fsf@kamboji.qca.qualcomm.com>
 <2241060.ARHWKI05xP@bentobox>
Date: Mon, 27 Jan 2014 16:19:07 +0200
In-Reply-To: <2241060.ARHWKI05xP@bentobox> (Sven Eckelmann's message of "Mon, 
 20 Jan 2014 11:29:26 +0100")
Message-ID: <874n4pld7o.fsf@kamboji.qca.qualcomm.com>
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
Cc: Simon Wunderlich <simon@open-mesh.com>, "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

Sven Eckelmann <sven@open-mesh.com> writes:

> On Saturday 18 January 2014 01:14:28 Kalle Valo wrote:
>
>> > Just as general information to the state of ath10k, my current test showed
>> > 
>> > some problems with it:
>> >  * Samsung GT-I9300 only got horrible slow connections to an QCA9880 but
>> >  
>> >    an Intel N6205 (using iwlwifi from v3.12) or Samsung S4 worked
>> >    "fine"
>> 
>> Could you report the I9300 issue to the ath10k list with more details,
>> please? We can try to investigate it.
>
> This is a little bit problematic. I could reproduce this problem quite well on 
> a specific date and when I tried some other day it worked fine. So it is hard 
> to report anything. The only thing I could report would be the "Failed to add 
> peer" problem which seemed to happen at the same time.
>
> Maybe I find a way to reproduce it reliable but I don't know how at the 
> moment.

The bug report doesn't need to be perfect, not all bugs are easily
reproducable, but just knowing about a bug would even help. That's why
ask people to send bug reports to ath10k@lists.infradead.org.

>> >  * Adhoc mode doesn't work at all
>> 
>> That was with 10.1 firmware? AFAIK it doesn't support adhoc at all. I
>> think we need to add a firmware feature flag to disable adhoc with that
>> firmware.
>
> It used the latest and greatest, stable(?) version of the firmware when the 
> patchset was generated: ap/firmware-2.bin_10.1.467-1
>
> The statement "doesn't support adhoc at all" makes me a little bit nervous. 
> Would you say that it is better to completely ignore the "ap" directory of the 
> firmware repo [2]? Which benefits does the ap firmware has over the ath10k 
> firmware?

So we have two firmware branches right now, "main" and "10.1". 10.1 is
solely focused on AP mode, nothing else. The main branch again has more
features, like P2P, but doesn't support AP mode as well as 10.1 does.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
