Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-f50.google.com ([209.85.215.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9RS3-0005Td-Th
 for ath10k@lists.infradead.org; Tue, 22 Jul 2014 04:13:20 +0000
Received: by mail-la0-f50.google.com with SMTP id gf5so5291423lab.23
 for <ath10k@lists.infradead.org>; Mon, 21 Jul 2014 21:12:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vbqqwoks.fsf@kamboji.qca.qualcomm.com>
References: <CALCETrUXvbhkKDAvEw+643mKZtJzcJtPGhxbo35r3h=rCMOWwA@mail.gmail.com>
 <87vbqqwoks.fsf@kamboji.qca.qualcomm.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 21 Jul 2014 21:12:35 -0700
Message-ID: <CALCETrXtvTyFbc0RM0kHcW_UiX+eurRTdp0vdQER2ysUrd4FcQ@mail.gmail.com>
Subject: Re: ath10k tx to a Macbook Pro stalls
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Jul 21, 2014 at 11:31 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Andy Lutomirski <luto@amacapital.net> writes:
>
>> On my Archer C7 v2, as soon as the MBP tries to do something like
>> playing a video, it seems like frames *to* the MBP no longer get
>> there.  At the very least, arp replies don't get there.
>
> A multicast problem? Can you run for example 'arping -b <macbook's ip>'
> to check if multicast stops working at some point? What if you hardcode
> the ARP address, do unicast packets go to the macbook still?

It's a unicast problem, actually.  arping -b works.  arping w/o -b
gets one reply.

arp -s <IP> ff:ff:ff:ff:ff:ff allows me to ping the MBP (with
moderately high loss).  (I'm actually a bit surprised that Linux is
okay with that.)

Does this mean that the MBP is failing to notice TIM entries, or that
ath10k somehow stops buffering packets to power-saving stations?

>
> If there are multicast problems, my first suspect is always power save.
> Is there a way to disable power save on the macbook for narrowing down
> the problem?
>
> Also we had discussion about macbook problems before and aggreation came
> up as one suspect. Now we have a debugfs interface to change aggregation
> settings, but I doubt openwrt has that yet. Check the archives for more.

I'll keep an eye out for it.

--Andy

>
> --
> Kalle Valo



-- 
Andy Lutomirski
AMA Capital Management, LLC

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
