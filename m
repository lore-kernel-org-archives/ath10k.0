Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axrw3-0000A5-Mb
 for ath10k@lists.infradead.org; Wed, 04 May 2016 08:13:32 +0000
Received: by mail-ob0-x22f.google.com with SMTP id aq1so11460123obc.3
 for <ath10k@lists.infradead.org>; Wed, 04 May 2016 01:13:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACiydbJGpyak1jCm+eqG=xez4wP4AFciYf5DvQCu4-8E7A_Xyw@mail.gmail.com>
References: <CAA93jw7uHvkKTUtXZqqWbDSWDxb=sZ+sfhdmMM1SZW3BsmZ1xA@mail.gmail.com>
 <CACiydbJGpyak1jCm+eqG=xez4wP4AFciYf5DvQCu4-8E7A_Xyw@mail.gmail.com>
Date: Wed, 4 May 2016 11:13:10 +0300
Message-ID: <CACiydbL6QaER-zrP5ZBRe-x5PLOoU7goAnquzGHVXTpt_g+STg@mail.gmail.com>
Subject: Re: iperf3 udp flood behavior at higher rates
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
To: Dave Taht <dave.taht@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>

On 4 May 2016 at 11:02, Roman Yeryomin <leroi.lists@gmail.com> wrote:
> On 3 May 2016 at 02:18, Dave Taht <dave.taht@gmail.com> wrote:
>> to fork the fq_codel_drop discussion a bit...
>>
>> I have up and running two new boxes[1] that are my hope to be able to
>> test ath10k/ath9k hardware with, for this test, using one in the
>> middle as a router and a nuc i3 box as the server, all ports pure
>> ethernet... there's a switch in the way, too.
>>
>> On tcp via netperf I get expected ~940 mbits.
>>
>> On udp via iperf3 (again, all pure ethernet) -  in neither case below
>> am I seeing any drops in the qdisc itself anywhere on the path, yet am
>> only achieving 500mbit.
>
> That's interesting, I have no problems with UDP over ethernet.
> What about TCP with iperf3?
>

Also what version of iperf3 are you using?

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
