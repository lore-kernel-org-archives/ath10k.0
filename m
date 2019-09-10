Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i7grm-0007GB-6w
 for ath10k@lists.infradead.org; Tue, 10 Sep 2019 14:11:35 +0000
Subject: Re: [PATCH] ath10k: restore QCA9880-AR1A (v1) detection
References: <20190906215423.23589-1-chunkeey@gmail.com>
 <20190907214359.1C52A21835@mail.kernel.org>
 <CAKR_QVKv8kgXSSCwd8esw28hARA61Pah3usRi+ZZG6ss2CcS=g@mail.gmail.com>
 <87h85kfwfn.fsf@codeaurora.org>
 <CAKR_QVJpGZCBaE3hW6FShykYa=T6hy2dHn22daQVodWGL_-Afw@mail.gmail.com>
 <a1cf238e-ee80-ee81-f7a6-28faff3a35a6@newmedia-net.de>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <a599bf9a-44ad-2d70-79dc-324e8dbeb1cd@candelatech.com>
Date: Tue, 10 Sep 2019 07:11:32 -0700
MIME-Version: 1.0
In-Reply-To: <a1cf238e-ee80-ee81-f7a6-28faff3a35a6@newmedia-net.de>
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>, ath10k@lists.infradead.org



On 09/10/2019 06:51 AM, Sebastian Gottschall wrote:
> the tplink archer c7 v1 indeed has this hw 1 version. but thats the only device i know comming with this chipset version
> but the v1 has also a minipcie slot and is not soldered like all other revisions.  so i just replaced the card on my test device.
> in addition we may ask ben grear if he is able to provide a v1 firmware from his ct tree since the qca sourcecodes do contain support
> for the v1 revision. but dont expect too much. there was a reason why v1 was never really on the market

Hello,

I don't think I can even build a v1 firmware if I wanted to, and I'd much rather work on newer
chips.  That v1 was an unstable wreck from the beginning, at least with open-source driver.

Thanks,
Ben

>
> Am 10.09.2019 um 14:59 schrieb Tom Psyborg:
>> On 10/09/2019, Kalle Valo <kvalo@codeaurora.org> wrote:
>>> (dropping stable list)
>>>
>>> Tom Psyborg <pozega.tomislav@gmail.com> writes:
>>>
>>>> According to this very old post
>>>> http://lists.infradead.org/pipermail/ath10k/2013-July/000021.html
>>>> seems like you've been misinformed on amount of these cards that were
>>>> put out in the market.
>>>>
>>>> At least digipart only have >40000 units in stocks
>>>> https://www.digipart.com/part/QCA9880-AR1A and other retailers
>>>> probably few thousands more.
>>>>
>>>> With that large amount of cards I think it is justified to request
>>>> firmware support for the chip. And probably a lot easier to make few
>>>> firmware modifications than go hacking a bunch of API calls so it
>>>> works with v2 firmware.
>>> I'm very surprised that QCA9880 hw1.0 boards are still available, after
>>> six years. Did you confirm that it really is hw1.0 and not just some
>>> mixup with hardware ids or something like that?
>> Print on the chip clearly says QCA9880-AR1A. ID same as for v2 - 003C.
>>
>>> old hw1.0 firmware to see if it works.
>> I don't know which fw blob version that is. I could not find it
>> online. All files are v2 related.
>>
>>> But if it's really is hw1.0 I doubt there will be any support for that.
>>> I recommend to avoid hw1.0 altogether.
>>>
>>> --
>>> Kalle Valo
>>>
>> That would be too bad, even worse when you find out that
>> qca-wifi-10.2.4.58.1 driver fails to load firmware too. The only one
>> that works is qca-wifi that comes with tp-link firmware, some very
>> early version 10.0.108 or somtehing like that that has no available
>> sources..
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
