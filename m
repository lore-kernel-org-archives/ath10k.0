Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFEdd-000456-2E
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 08:35:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 6/6] ath10k: reporting estimated tx airtime for fairness
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
 <1540033534-11211-7-git-send-email-rmanohar@codeaurora.org>
Date: Wed, 24 Oct 2018 11:35:22 +0300
In-Reply-To: <1540033534-11211-7-git-send-email-rmanohar@codeaurora.org>
 (Rajkumar Manoharan's message of "Sat, 20 Oct 2018 04:05:34 -0700")
Message-ID: <875zxru4hh.fsf@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: Kan Yan <kyan@google.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@codeaurora.org> writes:

> Transmit airtime will be estimated from last tx rate used.
> Firmware report tx rate by peer stats. Airtime is computed
> on tx path and the same will be reported to mac80211 upon
> tx completion.
>
> Signed-off-by: Kan Yan <kyan@google.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>

Same comments as in patch 5 about "From:" and Co-developed-by tags.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
