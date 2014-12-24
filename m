Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3nsU-0002Rd-Sl
 for ath10k@lists.infradead.org; Wed, 24 Dec 2014 15:29:35 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath: fix incorrect PPB on FCC radar type 5
References: <1418669734-12921-1-git-send-email-poh@qca.qualcomm.com>
Date: Wed, 24 Dec 2014 17:29:07 +0200
In-Reply-To: <1418669734-12921-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Mon, 15 Dec 2014 10:55:34 -0800")
Message-ID: <87sig583ss.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> The minimum number of pulses per burst on FCC radar type 5 is 1.
> Use this number for correct radar detection.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied to wireless-drivers-next.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
