Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgINp-0006eK-LG
 for ath10k@lists.infradead.org; Tue, 12 Nov 2013 18:08:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv2 00/13] ath10k: pci fixes 2013-10-30
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
 <1383894095-27998-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 12 Nov 2013 20:07:45 +0200
In-Reply-To: <1383894095-27998-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 8 Nov 2013 08:01:22 +0100")
Message-ID: <877gcda3ym.fsf@kamboji.qca.qualcomm.com>
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

Michal Kazior <michal.kazior@tieto.com> writes:

> Hi,
>
> This patchset contains a slew of PCI/CE cleanups
> and fixes. The aim of the patchset is to deal with
> CE null dereference bugs Ben has been reporting on
> the mailing list for some time now.
>
> v2:
>  * fix prints
>  * fix commit messages
>  * add additional patch
>    (ath10k: reset device upon stopping/power down)
>
>
> Michal Kazior (13):
>   ath10k: remove ar_pci->ce_count
>   ath10k: don't forget to kill fw error tasklet
>   ath10k: split tasklet killing function
>   ath10k: rename ath10k_pci_reset_target()
>   ath10k: make sure to mask all CE irqs
>   ath10k: fix ath10k_ce_init() failpath
>   ath10k: remove meaningless check
>   ath10k: use ath10k_do_pci_wake/sleep
>   ath10k: propagate ath10k_ce_disable_interrupts() errors
>   ath10k: guard against CE corruption from firmware
>   ath10k: re-arrange PCI init code
>   ath10k: add and fix some PCI prints
>   ath10k: reset device upon stopping/power down

Thanks, all 13 applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
