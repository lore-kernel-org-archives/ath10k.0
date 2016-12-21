Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJgpz-00051h-UR
 for ath10k@lists.infradead.org; Wed, 21 Dec 2016 13:21:44 +0000
Message-ID: <585A81BC.1040908@candelatech.com>
Date: Wed, 21 Dec 2016 05:21:00 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Can the ath10k driver support more than one MAC address?
References: <CAJ-VmonG3p2K69kjcLscRgWsOEQhyzj4_3c_aGhK=fXcZqXB=g@mail.gmail.com>
In-Reply-To: <CAJ-VmonG3p2K69kjcLscRgWsOEQhyzj4_3c_aGhK=fXcZqXB=g@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>, Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "Gordon, Charles" <Charles.Gordon@digi.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yeah, seems to work fine for me with CT firmware.

It can probably work OK with stock FW too.

Thanks,
Ben

On 12/21/2016 12:29 AM, Adrian Chadd wrote:
> hiya,
>
> This is the kind of thing that Ben Greear has spent a lot of time
> debugging in his firmware branch.
>
>
> -adrian
>
>
> On 21 December 2016 at 00:18, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
>> On 20 December 2016 at 23:35, Gordon, Charles <Charles.Gordon@digi.com> wrote:
>>> Hi,
>>>
>>> We are trying to use the ath10k driver in an embedded application.  We want to support a wifi client with multiple access points.  Does the ath10k driver support this?  Can the ath10k hardware and driver support multiple simultaneous MAC addresses?  Can it support multiple APs?
>>>
>> iw wlan0 interface add wlan0_1 type managed
>> ifconfig wlan0_1 hw ether <new_mac>
>>
>> Depends on HW you have, some ath10k support single/multi channel concurrency.
>> You can check this using
>> iw phyX info - and next check valid combinations (channels <= 1 mean
>> SCC, so best if you have <= 2)
>>
>> BR
>> Janusz
>>
>>> Thanks for any information.
>>>
>>> Charles
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
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
