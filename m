Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJynz-0004ax-KZ
 for ath10k@lists.infradead.org; Wed, 20 Aug 2014 05:51:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Timeout Issues
References: <CAD1M062MNW7y_hf+5btNA14xt9K69TqQy=Q-rCm+2xuHCZDEsA@mail.gmail.com>
Date: Wed, 20 Aug 2014 08:50:37 +0300
In-Reply-To: <CAD1M062MNW7y_hf+5btNA14xt9K69TqQy=Q-rCm+2xuHCZDEsA@mail.gmail.com>
 (Pushpal Sidhu's message of "Tue, 19 Aug 2014 11:27:23 -0700")
Message-ID: <87vbpn7lqq.fsf@kamboji.qca.qualcomm.com>
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
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: ath10k@lists.infradead.org

Pushpal Sidhu <psidhu@gateworks.com> writes:

> I'm having issues with ath10k timing out when trying to communicate
> with the wireless card (UNEX DAXA-O1 + have tried several others).
> Below is what I grabbed from dmesg.
>
> $ dmesg | grep ath10k
> [    5.233469] ath10k_pci 0000:09:00.0: enabling device (0140 -> 0142)
> [    5.575954] ath10k: pci irq legacy irq_mode 0 reset_mode 0
> [    7.704403] ath10k: failed to receive control response completion, polling..
> [    8.704379] ath10k: Service connect timeout: -110
> [    8.709089] ath10k: failed to connect htt (-110)
> [    9.020495] ath10k: could not init core (-110)
> [    9.324371] ath10k: could not probe fw (-110)
>
> This causes the card to not be registered, and thus is unusable (there
> is no wlanX)

My first guess is a problem related with the PCI bus, but that's just a
guess. Can you get us a trace-cmd log:

http://wireless.kernel.org/en/users/Drivers/ath10k/debug#Tracing

> I am able to use the Intel 7260 card (another AC card) with their
> firmware binary blob, so I don't believe this is a hardware
> configuration issue with mini-pcie.

Did you try iwlwifi on the exact same kernel?

> I am using the following software on an ARM board:
> ath10k branch of linux kernel: 3.16.0-wl-ath-182333-g6a69f0c

Have you verified that with this kernel version the PCI bus works
correctly on your ARM board? Especially check that interrupts work.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
