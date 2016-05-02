Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axEY7-0001ls-1Q
 for ath10k@lists.infradead.org; Mon, 02 May 2016 14:10:11 +0000
Received: by mail-oi0-x241.google.com with SMTP id d139so6409628oig.1
 for <ath10k@lists.infradead.org>; Mon, 02 May 2016 07:09:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
Date: Mon, 2 May 2016 17:09:48 +0300
Message-ID: <CACiydbL0K2fQT4EXm4LjDaxDLC+AVj9szTpyHq2iUwuPVNNz+g@mail.gmail.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
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
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>

On 1 May 2016 at 20:59, Eric Dumazet <eric.dumazet@gmail.com> wrote:
> On Sat, 2016-04-30 at 20:41 -0700, Dave Taht wrote:
>> >>>
>> >>>     45.78%  [kernel]       [k] fq_codel_drop
>> >>>      3.05%  [kernel]       [k] ag71xx_poll
>> >>>      2.18%  [kernel]       [k] skb_release_data
>> >>>      2.01%  [kernel]       [k] r4k_dma_cache_inv
>>
>> The udp flood behavior is not "weird".  The test is wrong. It is so filling
>> the local queue as to dramatically exceed the bandwidth on the link.
>
> Well, just _kill_ the offender, instead of trying to be gentle.
>
> fq_codel_drop() could drop _all_ packets of the fat flow, instead of a
> single one.
>
> It is too cpu intensive to be kind to the elephant, since under pressure
> fq_codel_drop() needs to be called for every enqueue.
>
> Really, we should not try to let inelastic flows hurt us.
>
> I can provide a patch.
>

So if I run some UDP download you will just kill me? Sounds broken.

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
