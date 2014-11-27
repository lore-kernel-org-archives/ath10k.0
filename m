Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtyY8-0002lY-2r
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 12:51:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: remove unused callback argument
References: <1417082978-1701-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 27 Nov 2014 14:51:28 +0200
In-Reply-To: <1417082978-1701-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 27 Nov 2014 11:09:36 +0100")
Message-ID: <87tx1ku7qn.fsf@kamboji.qca.qualcomm.com>
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

> This wasn't used since forever and there are no
> plans on using it.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I modified the title to get it more unique:

ath10k: remove unused callback argument from struct ath10k_hif_cb::rx_completion

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
