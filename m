Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ateUM-00035j-KT
 for ath10k@lists.infradead.org; Fri, 22 Apr 2016 17:03:31 +0000
Received: by mail-oi0-x22d.google.com with SMTP id x201so122563133oif.3
 for <ath10k@lists.infradead.org>; Fri, 22 Apr 2016 10:03:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmn_hS1X1BjC7=wmevnAGiPx7iit0NMUxnmmqjFZ_RnVA@mail.gmail.com>
References: <CACiydb+XMSfC262B6TzuZwx4W+LAbC7627uMKmiK9SjfuFpO4A@mail.gmail.com>
 <1460129643950.46282@qti.qualcomm.com>
 <CACiydbLHksfB68yOZq3SLuXEw-ucw5FnTDHq_un_Bpeah_5mZQ@mail.gmail.com>
 <ab762b501abc457aa1dbf965895eb113@aphydexm01b.ap.qualcomm.com>
 <CACiydbL3-QoC=muZf4aJOaUWZN-tpA3h1SwNfYU3+LnY_FHF+g@mail.gmail.com>
 <1460174525702.66744@qti.qualcomm.com>
 <CACiydbLh+X540MrnvS5MGm8Bd3QnnWmdFyon8H5khJiFtGK85w@mail.gmail.com>
 <1460905574286.42282@qti.qualcomm.com>
 <CACiydb+AaTc2wWzVeJNwPzA+PH9FcrqWzx3nW2RmKxaiaHwg-w@mail.gmail.com>
 <CACiydbKu8_1sO9K8uuY_SSL8ECvr3wZttt+72cNO9dc_7RRM2A@mail.gmail.com>
 <CA+BoTQndOpgYYZiZbenROV9+-WUHSbUugDDgCKGVe2fyA0efXQ@mail.gmail.com>
 <CACiydb+rPQW8_0bQE0maVt6cvbhxtH0ZuFeRNW2paupBaVT3vA@mail.gmail.com>
 <CA+BoTQmn_hS1X1BjC7=wmevnAGiPx7iit0NMUxnmmqjFZ_RnVA@mail.gmail.com>
Date: Fri, 22 Apr 2016 20:03:09 +0300
Message-ID: <CACiydb+f8z_WCZaLFg8vgvbsYm96kGODuY8mebwvWz4BjqhiZA@mail.gmail.com>
Subject: Re: ath10k performance, master branch from 20160407
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>

On 19 April 2016 at 10:43, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 19 April 2016 at 09:31, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>> On 19 April 2016 at 08:28, Michal Kazior <michal.kazior@tieto.com> wrote:
>>> On 18 April 2016 at 15:00, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>>>> So it looks like Michal's patch set "ath10k: implement push-pull tx
>>>> model" introduced this regression - after restoring it from reverts
>>>> fq_codel_drop is hungry again.
>>>> Any ideas how to fix?
>>>
>>> If my hunch is right there's no easy (and proper) fix for that now.
>>>
>>> One of the patchset patches (ath10k: implement wake_tx_queue) starts
>>> to use mac80211 software queuing. This introduces extra induced
>>> latency and I'm guessing it results in fill-in-then-drain sequences in
>>> some cases which end up being long enough to make fq_codel_drop more
>>> work than normal.
>>>
>>> This is required for other changes and MU-MIMO performance
>>> improvements so this patch can't be removed.
>>
>> But qca988x doesn't support MU-MIMO, AFAIK.
>
> Correct.
>
>
>> Can this be made chip dependent?
>
> I guess it could but it'd arguably make the driver more complex and
> harder to maintain. What we want is a long-term fix, not a short-term
> one.
>
> The long-term fix is a work-in-progress which aims at killing
> bufferbloat in general [1][2]. This should, by proxy, improve
> everything.
>
> [1]: https://www.spinics.net/lists/linux-wireless/msg149776.html
> [2]: https://www.spinics.net/lists/linux-wireless/msg148714.html
> [3]: https://www.spinics.net/lists/linux-wireless/msg149039.html
>
> You can try out patchset from [1] (and maybe [3] as well) to see if it
> helps you (assuming you have spare time to play around).

Will try.

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
