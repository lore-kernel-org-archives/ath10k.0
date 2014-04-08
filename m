Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXPk5-0006MQ-JW
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 06:42:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: refactor monitor code
References: <1396610305-5229-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 8 Apr 2014 09:42:01 +0300
In-Reply-To: <1396610305-5229-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Apr 2014 13:18:25 +0200")
Message-ID: <87y4zgmifa.fsf@kamboji.qca.qualcomm.com>
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

> It was possible to create/delete/start/stop
> monitor vdev from a few places that were not
> exclusively protected against each other. This
> resulted in monitor vdev being stopped/removed by
> one call origin while another one was expecting it
> to continue running.
>
> For example if CAC was started and interface's
> promiscuous mode was toggled monitor vdev was
> removed from the driver meaning no radar would be
> detected. In additional a warning would be printed
> upon CAC completion complaining it tried to stop
> non-running monitor vdev.
>
> The patch simplifies monitor code by removing
> IEEE80211_HW_WANT_MONITOR_VIF (which wasn't really
> ever needed) and improves state tracking. It also
> unifies prints.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
