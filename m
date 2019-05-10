Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP5yX-0005AV-0W
 for ath10k@lists.infradead.org; Fri, 10 May 2019 13:54:14 +0000
Subject: Re: ath10k: wmi service ready event not received
References: <CAHk-=wim_asb1MRpis39SDghBNN5SpKDvUvF6cTtwa9w8cS8_Q@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <6e530d73-91e9-faaf-31d0-cd5fadc66ffc@candelatech.com>
Date: Fri, 10 May 2019 06:54:11 -0700
MIME-Version: 1.0
In-Reply-To: <CAHk-=wim_asb1MRpis39SDghBNN5SpKDvUvF6cTtwa9w8cS8_Q@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org



On 05/10/2019 05:28 AM, Linus Torvalds wrote:
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
>
> Rebooting got wireless back. It's possible I could have done something
> less drastic, but I was thinking that it would be the new kernel and
> rebooted into an older version. But then rebooting into the new one
> afterwards (double-checking before starting a bisect) and it all
> worked.
>
> Is there anything I can do to debug this if it happens again?

Please provide 'lspci' or other info on the NIC chipset, for reference.

Sometimes a work-around is:

rmmod ath10k_pci ath10k_core; modprobe ath10k_pci

Sometimes you will get a firmware register dump in this crash case, and then someone
from QCA might can get a backtrace if you post that with the chipset info and
such (or if it is one of the NICs my ath10k-ct firmware supports and you can reproduce
an issue with that firmware, then I can debug it).

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
