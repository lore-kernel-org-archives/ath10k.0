Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5A9O-0000Ys-Od
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 07:51:51 +0000
Received: by mail-bk0-f49.google.com with SMTP id r7so95982bkg.22
 for <ath10k@lists.infradead.org>; Fri, 02 Aug 2013 00:51:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bo5gpmij.fsf@kamboji.qca.qualcomm.com>
References: <1374129572-6079-1-git-send-email-michal.kazior@tieto.com>
 <1375427747-9539-1-git-send-email-michal.kazior@tieto.com>
 <87bo5gpmij.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 2 Aug 2013 09:51:28 +0200
Message-ID: <CA+BoTQktaDtp=fc3C_u4geA6vK72B1X4QnsD_GqrzU9NXEmBrA@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: fix device teardown
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

On 2 August 2013 09:41, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> This fixes interrupt-related issue when no
>> interfaces were running thus the device was
>> considered powered down.
>>
>> The power_down() function isn't really powering
>> down the device. It simply assumed it won't
>> interrupt. This wasn't true in some cases and
>> could lead to paging failures upon FW indication
>> interrupt (i.e. FW crash) because some structures
>> aren't allocated in that device state.
>>
>> One reason for that was that ar_pci->started
>> wasn't reset. The other is interrupts should've
>> been masked when teardown starts.
>>
>> The patch reorganized interrupt setup and makes
>> sure ar_pci->started is reset accordingly.
>>
>> Reported-by: Ben Greear <greearb@candelatech.com>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> ---
>> v2:
>>  * updated commit message
>>  * added Reported-By: Ben
>>  * added disable_irq() in hif_stop()
>>  * added ar_pci->started resetting
>>  * removed ar_pci->intr_started
>
> Thanks, this looks much better now.
>
> But I still have one question:
>
>> @@ -1742,6 +1761,12 @@ static int ath10k_pci_hif_power_up(struct ath10k =
*ar)
>>  {
>>       int ret;
>>
>> +     ret =3D ath10k_pci_start_intr(ar);
>> +     if (ret) {
>> +             ath10k_err("could not start interrupt handling (%d)\n", re=
t);
>> +             goto err;
>> +     }
>
> So now we call start_intr() during power_up(), which means that we do
> the request_irq() calls during every interface up event. Does that cause
> any meaningful overhead?

I don't think so.


> For me it looks better to do all resource allocation in
> ath10k_pci_probe(), like request_irq(), and free the resources in
> ath10k_pci_remove(). But then we would need to immeadiately call
> disable_irq() and then enable_irq() from power_up() so I'm not sure if
> that's any better.

Not only that. Since disable/enable_irq must be balanced we'd need
some way to track whether we have irqs enabled/disabled - either with
an extra bool variable, additional ath10k_states or new pci-specific
states.

The patch assumes disable_irq is followed by free_irq (which it is)
and possibly request_irq later on.


Pozdrawiam / Best regards,
Micha=B3 Kazior.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
