Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asQ8Z-0000gB-Vb
 for ath10k@lists.infradead.org; Tue, 19 Apr 2016 07:31:56 +0000
Received: by mail-ob0-x235.google.com with SMTP id bg3so5052121obb.1
 for <ath10k@lists.infradead.org>; Tue, 19 Apr 2016 00:31:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQndOpgYYZiZbenROV9+-WUHSbUugDDgCKGVe2fyA0efXQ@mail.gmail.com>
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
Date: Tue, 19 Apr 2016 10:31:35 +0300
Message-ID: <CACiydb+rPQW8_0bQE0maVt6cvbhxtH0ZuFeRNW2paupBaVT3vA@mail.gmail.com>
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

On 19 April 2016 at 08:28, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 18 April 2016 at 15:00, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>> So it looks like Michal's patch set "ath10k: implement push-pull tx
>> model" introduced this regression - after restoring it from reverts
>> fq_codel_drop is hungry again.
>> Any ideas how to fix?
>
> If my hunch is right there's no easy (and proper) fix for that now.
>
> One of the patchset patches (ath10k: implement wake_tx_queue) starts
> to use mac80211 software queuing. This introduces extra induced
> latency and I'm guessing it results in fill-in-then-drain sequences in
> some cases which end up being long enough to make fq_codel_drop more
> work than normal.
>
> This is required for other changes and MU-MIMO performance
> improvements so this patch can't be removed.

But qca988x doesn't support MU-MIMO, AFAIK.
Can this be made chip dependent?

> I guess you could try forcing fq_codel to use different target time,
> e.g. 20ms (instead of the default 5). You can do this using `tc`
> command like so:
>
>    tc qdisc replace dev wlan0 parent :1 fq_codel limit 1024 target 20ms
>    tc qdisc replace dev wlan0 parent :2 fq_codel limit 1024 target 20ms
>    tc qdisc replace dev wlan0 parent :3 fq_codel limit 1024 target 20ms
>    tc qdisc replace dev wlan0 parent :4 fq_codel limit 1024 target 20ms
>
> You might also want to try `pfifo` instead of `fq_codel` for comparison as well.

Will try.


Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
