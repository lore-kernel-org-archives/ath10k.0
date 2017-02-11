Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ccdV5-0000iW-Sp
 for ath10k@lists.infradead.org; Sat, 11 Feb 2017 19:38:31 +0000
Subject: Re: VHT 160Mhz and nss related config.
References: <0082a9e3-83f3-9bc3-af43-b890b91cfd93@candelatech.com>
 <e71fe0b1-4482-b80b-2624-240b154ff980@dd-wrt.com>
 <CAJ-VmokKafmamWJJ0-=PJ_oNBejbqcHbd8NO7-M9=Z6DFRuhzw@mail.gmail.com>
 <589F50B8.4020609@candelatech.com>
 <bbf485eb-f3aa-f49b-8401-03632bc70a7f@dd-wrt.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <02b7f70a-7da2-f2e4-8904-bdffc3ca90a1@candelatech.com>
Date: Sat, 11 Feb 2017 11:38:06 -0800
MIME-Version: 1.0
In-Reply-To: <bbf485eb-f3aa-f49b-8401-03632bc70a7f@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Adrian Chadd <adrian@freebsd.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 02/11/2017 10:21 AM, Sebastian Gottschall wrote:
> Am 11.02.2017 um 18:58 schrieb Ben Greear:
>> On 02/10/2017 08:37 PM, Adrian Chadd wrote:
>>> On 10 February 2017 at 20:22, Sebastian Gottschall
>>> <s.gottschall@dd-wrt.com> wrote:
>>>> i really can't believe this. if this is true the  160 mhz mode would not
>>>> make any sense.
>>>> the maximum tx / rx rate for 4x4 vht80 and 2x2 vht160 is identical. so
>>>> vht160 would not increase performance in any way
>>>
>>> Well, if it can also do 2x2 MU-MIMO at 160MHz then it can be a
>>> perfectly fine STA to a 4x4 160MHz MU-MIMO chip that can actually
>>> transmit 2x2 rates to different MU-MIMO peers.
>>>
>>> That's the outstanding question I have - is it like, 2x2 MU only, or
>>> is it say, 2 concurrently different spatial stream 2x2 MU? Ie, can you
>>> have 2 peers, different VHT spatial groups (or 4 peers, 1 spatial
>>> group each) all going at the same time?
>>>
>>> I'm .. not even sure how you're supposed to cleanly negotiate that you
>>> can do 4NSS in VHT80 but 2NSS in VHT160 to a peer... that only makes
>>> sense if you're doing lots of 1NSS and 2NSS MU-MIMO peers..
>>
>> I think using the max-rx-rate logic might could imply this, but I am not sure
>> many drivers fill this out properly.
>>
>> Looks like a mess waiting to happen to me.
>>
>> Even if you can do 1x1 160Mhz MU-MIMO to two stations, and I am not certain you
>> can since in 80Mhz you can only do a 1x1 and a 2x2 (not two 2x2).
>>
>> So, from what I know currently, 80+80 is not that useful on the 9984 NIC...
> never tried 80+80 since i need to enhance the channel logic alot in my firmware code to handle it. would be great enough if vht160 would work as expected and
> i'm not sure right now if it really works, even if the interface initialized correctly it assocs only with vht80

160Mhz is really implemented as 80+80 internally it seems, so what I meant is that
160Mhz or 80+80 both have the 2x2 restriction.

Stock ath10k driver doesn't set the rxnss_override, so the chip will always be forced
to send 1x1 at 160Mhz, so even if it associates and works at all, it will probably not put
many 160Mhz frames on air since the rate-ctrl should choose 3x3 or 4x4 80Mhz as faster speeds.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
