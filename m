Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQZEW-0007I6-SH
 for ath10k@lists.infradead.org; Wed, 25 Feb 2015 10:30:25 +0000
Received: by wggy19 with SMTP id y19so2628460wgg.13
 for <ath10k@lists.infradead.org>; Wed, 25 Feb 2015 02:30:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54ED577A.8030003@candelatech.com>
References: <54ECB852.3030208@candelatech.com>
 <54ECD482.3060003@candelatech.com>
 <CAEFj986Z80bBioVC4Ao77ZskGGdZQA5WgdBgEzVoY4f8OBAJRQ@mail.gmail.com>
 <54ED577A.8030003@candelatech.com>
Date: Wed, 25 Feb 2015 18:30:01 +0800
Message-ID: <CAEFj9871qXhsVn1XmhGs6qSpcVWVjk+B-CMp1zJzf5uqyzKCUQ@mail.gmail.com>
Subject: Re: Any idea why we cannot disable /b rates?
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Wed, Feb 25, 2015 at 1:02 PM, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 02/24/2015 06:45 PM, Yeoh Chun-Yeow wrote:
>>
>> On Wed, Feb 25, 2015 at 3:44 AM, Ben Greear <greearb@candelatech.com>
>> wrote:
>>>
>>> Ok, so I found the problem.  Appears that the firmware uses two different
>>> fixed rate-ctrl settings, one for non-data (bcast, mgt-frames, etc) and
>>> another
>>> for data frames.  The non-data one was not being set when user configured
>>> fixed rates, so beacons went out at 1Mbps.
>>>
>>> I updated CT firmware (beta-14) to set both data and non-data to the same
>>> value when the driver specifies the rates...  Seems to work...any idea
>>> if this is a bad idea in practice?
>>
>>
>> Rate control is applicable to unicast frame whether it is
>> management/data. Broadcast/Multicast rate is required for
>> management/data (usually the lowest transmission rate 5GHz is 6Mbps).
>>
>> So it is more sensible if we can configure the broadcast/multicast
>> rate and also disable the rate control for unicast frame by using
>> fixed rate.
>
>
> User-space API doesn't give the ability to set different fixed rates for
> different packet types, as far as I know.
>
> So, the current firmware just ignores the fixed rate for management and
> broadcast
> frames.
>
> My firmware change makes the fixed rate apply equally to all types of
> frames.
>
> Should I make my change optional for mgt/bcast , or should it always set
> mgt/bcast rates to the
> same fixed rates as data packets use?

In iw, we have the following:
dev <devname> set mcast_rate <rate in Mbps>
dev <devname> set bitrates [legacy-<2.4|5> <legacy rate in Mbps>*]
[mcs-<2.4|5> <MCS index>*]

mcast-rate should be something set for broadcast/multicast frame
including the management and data frame. This allows us to have in
example beacon frame to be transmitted with higher rate from 1Mbps at
2.4GHz and 6Mbps at 5GHz.

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
