Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8mif-00056Y-1F
 for ath10k@lists.infradead.org; Thu, 30 Jan 2014 08:11:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: properly return err from start()
References: <52E8248F.8090601@candelatech.com>
 <1390976791-9223-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 30 Jan 2014 10:10:59 +0200
In-Reply-To: <1390976791-9223-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 29 Jan 2014 07:26:31 +0100")
Message-ID: <87r47pyjn0.fsf@kamboji.qca.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> If recovery failed ath10k returned 0 (success) and
> mac80211 continued to call other driver callbacks.
> This caused null dereference.
>
> This is how the failure looked like:
>
> ath10k: ctl_resp never came in (-110)
> ath10k: failed to connect to HTC: -110
> ath10k: could not init core (-110)
> BUG: unable to handle kernel NULL pointer dereference at           (null)

[...]

> Reported-By: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

> Thanks for reporting, Ben!

Indeed, thanks Ben. Please keep the reports coming :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
