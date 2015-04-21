Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ykc8V-0008Mc-CV
 for ath10k@lists.infradead.org; Tue, 21 Apr 2015 17:39:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix qca61x4 hw2.1 support
References: <1429521641-21993-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 21 Apr 2015 20:38:30 +0300
In-Reply-To: <1429521641-21993-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 20 Apr 2015 09:20:41 +0000")
Message-ID: <87bnihz8ix.fsf@kamboji.qca.qualcomm.com>
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

> During initialization firmware does some sort of
> memory switch between DRAM and IRAM. If
> configuration value for bank switching isn't
> correct device crashes during init.
>
> The new value prevents firmware 11.0.0.302 (and
> possibly others) for qca61x4 hw2.1 from crashing
> during init.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
