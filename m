Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP4vt-0000xh-Ru
 for ath10k@lists.infradead.org; Fri, 10 May 2019 12:47:27 +0000
Received: by mail-wm1-f67.google.com with SMTP id 7so1398640wmo.2
 for <ath10k@lists.infradead.org>; Fri, 10 May 2019 05:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wim_asb1MRpis39SDghBNN5SpKDvUvF6cTtwa9w8cS8_Q@mail.gmail.com>
In-Reply-To: <CAHk-=wim_asb1MRpis39SDghBNN5SpKDvUvF6cTtwa9w8cS8_Q@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 10 May 2019 05:47:10 -0700
Message-ID: <CAJ-Vmonr0wbSV4hgcF=BWVM9-y3axAuTgsfys8q7cTP96FbYgQ@mail.gmail.com>
Subject: Re: ath10k: wmi service ready event not received
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Fri, 10 May 2019 at 05:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm.
>
> I have a nice new laptop, and it works fine. Except today it lost
> wireless, and I have no idea why.
>
> It's not happened before (but it's fairly new and I'm actually on my
> first trip with it), so I don't know how common this is, but the
> kernel messages seem to say that the cause of it was
>
>   ath10k_pci 0000:02:00.0: wmi service ready event not received
>   ath10k_pci 0000:02:00.0: could not init core (-110)
>   ath10k_pci 0000:02:00.0: could not probe fw (-110)
>
> and then nothing works. -110 is ETIMEDOUT, fwiw.

Which NIC is it?

That's super, super early after NIC wake-up.

> Rebooting got wireless back. It's possible I could have done something
> less drastic, but I was thinking that it would be the new kernel and
> rebooted into an older version. But then rebooting into the new one
> afterwards (double-checking before starting a bisect) and it all
> worked.
>
> Is there anything I can do to debug this if it happens again?

I'd see whether it detached from the PCI bus or not - sometimes a
firmware crash super early does that. You could also rmmod reload
ath10k/ath10k_pci to see if that's enough. It's almost always enough.

We've been poking at this in FreeBSD for a bit. Some NICs don't reset
right after PCI reset is deasserted; some don't like being reset via
registers and need a PCI bus reset; some just take longer to wake-up
than the service ready event timeout is. Some just .. crash super
early :-) Someone ended up submitting a patch to my driver fork that
attempts this a few times in a loop with resets in between to ensure
it does load at boot.


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
