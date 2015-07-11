Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDxVg-0007KU-Sh
 for ath10k@lists.infradead.org; Sat, 11 Jul 2015 16:20:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix QCA61X4 boot up
References: <1435930429-3970-1-git-send-email-bartosz.markowski@tieto.com>
Date: Sat, 11 Jul 2015 19:19:50 +0300
In-Reply-To: <1435930429-3970-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Fri, 3 Jul 2015 15:33:49 +0200")
Message-ID: <87615qwtsp.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> commit "a521ee983d312db7 ath10k: Add new reg_address/mask to hw register
> table" commit has broken the QCA61x4 support, by providing wrong
> fw_indicator_address, which shall be 0x0003a028 instead of 0x00009028.
>
> User experience was a failing boot up sequence (crashing device during
> initialization)
>
> [  181.663874] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
> [  181.664787] ath10k_pci 0000:02:00.0: pci irq msi-x interrupts 8 irq_mode 0 reset_mode 0
> [  181.688886] ath10k_pci 0000:02:00.0: device has crashed during init
> [  181.688897] ath10k_pci 0000:02:00.0: failed to wait for target after cold reset: -70
> [  181.688902] ath10k_pci 0000:02:00.0: failed to reset chip: -70
> [  181.689774] ath10k_pci: probe of 0000:02:00.0 failed with error -70
>
> Fix it by updating the address with correct value.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
