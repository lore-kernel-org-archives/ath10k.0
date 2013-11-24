Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vka6r-0003aT-OG
 for ath10k@lists.infradead.org; Sun, 24 Nov 2013 13:52:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: fix Tx status clearing
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
 <1385126819-15311-4-git-send-email-michal.kazior@tieto.com>
Date: Sun, 24 Nov 2013 15:51:58 +0200
In-Reply-To: <1385126819-15311-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 22 Nov 2013 14:26:59 +0100")
Message-ID: <87fvqlsy9t.fsf@kamboji.qca.qualcomm.com>
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

> Too much of tx info was being cleared. This caused
> issues in some setups.
>
> Reported-By: Matti Laakso <malaakso@elisanet.fi>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Please describe the issues (or at least some of them) in the commit log.
The idea is that an advanced ath10k user will understand what kind of
bug (from user's point of view) this patch is fixing.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
