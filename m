Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YiVE9-0005MU-Oh
 for ath10k@lists.infradead.org; Wed, 15 Apr 2015 21:52:10 +0000
Message-ID: <552EDD71.2070207@candelatech.com>
Date: Wed, 15 Apr 2015 14:51:45 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: CT ath10k firmware now supports IBSS + RSN
References: <55285D8D.6070703@candelatech.com>	<552BFFB8.6030301@candelatech.com>	<552C5AE9.4050304@candelatech.com>
 <CA+BoTQ=C0xxDifiiQVbyBe=OHYUjzHcu49mULJpU+=2SNCZ-dQ@mail.gmail.com>
 <552D2BD5.7050204@candelatech.com>
In-Reply-To: <552D2BD5.7050204@candelatech.com>
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
Cc: "hostap@lists.shmoo.com" <hostap@lists.shmoo.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

I have uploaded a new firmware.

http://www.candelatech.com/downloads/ath10k-fw-beta/

It fixes IBSS blockack (firmware was mis-configuring the BSSID, so
blockacks were sent to wrong BSS address and were not processed when
received).

I also disabled AMSDU for IBSS stations, which significantly improves
performance in my ath10k <-> ath10k IBSS test.  I do not know why this
is needed.

There is still a bug:  I cannot get ath10k <-> ath10k to do IBSS + RSN.

I can get ath9k <-> ath10k IBSS + RSN to work,
and open IBSS ath10k <-> ath10k works.

I am taking a break on IBSS + RSN for a while.

Thanks,
Ben




On 04/14/2015 08:01 AM, Ben Greear wrote:
> 
> 
> On 04/13/2015 10:34 PM, Michal Kazior wrote:
>> On 14 April 2015 at 02:10, Ben Greear <greearb@candelatech.com> wrote:
>>> On 04/13/2015 10:41 AM, Ben Greear wrote:
>>>> Looks like I have some more work to do.  For any moderately large frames,
>>>> I am now dropping the last 16 bytes.  Looks like the skb_put_padto logic
>>>> was working around a more serious issue...
>>>
>>> A better-tested version of kernel and firmware is uploaded now.
>>>
>>> Looks like I needed to add a hack to firmware to bump pkt-size by
>>> 16 for IBSS + RSN encrypted frames.  Not sure exactly why, but seems
>>> to work in light testing.
>>>
>>> I removed the skb-padto hack from the kernel, and kernel is rebased on
>>> top of official 4.0 now.
>>
>> Hmm.. Maybe this is related to MMIC. Maybe frame fragment length must
>> be different from frame length (ath10k_htt_tx(),
>> htt_data_tx_desc_frag)? Perhaps a similar hack as with RAW txmode[1]
>> needs to be applied..?
>>
>>
>> [1]: https://www.mail-archive.com/ath10k@lists.infradead.org/msg00241.html
> 
> This IBSS+RSN hack could be done in the kernel, but if my firmware is the only thing that
> needs it, then it is more convenient for me to hack firmware than have it
> incompatible with upstream drivers.
> 
> If you do find similar problems with other firmware, then certainly a driver
> patch is welcome, and I will back out my firmware hack accordingly.
> 
> And, it would be nice if someone put some version if your raw-tx patch upstream.
> I can also adjust length for raw pkts in firmware too, but again, in many cases
> it is better to be similarly broken to existing firmware than to be technically
> correct but break compatibility with the driver.  If I ever get a 'ct-firmware'
> feature flag upstream, then we could of course do the changes to take advantage
> of my firmwares differences as needed.
> 
> Thanks,
> Ben
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
