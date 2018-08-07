Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fn6ZG-00009K-8w
 for ath10k@lists.infradead.org; Tue, 07 Aug 2018 18:18:51 +0000
Subject: Re: ath10k: antenna bitmask support?
References: <20180807020813.GA185137@ban.mtv.corp.google.com>
 <6dbb4086-f5bd-2ece-e3f3-9ac7cd5b4d9c@candelatech.com>
 <20180807175255.GA163107@ban.mtv.corp.google.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <b9133dfa-a903-8858-4966-b17240ade2d8@candelatech.com>
Date: Tue, 7 Aug 2018 11:18:32 -0700
MIME-Version: 1.0
In-Reply-To: <20180807175255.GA163107@ban.mtv.corp.google.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: ath10k@lists.infradead.org

On 08/07/2018 10:52 AM, Brian Norris wrote:
> Hi Ben,
>
> On Tue, Aug 07, 2018 at 06:19:22AM -0700, Ben Greear wrote:
>> On 08/06/2018 07:08 PM, Brian Norris wrote:
>>> Hi all,
>>>
>>> I'm looking at ancient changes like this:
>>>
>>> commit 5572a95b4b5768187652a346356e39e7542ca6e0
>>> Author: Ben Greear <greearb@candelatech.com>
>>> Date:   Mon Nov 24 16:22:10 2014 +0200
>>>
>>>     ath10k: apply chainmask settings to vdev on creation
>>>
>>> since I see that some firmwares seem to crash a lot if you apply certain
>>> chainmask settings (e.g., 0x2).
>>>
>>> Is it really expected that you can set gaps in the chainmask or not? I
>>> ask because I've been trying to use this for doing some antenna
>>> configuration verification (e.g., disable all but one antenna and see
>>> what happens), and this works as expected on APs I have running IPQ8064
>>> (QCA988X?), but it crashes the firmware on IPQ4019.
>>
>> I don't think you can even directly set the chainmask in the firmware,
>
> Well, I guess the WMI interface is a bit strange then: it appears to
> take a raw mask -- e.g.:
>
>         ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->tx_chain_mask,
>                                         tx_ant);
>
> but I guess that doesn't mean it *really* accepts a mask? You have to
> presuppose what values it will accept?

Sorry, you are correct.  I just looked at my 10.1 firmware, and it does indeed
propagate the tx chainmask, and it has no special settings to ignore gaps
as far as I can tell.

In fact, it has special register handling for gaps that would appear to be designed to
allow things like 0x5, 0x6 masks to work as hoped.

I would guess then that 0x5 mask should mean NSS is 2 instead of 1.

But, especially as you report some extra crashes in your attempts, you
may need some way to whitelist firmware before allowing the user to
set this.

I don't have time to poke at it now, but if you want to test the -ct firmware
for 988X hardware, and if you see any crashes or weird behaviour, please let
me know and I'll work on it when I have time.

Thanks,
Ben


>
>> and from my previous looking at the firmware, it is not designed to support
>> gaps.
>
> OK, thanks for the info.
>
>> If you want to determine if an antenna is working, you can look at the per-chain
>> RSSI stats when receiving frames using all available antenna (ie, 3x3 rates for a 3x3 NIC).
>
> That's not quite the same as verifying each antenna separately, but it
> might be good enough. I suppose this wasn't really considered when some
> of the test frameworks I'm using were written, seeing as per-chain
> signal reports weren't even available in ath10k until relatively
> recently:
>
> commit 8241253d03fe9098e98315a4d66027ae31ab65c5
> Author: Norik Dzhandzhapanyan <norikd@gmail.com>
> Date:   Mon Jun 12 18:03:34 2017 +0300
>
>     ath10k: add per chain RSSI reporting
>
> Thanks,
> Brian
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
