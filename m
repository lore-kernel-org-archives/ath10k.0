Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cX8hc-0002KJ-NT
 for ath10k@lists.infradead.org; Fri, 27 Jan 2017 15:44:42 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Incomplete scan results after rf(un)kill
Date: Fri, 27 Jan 2017 15:44:17 +0000
Message-ID: <87y3xw4ieo.fsf@kamboji.qca.qualcomm.com>
References: <CAMVG2ssLQ897kVVE2jZrqsDm2XFmq7snoOG649FgGEogVjWX7g@mail.gmail.com>
In-Reply-To: <CAMVG2ssLQ897kVVE2jZrqsDm2XFmq7snoOG649FgGEogVjWX7g@mail.gmail.com>	(Daniel
 J. Blueman's message of "Fri, 27 Jan 2017 14:50:04 +0800")
Content-Language: en-US
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
To: Daniel J Blueman <daniel@quora.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Daniel J Blueman <daniel@quora.org> writes:

> On 4.9.5 and previous, I've noticed that 20% of the time after
> rfunkilling, AP scan results would often have only 1-2 out of the
> previous 10 APs, and the situation would persist until removing and
> reinserting the ath10k_pci module.
>
> This is on my Dell XPS 13 9360 (Kaby Lake) with current BIOS 1.2.3 on
> Ubuntu (ElementaryOS) 16.04 with updates.
>
> Could this have any relation to the missing firmware [1]?
>
> What state can I capture to help diagnose this?

Do you see any pattern what APs are visible when the bug happens? For
example, are those 1-2 APs always the same one? And are they ones with
strongest signal strength or maybe related to certain channels?

After the bug happens how does the device work otherwise? Have you
tested performance (iperf) or signal strength? Is there any packet loss
etc?

> ath10k_pci 0000:3a:00.0: enabling device (0000 -> 0002)
> ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> ath10k_pci 0000:3a:00.0: Direct firmware load for
> ath10k/pre-cal-pci-0000:3a:00.0.bin failed with error -2
> ath10k_pci 0000:3a:00.0: Direct firmware load for
> ath10k/cal-pci-0000:3a:00.0.bin failed with error -2
> ath10k_pci 0000:3a:00.0: Direct firmware load for
> ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
> ath10k_pci 0000:3a:00.0: could not fetch firmware file
> 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2

You can ignore these failed with error -2 messages, it just means that
ath10k is trying to find the correct firmware image and calibration
data. We know it's confusing users and have a patch pending:

https://patchwork.kernel.org/patch/9237095/

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
