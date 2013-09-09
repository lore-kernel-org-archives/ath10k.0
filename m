Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VIwOy-00071W-NG
 for ath10k@lists.infradead.org; Mon, 09 Sep 2013 08:00:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: prevent CE from looping indefinitely
References: <1378213798-24769-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 9 Sep 2013 11:00:11 +0300
In-Reply-To: <1378213798-24769-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 3 Sep 2013 15:09:58 +0200")
Message-ID: <87txhuctmc.fsf@kamboji.qca.qualcomm.com>
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

> The double while() could end up running forever.
> Inner while() would complete very fast. However
> the completion processing could take enough time
> for more completions to flow in. In that case the
> outer while() would not terminate and run again,
> and again. This could happen especially on a slow
> host system.
>
> This could lead to a system freeze during heavy
> traffic. Note: this doesn't solve all known
> starvation issues yet.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
