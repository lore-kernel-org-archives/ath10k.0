Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xjzuz-0000k8-4K
 for ath10k@lists.infradead.org; Fri, 31 Oct 2014 00:18:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: avoid possible deadlock with scan timeout
References: <1414488189-28625-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 31 Oct 2014 02:17:33 +0200
In-Reply-To: <1414488189-28625-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 28 Oct 2014 10:23:09 +0100")
Message-ID: <87ppd9drdu.fsf@kamboji.qca.qualcomm.com>
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

> This should prevent deadlock predicted by the
> following splat:
>
>  ======================================================
>  [ INFO: possible circular locking dependency detected ]
>  3.17.0-wl-ath+ #67 Not tainted
>  -------------------------------------------------------
>  kworker/u32:1/7230 is trying to acquire lock:
>   (&ar->conf_mutex){+.+.+.}, at: [<ffffffffa040a57d>] ath10k_scan_timeout_work+0x2d/0x50 [ath10k_core]
>
>  but task is already holding lock:
>   ((&(&ar->scan.timeout)->work)){+.+...}, at: [<ffffffff8106dae1>] process_one_work+0x151/0x470
>
>  which lock already depends on the new lock.
>

[...]

>   *** DEADLOCK ***
>
> Reported-by: Marek Puzyniak <marek.puzyniak@tieto.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
