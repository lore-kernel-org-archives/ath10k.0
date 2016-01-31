Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPsuj-00023T-Nz
 for ath10k@lists.infradead.org; Sun, 31 Jan 2016 14:23:42 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH v2 0/7] ath10k: add copy engine fast path support
Date: Sun, 31 Jan 2016 14:23:12 +0000
Message-ID: <1454250192327.17956@qti.qualcomm.com>
References: <1444654626-3290-1-git-send-email-rmanohar@qti.qualcomm.com>
 <CACiydbLcjNGdpc+dtBFCTAUrC0RtEhtxoxf3+XhXk24soX_qQg@mail.gmail.com>
 <1454221875643.60351@qti.qualcomm.com>,
 <CACiydbLk5=EH8Nz=FnL+B3itfXiRLbLUARg4ovWe7okLsZzyRQ@mail.gmail.com>
In-Reply-To: <CACiydbLk5=EH8Nz=FnL+B3itfXiRLbLUARg4ovWe7okLsZzyRQ@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>On 31 January 2016 at 08:31, Manoharan, Rajkumar
><rmanohar@qti.qualcomm.com> wrote:
>>>> Below patchset adds fast path support for uplink traffic by bypassing
>>>> HTC layer processing. This is enabled by making use of unused copy
>>>> engine 5 to receive HTT messages directly from HIF layer. From initial
>>>> validation in VHT80/5G mode TCP UL is improved to 900Mbps from ~840Mbps
>>>> in conducted test.
>>>>
>>>
>>>Hi Rajkumar,
>>>
>>>I'm very curious what hardware did you use to do the tests?
>>>Because with Dragonfly+Peregrine 3x3 I'm able to get only ~550Mbps :(
>>>
>>
>> Roman,
>>
>> It is verified in AP148 platform which IPQ8064 (1.4GHz dual core) platform.
>> Throughput will be lower in low end systems like AP135 (unicore processor).
>
> OK, but QSDK built with proprietary driver can reach 800Mbps at least.
> 900/800 Mbps difference is fine (ethernet software bridging is >900,
> e.g.) but 900/550 Mbps difference is not fine, there must be something
> ath10k is not doing or doing in a wrong way.

While ago, Michal did an experiments to improve performance by offloading
encap/decap to firmware. Can you try with below patch set? I hope there might
be some conflicts since the change is outdated. Please make sure to enable
CONFIG_ATH10K_802_3_FORMAT switch.

http://lists.infradead.org/pipermail/ath10k/2014-December/003935.html

In one of my experiments, replacing netif_receive_skb to netif_rx in mac80211/rx.c
had improved rx performance in AP135. I dont have data right now. Can you give a try?

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
