Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW8tq-0003vK-Bl
 for ath10k@lists.infradead.org; Fri, 04 Apr 2014 18:31:35 +0000
Received: by mail-wg0-f44.google.com with SMTP id m15so3855693wgh.15
 for <ath10k@lists.infradead.org>; Fri, 04 Apr 2014 11:31:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <533EC686.40505@candelatech.com>
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <533EC686.40505@candelatech.com>
Date: Fri, 4 Apr 2014 11:31:09 -0700
Message-ID: <CAA93jw5DfY=y1b=HsDPi6zsKDSDg35+YcHJetn_XYXgWD120WQ@mail.gmail.com>
Subject: Re: [RFT 0/4] ath10k: fix flushing and tx stalls
From: Dave Taht <dave.taht@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Fri, Apr 4, 2014 at 7:49 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 04/04/2014 04:37 AM, Michal Kazior wrote:
>>
>> Hi,
>>
>> After digging around I've found what seems to be
>> the problem with WMI Tx credit starvation and
>> inability to properly flush Tx in ath10k_flush().
>>
>> Long story short: if a client that was asleep (as
>> per what firmware thinks) goes out of range (or
>> just stops responding) then Tx rots in FW/HW
>> queues for a few seconds before it's discarded.
>> For WMI Tx credits this means management frames
>> eat up Tx credits for a few seconds (causing other
>> WMI commands to timeout and return -EAGAIN/-11).
>> For HTT Tx this means NullFunc frames would get
>> stuck for a few seconds before completion was
>> received.
>>
>> @Ben: Can you check if this helps you? I tested
>> this briefly and at least [1/4] seems fixes the
>> WMI Tx starvation. I'm hoping patches 2-4 help
>> with your ath10k_flush() failures which I haven't
>> been successfull in reproducing (but have observed
>> improvement with purging some frames out of FW/HW
>> queues).
>
>
> I'm out of office for a bit, but will test this as
> soon as I'm back.
>
> Thanks for looking into this!
>
> In general, would it make more sense to have a few more tx credits
> available to mitigate the slow-to-be-processed buffers?

It would help more to organize the queueing so that there is no head
of line per sta blocking, smarter (interleaved) per station retries,
and sane packet drops and congestion notifications delivered sooner -
certainly dropping packets after 250ms of delay, and preferably much,
much less when a client is not in sleep mode....

To preach:

https://tools.ietf.org/html/draft-hoeiland-joergensen-aqm-fq-codel-00

https://datatracker.ietf.org/doc/draft-nichols-tsvwg-codel/

http://www.bufferbloat.net/projects/cerowrt/wiki/Fq_Codel_on_Wireless


>
> Thanks,
> Ben
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k



-- =

Dave T=E4ht

Fixing bufferbloat with cerowrt: http://www.teklibre.com/cerowrt/subscribe.=
html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
