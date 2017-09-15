Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x229.google.com ([2607:f8b0:4002:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsgRY-0006QR-Is
 for ath10k@lists.infradead.org; Fri, 15 Sep 2017 02:33:30 +0000
Received: by mail-yw0-x229.google.com with SMTP id w22so685004ywa.13
 for <ath10k@lists.infradead.org>; Thu, 14 Sep 2017 19:33:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cfd0f2d6-5383-1956-5d32-771a1f329f1f@candelatech.com>
References: <c88e48ec-fddc-864e-0ed2-d88e9cc07fb5@candelatech.com>
 <CAJ-VmoknefqtxZCMc+PETo7Y3-HOcn0H3ySZqVWDTwMirACfcg@mail.gmail.com>
 <cfd0f2d6-5383-1956-5d32-771a1f329f1f@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 14 Sep 2017 19:33:02 -0700
Message-ID: <CAJ-Vmom-DUM7R9sGL5SVeMysm-tkRkNrFVXkSfx4kJ+W4yzr1w@mail.gmail.com>
Subject: Re: Failed to wake device (9984)
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
Cc: ath10k <ath10k@lists.infradead.org>

On 14 September 2017 at 17:13, Ben Greear <greearb@candelatech.com> wrote:

>>
>> There were always weird cold reset races that necessitated a PCI bus reset of the device. :( can you even see the device? do any of the registers work?
>
>
> Can the cold reset be done on generic x86-64 hardware?

I'll have to go check. You /should/ be able to. Are there are power
and reset files in /sys/bus/pci for those devices?

>
> And, it shows up enough that the system probes it, at least.  I guess no
> infrastructure to speak of set up for this thing, so not sure how to
> probe any registers.

Well, that could be cached BAR information. There are some cold / warm
reset registers in the RTC block that are used during initial wakeup;
print what they're saying to see if it's coming back 0xfffffff or
0xdeadc0de or something?





-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
