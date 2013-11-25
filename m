Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkvYt-0005dX-4z
 for ath10k@lists.infradead.org; Mon, 25 Nov 2013 12:46:47 +0000
Received: by mail-wi0-f172.google.com with SMTP id en1so3493385wid.11
 for <ath10k@lists.infradead.org>; Mon, 25 Nov 2013 04:46:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87siukn05r.fsf@kamboji.qca.qualcomm.com>
References: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
 <1385125518-13461-8-git-send-email-michal.kazior@tieto.com>
 <87siukn05r.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 25 Nov 2013 13:46:23 +0100
Message-ID: <CA+BoTQnQWEy6QzKb9Ts6UokyC7yhY829PB42kUpZwLP4dqj+nQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] ath10k: re-add support for early fw indication
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On 25 November 2013 13:20, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> It's possible for FW to panic during early boot or
>> at driver teardown in some rare cases.
>>
>> The patch re-introduces support to detect and
>> print those crashes.
>>
>> This introduces an additional irq handler that is
>> set for the duration of early boot and shutdown.
>> The handler is then overriden with regular
>> handlers upon hif start().
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

>> @@ -1952,6 +1975,9 @@ static void ath10k_pci_hif_power_down(struct ath10=
k *ar)
>>  {
>>       struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
>>
>> +     ath10k_ce_disable_interrupts(ar);
>> +     ath10k_pci_free_early_irq(ar);
>> +     ath10k_pci_kill_tasklet(ar);
>
> Should disable_interrupts() and kill_tasklet() be in an earlier patch?

No. Before this patch there are no interrupt handlers registered by
power_up, so there are no interrupts to be cleaned up in power_down.

Since this patch introduces early irq handling in power_up, then
power_down must shut everything down. Now that I think about the
ath10k_ce_disable_interrupts() isn't necessary here. The other two
functions are though.


Micha=B3

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
