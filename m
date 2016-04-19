Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asXgj-0001NG-JW
 for ath10k@lists.infradead.org; Tue, 19 Apr 2016 15:35:43 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: ath10k performance, master branch from 20160407
Date: Tue, 19 Apr 2016 15:35:16 +0000
Message-ID: <87k2jtk3wt.fsf@kamboji.qca.qualcomm.com>
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
In-Reply-To: <CA+BoTQmn_hS1X1BjC7=wmevnAGiPx7iit0NMUxnmmqjFZ_RnVA@mail.gmail.com>	(Michal
 Kazior's message of "Tue, 19 Apr 2016 09:43:31 +0200")
Content-Language: en-US
Content-ID: <217694A695739F4A90C78049F6126C77@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: Roman Yeryomin <leroi.lists@gmail.com>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 19 April 2016 at 09:31, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>> On 19 April 2016 at 08:28, Michal Kazior <michal.kazior@tieto.com> wrote:
>>
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

But we should never go backwards and TCP dropping from 750 Mbps to ~550
Mbps is a huge drop, so this is not ok. We have to do something to fix
this, be it reverting the wake_tx_queue support, somehow disabling it by
default or something.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
