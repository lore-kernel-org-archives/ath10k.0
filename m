Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9cev-0003jy-L9
 for ath10k@lists.infradead.org; Wed, 14 Aug 2013 15:06:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix WEP in AP and IBSS mode
References: <1376387122-18075-1-git-send-email-marek.puzyniak@tieto.com>
Date: Wed, 14 Aug 2013 18:06:11 +0300
In-Reply-To: <1376387122-18075-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Tue, 13 Aug 2013 11:45:22 +0200")
Message-ID: <8761v848ij.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> WEP encoding was not working properly for AP and IBSS mode.
> TX frames were encrypted with default WEP tx key index set
> always to zero, what sometimes was wrong when different
> key index should be used. This patch allows to update
> WEP key index also for AP and IBSS mode.
> Problem detected during automated WEP tests.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
