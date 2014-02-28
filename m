Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJSrw-0001xt-Bb
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 19:13:13 +0000
Message-ID: <5310DFB1.902@candelatech.com>
Date: Fri, 28 Feb 2014 11:12:49 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Need to get msdu-chaining working.
References: <530E7AF2.1080908@candelatech.com>
 <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
 <530FE3EA.4040602@candelatech.com>
 <CA+BoTQm7fE5w7XYao8NmYrwj7qR-EasjQCAMGC0MS==y29aaHw@mail.gmail.com>
In-Reply-To: <CA+BoTQm7fE5w7XYao8NmYrwj7qR-EasjQCAMGC0MS==y29aaHw@mail.gmail.com>
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

On 02/27/2014 11:41 PM, Michal Kazior wrote:
> On 28 February 2014 02:18, Ben Greear <greearb@candelatech.com> wrote:
>> On 02/26/2014 10:51 PM, Michal Kazior wrote:
>>
>>> >From what I understand chained msdu is a msdu that hasn't fit into the
>>> rx buffer and is split across the popped amsdu list. I suspect only
>>> the first msdu in chain has the htt_rx_desc and all other have not
>>> (this is what the current code does, but you'll need to verify that).
>>>
>>> I would try to concatenate all msdus into one (lots of memcpy :( ) or
>>> increase the HTT_RX_BUF_SIZE so that A-MSDU frames can fit into a
>>> single buffer (hopefully FW/HW is capable of doing that).
>>
>> I got this working, basically using memcpy approach.
>>
>> Throughput is comparable what I was seeing on stock firmware,
>> but I do notice an issue:
> 
> Doing memcpy() is pretty bad, though. It'll hurt you, sooner or later,
> or hurt other with less powerful host systems.
> 
> The problem is chained msdus suggest A-MSDU rx. This means you
> re-assemble the aggregate, just to pass it to mac80211 which splits
> the frame into 802.3 frames (again, memcpy). This can easily flush you
> d-cache.

That is interesting...maybe a better API would allow us to pass
a-msdu chains directly to mac80211?


>> The reported rx speed is almost always 6Mbps when I drive at high speeds.
>>
>> (At low speeds I see rx rate reported at 1.3Gbps most of the time.)
>>
>> I am pretty sure this is related to the msdu-chaining somehow.
>>
>> There are lots of FIXME's in the ath10k_htt_rx_amsdu_pop method.
>>
>> Any idea where the rx rate problem might lie?
> 
> Interesting. Rx rates are computed from the htt_rx_indication
> structure, not popped frames from rx ring. I'm guessing FW/HW doesn't
> fill in some stuff for raw rx at all. You probably can't do much about
> it if it's HW. You can probably hack your way around if it's just FW
> not copying some register values.

Ok, I'll go look at this in more detail.

I do see expected rates at lower speeds (where a-msdu does not happen),
so it's not *just* a problem with raw rx mode.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
