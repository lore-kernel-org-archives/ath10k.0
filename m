Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtW9W-0000ez-69
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 06:32:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: fix offchan reliability
References: <1416837513-13386-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 26 Nov 2014 08:32:06 +0200
In-Reply-To: <1416837513-13386-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 24 Nov 2014 14:58:31 +0100")
Message-ID: <87y4qyxyjd.fsf@kamboji.qca.qualcomm.com>
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

> New firmware revisions don't need peer creation
> when doing offchannel tx. Earlier revisions would
> queue and never release frames without a peer.
>
> This prevent new firmware revisions from stopping
> replenishing wmi-htc tx credits and improves
> reliability of offchannel tx which would sometimes
> silently fail.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, all three patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
