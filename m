Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVU3f-0001qC-HF
 for ath10k@lists.infradead.org; Tue, 10 Mar 2015 23:59:32 +0000
Message-ID: <54FF854D.2020101@candelatech.com>
Date: Tue, 10 Mar 2015 16:59:09 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Any idea why we cannot disable /b rates?
References: <54ECB852.3030208@candelatech.com>
 <54ECD482.3060003@candelatech.com>
 <CAEFj986Z80bBioVC4Ao77ZskGGdZQA5WgdBgEzVoY4f8OBAJRQ@mail.gmail.com>
 <54ED577A.8030003@candelatech.com>
 <CAEFj9871qXhsVn1XmhGs6qSpcVWVjk+B-CMp1zJzf5uqyzKCUQ@mail.gmail.com>
 <54EE59F1.20805@candelatech.com>
In-Reply-To: <54EE59F1.20805@candelatech.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/25/2015 03:25 PM, Ben Greear wrote:
> On 02/25/2015 02:30 AM, Yeoh Chun-Yeow wrote:
>> On Wed, Feb 25, 2015 at 1:02 PM, Ben Greear <greearb@candelatech.com> wrote:
>>>
>>>
>>> On 02/24/2015 06:45 PM, Yeoh Chun-Yeow wrote:
>>>>
>>>> On Wed, Feb 25, 2015 at 3:44 AM, Ben Greear <greearb@candelatech.com>
>>>> wrote:
>>>>>
>>>>> Ok, so I found the problem.  Appears that the firmware uses two different
>>>>> fixed rate-ctrl settings, one for non-data (bcast, mgt-frames, etc) and
>>>>> another
>>>>> for data frames.  The non-data one was not being set when user configured
>>>>> fixed rates, so beacons went out at 1Mbps.
>>>>>
>>>>> I updated CT firmware (beta-14) to set both data and non-data to the same
>>>>> value when the driver specifies the rates...  Seems to work...any idea
>>>>> if this is a bad idea in practice?
>>>>
>>>>
>>>> Rate control is applicable to unicast frame whether it is
>>>> management/data. Broadcast/Multicast rate is required for
>>>> management/data (usually the lowest transmission rate 5GHz is 6Mbps).
>>>>
>>>> So it is more sensible if we can configure the broadcast/multicast
>>>> rate and also disable the rate control for unicast frame by using
>>>> fixed rate.
>>>
>>>
>>> User-space API doesn't give the ability to set different fixed rates for
>>> different packet types, as far as I know.
>>>
>>> So, the current firmware just ignores the fixed rate for management and
>>> broadcast
>>> frames.
>>>
>>> My firmware change makes the fixed rate apply equally to all types of
>>> frames.
>>>
>>> Should I make my change optional for mgt/bcast , or should it always set
>>> mgt/bcast rates to the
>>> same fixed rates as data packets use?
>>
>> In iw, we have the following:
>> dev <devname> set mcast_rate <rate in Mbps>
>> dev <devname> set bitrates [legacy-<2.4|5> <legacy rate in Mbps>*]
>> [mcs-<2.4|5> <MCS index>*]
>>
>> mcast-rate should be something set for broadcast/multicast frame
>> including the management and data frame. This allows us to have in
>> example beacon frame to be transmitted with higher rate from 1Mbps at
>> 2.4GHz and 6Mbps at 5GHz.
> 
> Thanks...I'll try to figure out how to work this into my firmware.  But, it will
> require driver changes specific to my firmware as far as I can tell,
> so it will never make it upstream...

From what I can tell, you can only set mcast rates on IBSS and mesh interfaces,
so my firmware changes will probably remain the only way to do this until someone
adds support to the mac80211 stack and driver.  The good news
is that my firmware change no driver changes, so it should work with upstream
kernels.

I have uploaded another beta firmware that also fixes the rate for mcast/broadcast traffic
(which was not properly being set when trying to set the rate with iw previously).

To set HT rates, you need my 'iw' patch I posted earlier to linux-wireless...and which
may be found here:

https://github.com/greearb/iw-ct

See release notes and binaries here:

http://www.candelatech.com/downloads/ath10k-fw-beta/

Thanks,
Ben

> 
> Thanks,
> Ben
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
