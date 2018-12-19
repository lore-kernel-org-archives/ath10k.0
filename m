Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZbrF-0001nP-8m
 for ath10k@lists.infradead.org; Wed, 19 Dec 2018 13:25:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 6/6] ath10k: reporting estimated tx airtime for fairness
References: <1545181331-5288-1-git-send-email-rmanohar@codeaurora.org>
 <1545181331-5288-7-git-send-email-rmanohar@codeaurora.org>
Date: Wed, 19 Dec 2018 15:25:37 +0200
In-Reply-To: <1545181331-5288-7-git-send-email-rmanohar@codeaurora.org>
 (Rajkumar Manoharan's message of "Tue, 18 Dec 2018 17:02:11 -0800")
Message-ID: <87k1k5veb2.fsf@kamboji.qca.qualcomm.com>
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
Cc: Kan Yan <kyan@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@codeaurora.org> writes:

> From: Kan Yan <kyan@google.com>
>
> Transmit airtime will be estimated from last tx rate used.
> Firmware report tx rate by peer stats. Airtime is computed
> on tx path and the same will be reported to mac80211 upon
> tx completion.
>
> This change is based on Kan's orginal commit in Chromium tree
> ("CHROMIUM: ath10k: Implementing airtime fairness based TX scheduler")
> ref: https://chromium-review.googlesource.com/588190
>
> Signed-off-by: Kan Yan <kyan@google.com>
> [rmanohar@codeaurora.org: ported only the airtime computation]
> Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>

Same as with patch 5, let me know the tested hardware and firmware so I
can add it to the commit log.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
