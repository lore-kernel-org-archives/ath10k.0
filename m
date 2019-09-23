Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCMEw-0000Ba-U1
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 11:10:48 +0000
MIME-Version: 1.0
Date: Mon, 23 Sep 2019 19:10:46 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add fw coredump for sdio when firmware assert
In-Reply-To: <87zhixamyp.fsf@codeaurora.org>
References: <1567132338-7407-1-git-send-email-wgong@codeaurora.org>
 <87zhixamyp.fsf@codeaurora.org>
Message-ID: <b8298efd20f3d05a38866b687f597c30@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-09-21 19:49, Kalle Valo wrote:

> After looking more closely, the ar->bmi.done_set checks in bmi.c does
> not look necessary to me, I have never seen that warning. I would 
> remove
> those and the done_sent field altogether from ath10k to make the code
> cleaner and I avoid hacks like above. This should be done in a separate
> patch, of course.

so I will use it this patch :)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
