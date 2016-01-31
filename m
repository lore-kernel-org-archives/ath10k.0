Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPvfz-0004MC-Cy
 for ath10k@lists.infradead.org; Sun, 31 Jan 2016 17:20:40 +0000
Received: by mail-wm0-x242.google.com with SMTP id l66so5601694wml.2
 for <ath10k@lists.infradead.org>; Sun, 31 Jan 2016 09:20:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1454250192327.17956@qti.qualcomm.com>
References: <1444654626-3290-1-git-send-email-rmanohar@qti.qualcomm.com>
 <CACiydbLcjNGdpc+dtBFCTAUrC0RtEhtxoxf3+XhXk24soX_qQg@mail.gmail.com>
 <1454221875643.60351@qti.qualcomm.com>
 <CACiydbLk5=EH8Nz=FnL+B3itfXiRLbLUARg4ovWe7okLsZzyRQ@mail.gmail.com>
 <1454250192327.17956@qti.qualcomm.com>
Date: Sun, 31 Jan 2016 19:20:17 +0200
Message-ID: <CACiydbJQz5Ve5_2cv7h2ycvsQds=4MXGQYTR8ECt=iFajwjh3w@mail.gmail.com>
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

On 31 January 2016 at 16:23, Manoharan, Rajkumar
<rmanohar@qti.qualcomm.com> wrote:
>>On 31 January 2016 at 08:31, Manoharan, Rajkumar
>><rmanohar@qti.qualcomm.com> wrote:
>>>>> Below patchset adds fast path support for uplink traffic by bypassing
>>>>> HTC layer processing. This is enabled by making use of unused copy
>>>>> engine 5 to receive HTT messages directly from HIF layer. From initial
>>>>> validation in VHT80/5G mode TCP UL is improved to 900Mbps from ~840Mbps
>>>>> in conducted test.
>>>>>
>>>>
>>>>Hi Rajkumar,
>>>>
>>>>I'm very curious what hardware did you use to do the tests?
>>>>Because with Dragonfly+Peregrine 3x3 I'm able to get only ~550Mbps :(
>>>>
>>>
>>> Roman,
>>>
>>> It is verified in AP148 platform which IPQ8064 (1.4GHz dual core) platform.
>>> Throughput will be lower in low end systems like AP135 (unicore processor).
>>
>> OK, but QSDK built with proprietary driver can reach 800Mbps at least.
>> 900/800 Mbps difference is fine (ethernet software bridging is >900,
>> e.g.) but 900/550 Mbps difference is not fine, there must be something
>> ath10k is not doing or doing in a wrong way.
>
> While ago, Michal did an experiments to improve performance by offloading
> encap/decap to firmware. Can you try with below patch set? I hope there might
> be some conflicts since the change is outdated. Please make sure to enable
> CONFIG_ATH10K_802_3_FORMAT switch.
>
> http://lists.infradead.org/pipermail/ath10k/2014-December/003935.html
>
> In one of my experiments, replacing netif_receive_skb to netif_rx in mac80211/rx.c
> had improved rx performance in AP135. I dont have data right now. Can you give a try?
>

In case of AP (and not wifi-to-wifi traffic), RX performance (upload
for client) is not so important as TX (download). But good to know...
Patches seem to be fairly simple, will try tomorrow and come back with results.

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
