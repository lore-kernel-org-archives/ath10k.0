Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHqO8-0000Dt-HB
 for ath10k@lists.infradead.org; Thu, 14 Aug 2014 08:28:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 6/6] ath10k: move fw init print
References: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
 <1407402212-29809-7-git-send-email-michal.kazior@tieto.com>
 <87ppg6qh3z.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 14 Aug 2014 11:27:29 +0300
In-Reply-To: <87ppg6qh3z.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 12 Aug 2014 10:53:04 +0300")
Message-ID: <87egwjo4r2.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> Firmware probing is done only once when driver is
>> registered and firmware version is guaranteed to
>> remain the same until driver is unregistered.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>
> [...]
>
>> -	__set_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags);
>
> Doesn't this break this print in pci.c:
>
>         if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
>            ath10k_info("pci irq %s irq_mode %d reset_mode %d\n",
>                                     irq_mode, ath10k_pci_irq_mode,
>                                                     ath10k_pci_reset_mode);

Ah, now I understand. You rework that part in patch "ath10k: setup irq
method in probe" which was just in a different patchset. Then this extra
print during interface up is ok, as it just happens between the two
patches.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
