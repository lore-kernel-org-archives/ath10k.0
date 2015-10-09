Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkT9J-0004Ef-RJ
 for ath10k@lists.infradead.org; Fri, 09 Oct 2015 08:35:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Increase pci wakeup timeout to 30 ms
References: <1443104640-13965-1-git-send-email-c_mkenna@qti.qualcomm.com>
Date: Fri, 9 Oct 2015 11:34:53 +0300
In-Reply-To: <1443104640-13965-1-git-send-email-c_mkenna@qti.qualcomm.com> (c.
 mkenna's message of "Thu, 24 Sep 2015 19:54:00 +0530")
Message-ID: <87lhbcsamq.fsf@kamboji.qca.qualcomm.com>
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
To: c_mkenna@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

<c_mkenna@qti.qualcomm.com> writes:

> From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
>
> It is noticed that pci wakeup time is exceeding current timeout (10ms)
> randomly which is tested on QCA988x. So, the wake up time is increased
> to 30 ms and added debug prints to log total timeout.
>
> Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
