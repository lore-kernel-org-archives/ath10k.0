Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22e.google.com ([2a00:1450:4008:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4TzX-0002jq-4y
 for ath10k@lists.infradead.org; Wed, 31 Jul 2013 10:50:52 +0000
Received: by mail-bk0-f46.google.com with SMTP id 6so186177bkj.19
 for <ath10k@lists.infradead.org>; Wed, 31 Jul 2013 03:50:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQn-VF-Ehio4Az6GenGb5cBTm2t2a9bQFAuALFhx+MQ+cw@mail.gmail.com>
References: <1374129572-6079-1-git-send-email-michal.kazior@tieto.com>
 <87d2pzuc90.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQn-VF-Ehio4Az6GenGb5cBTm2t2a9bQFAuALFhx+MQ+cw@mail.gmail.com>
Date: Wed, 31 Jul 2013 12:50:25 +0200
Message-ID: <CA+BoTQn4xc6M8cwH7tFiq7823-e7LNS=cwWa9F4c5L_xc8POZw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: move irq setup
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 31 July 2013 07:50, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 30 July 2013 20:35, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> There was a slight race during PCI shutdown. Since
>>> interrupts weren't really stopped (only Copy
>>> Engine interrupts were disabled through device hw
>>> registers) it was possible for a firmware
>>> indication (crash) interrupt to come in after
>>> tasklets were synced/killed. This would cause
>>> memory corruption and a panic in most cases. It
>>> was also possible for interrupt to come before CE
>>> was initialized during device probing.
>>>
>>> Interrupts are required for BMI phase so they are enabled as soon as
>>> power_up() is called but are freed upon both power_down() and stop()
>>> so there's asymmetry here. As by design stop() cannot be followed by
>>> start() it is okay. Both power_down() and stop() should be merged
>>> later on to avoid confusion.
>>
>> Why are the interrupts freed both in power_down() and stop()? I don't
>> get that.
>>
>> What if we call disable_irq() in power_down() instead?
>
> power_down() must call free_irq(), because power_up() calls
> request_irq() (if you want the symmetry). If anything, the stop()
> should call disable_irq(), but wouldn't that mean start() should call
> enable_irq()? But than, irqs are needed before start()..
>
> I did think about disable_irq() but AFAIR you need to enable_irq()
> later on (so either way you need to keep track of the irq state or
> you'll get a ton of WARN_ONs from the system). I'll double check that
> and report back later

enable/disable_irq must be balanced as well.

There are two cases of power cycle:
 * power_up, power_down
 * power_up, start, stop, power_down

If irq setup is moved from pci_probe/remove to power_up/power_down,
then stop() still needs irqs to be halted - either disable_irq, or
free_irq. In the latter case power_down must be prepared and not issue
free_irq again.

If irq setup remains in pci_probe/remove then both stop() and
power_down() need irqs to be halted too. Same issue applies.

If stop/power_down is merged than the whole problem is solved. This
seems like the sane solution to the whole problem but requires some
refactoring to be done first.


Pozdrawiam / Best regards,
Micha=B3 Kazior.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
