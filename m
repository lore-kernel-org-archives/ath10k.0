Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlgQ1-0005k6-C7
 for ath10k@lists.infradead.org; Wed, 27 Nov 2013 14:48:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 8/8] ath10k: allow explicit MSI/MSI-X disabling
References: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
 <1385384787-12470-1-git-send-email-michal.kazior@tieto.com>
 <1385384787-12470-9-git-send-email-michal.kazior@tieto.com>
Date: Wed, 27 Nov 2013 16:47:49 +0200
In-Reply-To: <1385384787-12470-9-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 25 Nov 2013 14:06:27 +0100")
Message-ID: <87y549gaui.fsf@kamboji.qca.qualcomm.com>
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

> This can be useful for testing and debugging.
>
> This introduces new ath10k_pci module parameter
> `irq_mode`. By default it is 0, meaning automatic
> irq mode (MSI-X as long as both target HW and host
> platform supports it). The parameter works on a
> best effort basis.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +MODULE_PARM_DESC(irq_mode, "0: ayto, 1: legacy, 2: msi (default: 0)");

I fixed this typo ("ayto").

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
