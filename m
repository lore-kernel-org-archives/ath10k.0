Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbIhE-0002HI-2o
 for ath10k@lists.infradead.org; Sun, 21 Aug 2016 02:41:13 +0000
Received: from mail-it0-f69.google.com ([209.85.214.69])
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:DES-CBC3-SHA:168)
 id 1bbIgg-0005w8-Sl
 for ath10k@lists.infradead.org; Sun, 21 Aug 2016 10:40:39 +0800
Received: by mail-it0-f69.google.com with SMTP id e63so113863126ith.1
 for <ath10k@lists.infradead.org>; Sat, 20 Aug 2016 19:40:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=xh3ij6n1UHH=jC8W1mdsn+kWg9SroSKdm_F6tLMKsDA@mail.gmail.com>
References: <CA+uUJGs7HGamb3duZ_9PYfx++43F3UWE2nO4C3AN9Saen=iMrA@mail.gmail.com>
 <CA+uUJGvb6sUXywTvtnyigrkrGSeVEp-2KbndQ_5k5_RxdKgV-Q@mail.gmail.com>
 <CAJ-Vmo=xh3ij6n1UHH=jC8W1mdsn+kWg9SroSKdm_F6tLMKsDA@mail.gmail.com>
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Sun, 21 Aug 2016 10:39:56 +0800
Message-ID: <CA+uUJGs=aZQ+oRJeHJO92UTg94vhvyYVVn5pKD+=N37bfY_evA@mail.gmail.com>
Subject: Re: DFS radar pattern detection in different regions
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: wireless-regdb@lists.infradead.org, ath10k <ath10k@lists.infradead.org>

I am able to do it just by enabling DFS-related flags in the kernel
config and not doing anything more hackish. And I also understand why
it won't be "right" :) Although no radar events are reported
(thankfully), that may not necessarily mean there is no radar
operating around.

I am just confused by the output of "iw reg get", which outputs lines
from the db.txt of wireless-regdb [1]. For example, the first lines of
the output for some countries read like the following:
country AE: DFS-FCC
country AF: DFS-ETSI
country BD: DFS-JP

What is that supposed to mean? These lines seem to allow using DFS
channels in these countries as long as DFS is enabled in kernel
config, although this won't be "right" ?!

Raj Joshi

[1] http://git.kernel.org/cgit/linux/kernel/git/sforshee/wireless-regdb.git/tree/db.txt

On Sun, Aug 21, 2016 at 10:11 AM, Adrian Chadd <adrian@freebsd.org> wrote:
> I mean, it's done in software, so you can do that if you want to. It
> just won't be "right".
>
> Why? :)
>
>
> -adrian
>
>
> On 20 August 2016 at 19:05, Raj Joshi <rajjoshi@comp.nus.edu.sg> wrote:
>> In simpler terms , I want to know if I could run ath10k on DFS
>> channels in countries "outside" of FCC, ETSI and JP regulations?
>>
>> Thanks,
>> Raj Joshi
>>
>>
>> On Tue, Aug 16, 2016 at 10:23 PM, Raj Joshi <rajjoshi@comp.nus.edu.sg> wrote:
>>> Hi,
>>>
>>> I am aware that DFS scan and pattern detection is possible in ath10k
>>> or to be precise it is implemented in the ath kernel module. From the
>>> source code (dfs_pattern_detector.c), I can see that there are
>>> patterns specific to ETSI, FCC and JP regulatory regions.
>>>
>>> I got some conceptual questions regarding the pattern detection and regulations:
>>>
>>> Q.1 For a given country, the wireless-regdb [1] specifies one of these
>>> 3 regions for DFS. For example, "country AE: DFS-FCC" or "country AF:
>>> DFS-ETSI". What does this mean? Does it mean that country AE follows
>>> DFS rules of FCC and that country AF follows those of ETSI?
>>>
>>> Q.2 If the above is the case, then can I run ath10k "correctly" as
>>> well as "legally" in country AE, given that pattern detection is
>>> implemented for FCC? When I say "correctly", I mean that pattern
>>> detection will not have any false negatives. And when I say "legally",
>>> I mean that my ath10k device would comply with the local regulations
>>> of country AE, given that my device is FCC DFS compliant.
>>>
>>> It is little hard to believe that all the world's radar patterns could
>>> be covered by 3 regulatory standards (FCC, ETSI and JP). Also if that
>>> was the case, then ath10k already does a very good job with DFS
>>> channels and the new swanky 802.11ac devices such as [2] are simply
>>> not worth their price!
>>>
>>> I would appreciate if someone can provide a clarification around this.
>>>
>>> Thanks,
>>> Raj
>>>
>>> [1] http://git.kernel.org/cgit/linux/kernel/git/sforshee/wireless-regdb.git/tree/db.txt
>>> [2] https://www.kickstarter.com/projects/portalwifi/portal-turbocharged-wifi/description
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
