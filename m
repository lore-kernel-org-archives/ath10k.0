Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRO6I-0004Jn-9J
 for ath10k@lists.infradead.org; Thu, 04 Feb 2016 17:53:51 +0000
Received: by mail-wm0-x241.google.com with SMTP id r129so13243863wmr.0
 for <ath10k@lists.infradead.org>; Thu, 04 Feb 2016 09:53:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACiydbLBuzj0ZhF8MuCbdMQUWhnOV9t62dqV9S_RpdO9DTRZFA@mail.gmail.com>
References: <1444654626-3290-1-git-send-email-rmanohar@qti.qualcomm.com>
 <CACiydbLcjNGdpc+dtBFCTAUrC0RtEhtxoxf3+XhXk24soX_qQg@mail.gmail.com>
 <1454221875643.60351@qti.qualcomm.com>
 <CACiydbLk5=EH8Nz=FnL+B3itfXiRLbLUARg4ovWe7okLsZzyRQ@mail.gmail.com>
 <1454250192327.17956@qti.qualcomm.com>
 <CACiydbK4CY3XTqy=aXPqb-5K3Df3T6ZtSoND213uHQnfhk8ZqQ@mail.gmail.com>
 <CACiydbLBuzj0ZhF8MuCbdMQUWhnOV9t62dqV9S_RpdO9DTRZFA@mail.gmail.com>
Date: Thu, 4 Feb 2016 19:53:28 +0200
Message-ID: <CACiydb+pvtw4M_bvKmFZPMzk60STh+uTSC-BokQ0HTEKO5esRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] ath10k: add copy engine fast path support
From: Roman Yeryomin <leroi.lists@gmail.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 1 February 2016 at 14:35, Roman Yeryomin <leroi.lists@gmail.com> wrote:
> On 1 February 2016 at 11:54, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>> On 31 January 2016 at 16:23, Manoharan, Rajkumar
>> <rmanohar@qti.qualcomm.com> wrote:
>>>>On 31 January 2016 at 08:31, Manoharan, Rajkumar
>>>><rmanohar@qti.qualcomm.com> wrote:
>>>>>>> Below patchset adds fast path support for uplink traffic by bypassing
>>>>>>> HTC layer processing. This is enabled by making use of unused copy
>>>>>>> engine 5 to receive HTT messages directly from HIF layer. From initial
>>>>>>> validation in VHT80/5G mode TCP UL is improved to 900Mbps from ~840Mbps
>>>>>>> in conducted test.
>>>>>>>
>>>>>>
>>>>>>Hi Rajkumar,
>>>>>>
>>>>>>I'm very curious what hardware did you use to do the tests?
>>>>>>Because with Dragonfly+Peregrine 3x3 I'm able to get only ~550Mbps :(
>>>>>>
>>>>>
>>>>> Roman,
>>>>>
>>>>> It is verified in AP148 platform which IPQ8064 (1.4GHz dual core) platform.
>>>>> Throughput will be lower in low end systems like AP135 (unicore processor).
>>>>
>>>> OK, but QSDK built with proprietary driver can reach 800Mbps at least.
>>>> 900/800 Mbps difference is fine (ethernet software bridging is >900,
>>>> e.g.) but 900/550 Mbps difference is not fine, there must be something
>>>> ath10k is not doing or doing in a wrong way.
>>>
>>> While ago, Michal did an experiments to improve performance by offloading
>>> encap/decap to firmware. Can you try with below patch set? I hope there might
>>> be some conflicts since the change is outdated. Please make sure to enable
>>> CONFIG_ATH10K_802_3_FORMAT switch.
>>>
>>> http://lists.infradead.org/pipermail/ath10k/2014-December/003935.html
>>>
>>> In one of my experiments, replacing netif_receive_skb to netif_rx in mac80211/rx.c
>>> had improved rx performance in AP135. I dont have data right now. Can you give a try?
>>
>> After quick testing with 2x2 system I didn't see any significant improvement.
>> Will test on 3x3 little bit later.
>
> 3x3 didn't perform better either. That's with 4.4 and backports from 2016-01-10.
> One weird thing I see is about 15% idle cpu.
> Any ideas?

Looks like one of the bottlenecks was in rx ring size of ethernet
driver. There is a switch (on ap152) and it looks like it gives large
bursts of packets which SoC's gmac cannot handle with short rx rings
and (relatively) slow wifi tx path.
Now I can get 700Mbps with 3x3 and still see up to 5% cpu idle. Much
better but not as good as proprietary driver.
Any ideas how to improve it further?

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
