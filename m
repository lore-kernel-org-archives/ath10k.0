Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOiKo-0003ee-SV
 for ath10k@lists.infradead.org; Tue, 02 Sep 2014 07:16:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: re-enable interrupts properly in hw recovery
References: <1409144989-17934-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 2 Sep 2014 10:15:57 +0300
In-Reply-To: <1409144989-17934-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 27 Aug 2014 15:09:49 +0200")
Message-ID: <871trupk5u.fsf@kamboji.qca.qualcomm.com>
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

> Recent changes done to start/restart sequences
> broke hw recovery in some hw configurations. The
> pci transport was stopped twice however due to a
> workaround in the pci disabling code the
> disable/enable for first msi interrupt was not
> balanced. This ended up with irqs not being
> properly re-enabled and the following print out
> during recovery:
>
>  ath10k: failed to receive control response completion, polling..
>  ath10k: Service connect timeout: -110
>  ath10k: Could not init core: -110
>
> Legacy interrupt mode was unaffected while msi
> ranged mode would be partially crippled (it would
> miss fw indication interrupts but otherwise it
> worked fine).
>
> This fixes completely broken fw recovery for a
> single msi interrupt mode and fixes subsequent fw
> crash reports for msi range interrupt mode.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
