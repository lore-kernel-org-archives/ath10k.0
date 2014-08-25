Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XLpfn-0006KI-99
 for ath10k@lists.infradead.org; Mon, 25 Aug 2014 08:30:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/6] ath10k: ath10k: fixes 2014-08-07, part 2
References: <1408710214-24894-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 25 Aug 2014 11:30:17 +0300
In-Reply-To: <1408710214-24894-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 22 Aug 2014 14:23:28 +0200")
Message-ID: <8738cl6kfa.fsf@kamboji.qca.qualcomm.com>
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
> This is part 2 (of 3) of my patches. Split for
> your reviewing pleasure.
>
> This is related to irq handling only. Prepares for
> more start/restart sequences fixes.
>
> v2:
>  * patch [1/6] is from part 1
>  * patch [5/6] is new
>  * some fixes, see notes
>  * based on
>    f2c7cb774e3e0a8152b1134015c245ba0abddfc6 and
>    4 crash dump patches (v8) from Kalle
>
>
> Michal Kazior (6):
>   ath10k: move fw init print
>   ath10k: fix legacy irq workaround
>   ath10k: setup irq method in probe
>   ath10k: split ce irq/handler setup
>   ath10k: make sure to really disable irqs
>   ath10k: remove early irq handling

Thanks, all six patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
