Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSAp5-0001ku-JH
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 19:46:16 +0000
Received: by mail-la0-f41.google.com with SMTP id gl10so4128061lab.0
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 12:45:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <532C79DB.7010505@candelatech.com>
References: <5329CD60.6080609@candelatech.com>
 <87txatfkad.fsf@kamboji.qca.qualcomm.com>
 <532B104A.7060302@candelatech.com>
 <CAJ-VmokQXgWa1Pi-YBXM1NPfZDF8F=yvWh1w4DTgpJcEq_JfxQ@mail.gmail.com>
 <532B4017.7060803@candelatech.com>
 <CALhHN=quKPAWmgeLHZEBX7u=KDASVVUjVA8E_aD5_rsRzeFB=Q@mail.gmail.com>
 <CALhHN=qYuOY8v__HX3=Y7CeZseC7GA5-epfj+zQXcruG6R2BAA@mail.gmail.com>
 <532C79DB.7010505@candelatech.com>
Date: Mon, 24 Mar 2014 20:45:53 +0100
Message-ID: <CALhHN=qWiBaU6WLR6kMZwmxw_dm4F0yOJ34wYb-Opihin_AXjA@mail.gmail.com>
Subject: Re: Trouble connecting to broadcom AC APs?
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: Adrian Chadd <adrian@freebsd.org>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

On 21 March 2014 18:41, Ben Greear <greearb@candelatech.com> wrote:
> On 03/21/2014 12:07 AM, Janusz Dziedzic wrote:
>> On 21 March 2014 07:01, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
>>> On 20 March 2014 20:23, Ben Greear <greearb@candelatech.com> wrote:
>>>> On 03/20/2014 12:17 PM, Adrian Chadd wrote:
>>>>> Did the per-rate transmit statistics ever make it into the firmware / driver?
>>>>>
>>>>> I'd start by looking at what rate(s) it's trying and what the transmit
>>>>> completion statistics say. It could be doing something exceedingly
>>>>> dumb like transmitting on an invalid rate or stream setup.
>>>>>
>>>>> Same deal with STBC/LDPC. Try disabling those; see what happens.
>>>>
>>>> It appears the packets get to the AP, and AP at least tries to
>>>> respond.
>>>>
>>>> If we bring up stations one at a time instead of multiple at once
>>>> it works better, and using ddwrt works better than stock firmware
>>>> on the AP too.
>>>>
>>>> Anyone know how well monitor mode works on ath10k?  Would be nice
>>>> to see what is actually on the air.
>>>>
>>> With AP firmware, works fine. Could you send airlogs?
>>>
>> BTW, I have same problem with WRT54G and orginal linksys SW - my home router.
>> Problem disappears when will use FW 636 :)
>> So, seems AP (389, 467) FW is not the best choice for STA mode.
>> I suspect PS problem here - but didn't check this yet ...
>
> Here is another data point...if we make br0 on the AP promisc,
> then suddenly it works fine.
>
> (we noticed this because starting tcpdump on br0 also
> 'fixes' the problem).
>

In my case:

ath10k: ath10k_peer_assoc_h_crypto: rsn ie found
ath10k: ath10k_peer_assoc_h_crypto: wpa ie found
ath10k: mac peer 00:14:bf:16:b8:44 phymode 11g

Next tx don't work because, FW discard this packets for some reason
(at least broadcast), I see a lot of:
ath10k: htt tx completion msdu_id 0 discard 1 no_ack 0

while with 636 firmware
ath10k: htt tx completion msdu_id 0 discard 0 no_ack 0

So, could be quite different issue you have. I will check switch to
CCMP only while now there is TKIP/CCMP.

BR
Jansuz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
