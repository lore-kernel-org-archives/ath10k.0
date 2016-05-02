Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x244.google.com ([2607:f8b0:4003:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axFzs-0000Km-VW
 for ath10k@lists.infradead.org; Mon, 02 May 2016 15:42:57 +0000
Received: by mail-ob0-x244.google.com with SMTP id ds10so4462230obb.3
 for <ath10k@lists.infradead.org>; Mon, 02 May 2016 08:42:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462201445.5535.247.camel@edumazet-glaptop3.roam.corp.google.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbL0K2fQT4EXm4LjDaxDLC+AVj9szTpyHq2iUwuPVNNz+g@mail.gmail.com>
 <1462201445.5535.247.camel@edumazet-glaptop3.roam.corp.google.com>
Date: Mon, 2 May 2016 18:42:35 +0300
Message-ID: <CACiydbJC2mminbgh3pZ4-o-A=n=22uFE-3wTVVbjATvUMnZa7Q@mail.gmail.com>
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

On 2 May 2016 at 18:04, Eric Dumazet <eric.dumazet@gmail.com> wrote:
> On Mon, 2016-05-02 at 17:09 +0300, Roman Yeryomin wrote:
>
>> So if I run some UDP download you will just kill me? Sounds broken.
>>
>
> Seriously guys, I never suggesting kill a _task_ but the _flow_
>
> Meaning dropping packets. See ?
>
> If you do not want to drop packets, do not use fq_codel and simply use
> bufferbloat pfifo_fast.
>

I understand what you mean but in case of a flow running through the
AP it probably could be considered as "task"

I've tried pfifo before, it was better but didn't help much.
How much faster pfifo_fast is?

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
