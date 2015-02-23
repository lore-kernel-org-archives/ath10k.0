Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YPwcr-000161-9X
 for ath10k@lists.infradead.org; Mon, 23 Feb 2015 17:16:57 +0000
Message-ID: <54EB6073.5000105@candelatech.com>
Date: Mon, 23 Feb 2015 09:16:35 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Sending frames on monitor interface?
References: <54E657C0.6080402@candelatech.com>
 <CA+BoTQn=oZ6g4J4gDNs2pnNYg4ifkhNh5S1iYS35VurnZzMTDQ@mail.gmail.com>
 <54E76E95.6070003@candelatech.com>
 <CA+BoTQ=sRtXhDqQMRPBKhFc4iMrqtDFsXACCv0VuRv5JevQwgg@mail.gmail.com>
In-Reply-To: <CA+BoTQ=sRtXhDqQMRPBKhFc4iMrqtDFsXACCv0VuRv5JevQwgg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/22/2015 10:37 PM, Michal Kazior wrote:
> On 20 February 2015 at 18:27, Ben Greear <greearb@candelatech.com> wrote:
>> On 02/19/2015 10:43 PM, Michal Kazior wrote:
>>> On 19 February 2015 at 22:38, Ben Greear <greearb@candelatech.com> wrote:
>>>> Do any of the firmware versions support sending (raw) frames on
>>>> the monitor interface?
>>>>
>>>> It seems 10.1 just asserts if someone tries this.  I can fix at least
>>>> some of this, but firmware seems to want a peer in order to transmit
>>>> any packets...maybe adding self-peer to the monitor interface is
>>>> a way to get around this?
>>>
>>> Just an idea: Once upon a time we had to create temporary DA peer for
>>> offchannel tx (the code is still in ath10k). 10.1 might want something
>>> like that as well for data frames.
>>
>> I hacked my CT firwmare to allow transmit on monitor interfaces, including
>> logic to allow setting up a (fake) peer and rate-ctrl structures.
>>
>> I tweaked ath10k to create a peer when starting the monitor interface,
>> using the local radio's MAC as the peer address (this could easily be part
>> of the problem).  I hacked the firmware to always use this peer object when
>> transmitting on a monitor interface.
>>
>> Packets now appear to be accepted for transmit, but I do not see anything on
>> the air.  I'll dig into it more if I find time...but not sure exactly how useful
>> the feature is anyway.
> 
> Are these frames tx completed by firmware or are they stuck in
> firmware? Are you transmitting nwifi or raw? Did you try my old RFC
> patch[1] for raw tx?
> 
> [1]: https://www.mail-archive.com/ath10k@lists.infradead.org/msg00241.html

I hacked my firmware to treat frames as RAW if they were from a monitor interface.
I did not adjust the offsets as you did in your patch, but I expected to at least
see some sort of garbage on the air even if offsets were wrong.

I haven't looked at tx-completion.

> Also be aware what frames you're injecting. 10.1 doesn't allow mgmt
> frames to go through HTT (in case you're trying to force them through
> HTT instead of WMI).

I was just using 'packetspammer'.  I didn't look into what exactly it
was sending.

>> I see the code for off-channel work that you are talking about.  That seems like
>> a pretty awful hack if you wanted to do any realistic throughput, but I bet that
>> whatever issue this works around is the same issue that I am having trying to
>> get monitor TX to work.
> 
> This was mainly for P2P discovery/provision so throughput was not a concern.

Understood..but if that is what it takes to make the firmware send a frame to
an arbitrary destination, then that will not work for general purpose raw frame
transmit I think.

I think I might revisit this feature if/when I can get access to newer upstream
firmware source..maybe something that can do mgt over HTT.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
