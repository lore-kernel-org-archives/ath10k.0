Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk06v-0005Ks-Pc
 for ath10k@lists.infradead.org; Fri, 31 Oct 2014 00:30:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 0/4] ath10k: pci related fixes 2014-10-09
References: <1414488728-31489-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 31 Oct 2014 02:29:51 +0200
In-Reply-To: <1414488728-31489-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 28 Oct 2014 10:32:04 +0100")
Message-ID: <87lhnxdqtc.fsf@kamboji.qca.qualcomm.com>
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

> This is a partial re-spin which includes the
> not-yet-applied patches that fix/change warm
> reset.
>
> v3:
>  * change CE ring cleanup (new patch #1)
>
>
> Michal Kazior (4):
>   ath10k: change ce ring cleanup logic
>   ath10k: make warm reset a bit safer and faster
>   ath10k: split reset logic from power up
>   ath10k: don't reset chip on power_down

Thanks, all four patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
