Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWaVC-0000tz-1Q
 for ath10k@lists.infradead.org; Thu, 07 May 2020 06:59:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Remove msdu from idr when management pkt send
 fails
References: <1588667015-25490-1-git-send-email-pillair@codeaurora.org>
 <875zd88ei8.fsf@kamboji.qca.qualcomm.com>
 <000001d62436$f253f230$d6fbd690$@codeaurora.org>
Date: Thu, 07 May 2020 09:59:05 +0300
In-Reply-To: <000001d62436$f253f230$d6fbd690$@codeaurora.org>
 (pillair@codeaurora.org's message of "Thu, 7 May 2020 11:45:42 +0530")
Message-ID: <871rnw8c3q.fsf@kamboji.qca.qualcomm.com>
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
To: pillair@codeaurora.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

<pillair@codeaurora.org> writes:

> Yes, The change you did is correct and better.

Thanks for checking.

> So should I be sending a v3 for this patch ?

No need, the patch with this change is now in my pending branch and I'll
apply it to ath-next it in the next few days.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
