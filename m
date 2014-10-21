Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgUeT-00041b-Jt
 for ath10k@lists.infradead.org; Tue, 21 Oct 2014 08:18:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ath10k: speed up hw recovery
References: <1413807758-30249-1-git-send-email-michal.kazior@tieto.com>
 <1413807758-30249-4-git-send-email-michal.kazior@tieto.com>
Date: Tue, 21 Oct 2014 11:17:58 +0300
In-Reply-To: <1413807758-30249-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 20 Oct 2014 14:22:38 +0200")
Message-ID: <87lho9ygy1.fsf@kamboji.qca.qualcomm.com>
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

> In some cases hw recovery was taking an absurdly
> long time due to ath10k waiting for things that
> would never really complete.
>
> Instead of waiting for inevitable timeouts poke
> all completions and wakequeues and check if it's
> still worth waiting.
>
> Reading/writing ar->state requires conf_mutex.
> Since waiters might be holding it introduce a new
> flag CRASH_FLUSH so it's possible to tell waiters
> to abort whatever they were waiting for.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

While applying to ath-next-test there was a conflict in core.h. Please
check my resolution:

https://github.com/kvalo/ath/commit/6cccda0185c7df96f439dc3f87961e81843de3ee

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
