Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqUlW-00035Q-8Z
 for ath10k@lists.infradead.org; Thu, 07 May 2015 22:59:38 +0000
Message-ID: <554BEE44.1000704@candelatech.com>
Date: Thu, 07 May 2015 15:59:16 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: htt_rx questions in 4.0 kernel.
References: <55494598.2060603@candelatech.com>
 <CA+BoTQ=abKCtojv_dUngTx2UEWbjZnT4t6_DRT4PUX3fJqnHaQ@mail.gmail.com>
 <554A2B19.9000908@candelatech.com>
In-Reply-To: <554A2B19.9000908@candelatech.com>
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

On 05/06/2015 07:54 AM, Ben Greear wrote:
> 
> 
> On 05/05/2015 10:38 PM, Michal Kazior wrote:
>> On 6 May 2015 at 00:35, Ben Greear <greearb@candelatech.com> wrote:
>>> I am slowly tracking down problems with receiving data frames
>>> on 3.19 and higher kernels, when using my rx-sw-crypt patch
>>> and CT firmware.
>>>
>>> I think the main thing my patch is changing in this case is that
>>> the frames are received in raw mode with this patch enabled.
>>>
>>> Hard to do a bisect, because the rx logic changed so much and I
>>> have to apply fairly tricky patches to make my feature work, but
>>> 3.18 and earlier seem to work fine, and 3.19 and 4.0 does not.
>>>
>>> Latest clue appears to be that ARP frames are received fine (data
>>> contents looks right), but the stack fails the is_data() check.
>>>
>>> While poking at this further, I noticed that ath10k_htt_rx_h_undecap
>>> defines 'hdr' and assigns it, but never uses it.
>>
>> It does use it:
>>
>>   https://github.com/kvalo/ath/blob/master/drivers/net/wireless/ath/ath10k/htt_rx.c#L1028
>>   https://github.com/kvalo/ath/blob/master/drivers/net/wireless/ath/ath10k/htt_rx.c#L1034
>>   https://github.com/kvalo/ath/blob/master/drivers/net/wireless/ath/ath10k/htt_rx.c#L1039
> 
> I am talking about the ath10k_htt_rx_h_undecap() method.
> 
> 
>>
>>
>>> I also do not see the first_hdr used when decapping raw
>>> frames.
>>
>> `first_hdr` isn't necessary for raw frame processing. Let me explain why:
>>
>> When you receive A-MSDU you have two options: you either get it raw, or non-raw.
>>
>> When you get non-raw each subframe is delivered in a separate MSDU
>> buffer on HTT. Each contains an rx descriptor. However only first MSDU
>> in that list contains a complete decapped 802.11 header info. That's
>> why `first_hdr` is needed.
>>
>> When you get raw there's no MSDU-based splitting. If a raw frame
>> doesn't fit into a single HTT buffer you get chained MSDUs. In that
>> case only first buffer contains Rx descriptor. Others are just data
>> continuation and have no Rx descriptor.
>>
>> Ergo `first_hdr` doesn't make sense for raw as it is the `hdr` anyway.
>>
>>
>>> Maybe that is part of the problem?
>>
>> Hmm..
>>
>> Did you try to compare ARP hexdump when it is popped from HTT Rx ring
>> and when it is given to mac80211? Is the protected-bit set correctly?
>> Are Rx flags set correctly so mac80211 treats the frame properly?
>> Maybe the way you're hooking your swcrypto is not correct anymore,
>> i.e. there's an implicit assumption in your swcrypto logic which isn't
>> true anymore?
> 
> I see same problem with OPEN frames, no encryption needed, and from what I can
> tell, the driver receives the exact same ARP data that the sniffer sees
> (and which wireshark shows as legit).
> 
> Lots of frames work, but also many have a bit or two flipped in the first bit of the packet,
> and sometimes it gets into this state where it appears the header is invalid or maybe
> stale.
> 
> It seems when the stale header problem happens, the receiver stays stuck for often quite
> a while (many seconds), but then later it will start working again.
> 
> I'll keep debugging...

So, it looks like my problem is that I was passing frames with CRC errors up the
stack (and flagging them as not having CRC errors).

Looks like that can cause some fairly strange behaviour.

With that fixed (to properly flag pkts as having FCS errors), then it is running
much better.  The nice part is that I do not need to make any hacks to the rx
logic now...it 'just works'.  Only hack now is to configure my firmware properly
to disable any attempt at decrypting rx'd pkts (and put it into raw-rx mode).

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
