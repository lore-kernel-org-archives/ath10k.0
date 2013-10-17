Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWgDG-0001QG-Bk
 for ath10k@lists.infradead.org; Thu, 17 Oct 2013 05:33:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 7/8] ath10k: fix device initialization routine
References: <20131016134503.25095.8044.stgit@localhost6.localdomain6>
 <20131016134617.25095.10581.stgit@localhost6.localdomain6>
 <CA+BoTQkqkuf-=a4giyJHeYdXZ2T3deU7nmuQOxpFcKSzWjGb3Q@mail.gmail.com>
 <87ppr55hun.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=9cEwB7PY8VMGv1SmEPsH6WGmDEBgujmo9G=Cby82uyg@mail.gmail.com>
Date: Thu, 17 Oct 2013 08:33:07 +0300
In-Reply-To: <CA+BoTQ=9cEwB7PY8VMGv1SmEPsH6WGmDEBgujmo9G=Cby82uyg@mail.gmail.com>
 (Michal Kazior's message of "Wed, 16 Oct 2013 09:01:52 -0700")
Message-ID: <87zjq84g30.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> On 16 October 2013 08:57, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>>> +       /* disable pending irqs */
>>>> +       ath10k_pci_core_write32(ar, PCIE_INTR_ENABLE_ADDRESS, 0);
>>>> +       ath10k_pci_core_write32(ar, PCIE_INTR_CLR_ADDRESS, ~0);
>>>
>>> These use SOC_CORE_BASE_ADDRESS as the suffix, not the RTC_SOC_BASE_ADDRESS.
>>
>> But I am using SOC_CORE_BASE_ADDRESS, right?
>
> Ah, right. Sorry. My eyesight failed me :) Those function names seem a
> little confusing (_core_ for SOC_CORE and _soc_ for RTC_SOC)

Yeah, I agree. I didn't research what RTC_SOC stands for, I just assumed
it contains registers for controlling the whole SOC state. That's why I
used "_soc_" here. And CORE registers control just one part of SOC.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
