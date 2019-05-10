Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP6Si-0001wc-Ii
 for ath10k@lists.infradead.org; Fri, 10 May 2019 14:25:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k: wmi service ready event not received
References: <CAHk-=wim_asb1MRpis39SDghBNN5SpKDvUvF6cTtwa9w8cS8_Q@mail.gmail.com>
Date: Fri, 10 May 2019 17:25:19 +0300
In-Reply-To: <CAHk-=wim_asb1MRpis39SDghBNN5SpKDvUvF6cTtwa9w8cS8_Q@mail.gmail.com>
 (Linus Torvalds's message of "Fri, 10 May 2019 05:28:11 -0700")
Message-ID: <87r296jsj4.fsf@codeaurora.org>
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ath10k@lists.infradead.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

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
>
> Rebooting got wireless back. It's possible I could have done something
> less drastic, but I was thinking that it would be the new kernel and
> rebooted into an older version. But then rebooting into the new one
> afterwards (double-checking before starting a bisect) and it all
> worked.
>
> Is there anything I can do to debug this if it happens again?

Can you post dmesg log when ath10k starts so that we know what hardware
and firmware you are using? "dmesg | grep ath10k" should tell that, I
assume this is a QCA6174 PCI device. Even better if you can provide full
dmesg so that we could see what was happening before this timeout, even
if just privately to me. Did this happen during laptop startup or after
resume?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
