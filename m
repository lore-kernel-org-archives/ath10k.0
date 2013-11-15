Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhFN8-00026S-7U
 for ath10k@lists.infradead.org; Fri, 15 Nov 2013 09:07:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: clear tx status before submitting to mac80211
References: <1384421658-7295-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 15 Nov 2013 11:06:55 +0200
In-Reply-To: <1384421658-7295-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 14 Nov 2013 10:34:18 +0100")
Message-ID: <87eh6i3ufk.fsf@kamboji.qca.qualcomm.com>
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

> Garbage was reported in ieee80211_tx_info. This
> led to a WARN_ON in cfg80211_calculate_bitrate().
>
> This also fixes some random tx bitrate values
> reported through `iw` command.
>
> Reported-By: Kalle Valo <kvalo@qca.qualcomm.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
