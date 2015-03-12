Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW2II-0007iA-TZ
 for ath10k@lists.infradead.org; Thu, 12 Mar 2015 12:32:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix CAC regression
References: <1425907255-14083-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 12 Mar 2015 14:32:20 +0200
In-Reply-To: <1425907255-14083-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 9 Mar 2015 14:20:55 +0100")
Message-ID: <87y4n2v1kb.fsf@kamboji.qca.qualcomm.com>
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

> Patch `ath10k: fix interrupt storm` introduced a
> regression. The condition responsible for bringing
> up monitor vdev was broken and it was never
> started for CAC so effectivelly CAC would not
> detect radar pulses.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied. I just added the commit id to the commit log.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
