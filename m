Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5Uq3-0003uB-5Z
 for ath10k@lists.infradead.org; Tue, 11 Aug 2020 14:01:16 +0000
Subject: Re: WMM not working for mcast packets on ath10k
References: <CANczwAH=3UvKNnN3Zhkbdizi8vf0vUFkNNFEX-op0gr8Stj5LQ@mail.gmail.com>
 <7bdee5c8-c271-0902-510c-d8a41b7ec4b8@candelatech.com>
 <CANczwAH0TT9oeTjLem8cZo=eLAVimeJcDCDCuV4DeySUn4zxKg@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <6765404f-887d-d89e-af4a-6acca22be992@candelatech.com>
Date: Tue, 11 Aug 2020 07:01:12 -0700
MIME-Version: 1.0
In-Reply-To: <CANczwAH0TT9oeTjLem8cZo=eLAVimeJcDCDCuV4DeySUn4zxKg@mail.gmail.com>
Content-Language: en-MW
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
To: Ahmed Zaki <anzaki@gmail.com>
Cc: ath10k@lists.infradead.org

On 8/11/20 5:22 AM, Ahmed Zaki wrote:
> On Tue, 11 Aug 2020 at 01:05, Ben Greear <greearb@candelatech.com> wrote:
>>
>> On 8/10/20 3:08 PM, Ahmed Zaki wrote:
>>> Hello,
>>>
>>> I have 2 ath10k devices set in Mesh Point mode. When I use iptables'
>>> DSCP target to set the WMM AC for some traffic ports to VO, the rules
>>> work fine but only for unicast packets. All broadcast on the target
>>> UDP ports goes out as BE, and not VO.
>>>
>>> With some ath10k debugging enabled, it seems that the htt is indeed
>>> sending the tx descriptor with the correct tid (6) set.
>>>
>>> Is this the intended behavior for some reason? If not, is there any
>>> more debugging on the TX path that I can do?
>>
>> I don't think that WMM makes sense for bcast frames since they go out on
>> a special TID that does not do aggregation or per peer QoS settings.
> 
> I get that, but we want to give some WMM priority to bcast as they tend to have
> higher probability of loss under high network loads.
> 
> That special TID that you mentioned, is it set in the ath10k fw?
> Because I traced the
> htt and it is sending the intended tid in the txbuf flags, but bcast
> still come 0 (BE) on air.
> Or am I missing something in the driver?
> 
> Thanks again for help.

Maybe you can convert bcast to unicast in the driver/mac80211?  There are no retries
or proper rate-ctrl for bcast either, so I don't think you can get great performance
for bcast.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
