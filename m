Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agpFj-0006M6-Ih
 for ath10k@lists.infradead.org; Fri, 18 Mar 2016 07:55:24 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: free cached fw bin contents when get board id
 fails
Date: Fri, 18 Mar 2016 07:54:46 +0000
Message-ID: <87a8lwi5kq.fsf@kamboji.qca.qualcomm.com>
References: <1457585707-11344-1-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1457585707-11344-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Thu, 10 Mar 2016 10:25:07 +0530")
Content-Language: en-US
Content-ID: <6906A8A5BBA4EC44888A2B12962B4D07@qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Raja Mani <rmani@qti.qualcomm.com> writes:

> ath10k_core_probe_fw() simply returns error without freeing
> cached firmware file content when get board id operation fails.
> Free cached fw bin data in failure case to avoid memory leak.
>
> Fixes: db0984e51a18 ("ath10k: select board data based on BMI chip id and board id")
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
