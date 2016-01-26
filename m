Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO5AO-0000mi-Su
 for ath10k@lists.infradead.org; Tue, 26 Jan 2016 15:04:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Remove the p2p notice of absence info from 10.2.4
 FW beacon info
References: <1452814759-20377-1-git-send-email-yanbol@qca.qualcomm.com>
Date: Tue, 26 Jan 2016 17:03:50 +0200
In-Reply-To: <1452814759-20377-1-git-send-email-yanbol@qca.qualcomm.com>
 (Yanbo Li's message of "Thu, 14 Jan 2016 15:39:19 -0800")
Message-ID: <87lh7cpell.fsf@kamboji.qca.qualcomm.com>
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
To: Yanbo Li <yanbol@qca.qualcomm.com>
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yanbo Li <yanbol@qca.qualcomm.com> writes:

> The p2p NOA never been supported at 10.2.4 FW, remove it to avoid SWBA
> event parse error for multi beacon interval case.
>
> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
