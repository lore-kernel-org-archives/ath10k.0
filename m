Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9T8T-0006Rh-R1
 for ath10k@lists.infradead.org; Fri, 20 Apr 2018 10:19:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 8/9] ath10k: use request_firmware_nowarn to load firmware
References: <20180417153307.3693-1-andresx7@gmail.com>
 <20180417153307.3693-9-andresx7@gmail.com>
Date: Fri, 20 Apr 2018 13:19:06 +0300
In-Reply-To: <20180417153307.3693-9-andresx7@gmail.com> (Andres Rodriguez's
 message of "Tue, 17 Apr 2018 11:33:06 -0400")
Message-ID: <87lgdii3j9.fsf@kamboji.qca.qualcomm.com>
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
To: Andres Rodriguez <andresx7@gmail.com>
Cc: arend.vanspriel@broadcom.com, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, mcgrof@kernel.org, ckoenig.leichtzumerken@gmail.com, alexdeucher@gmail.com

(adding linux-wireless and ath10k lists)

Andres Rodriguez <andresx7@gmail.com> writes:

> This reduces the unnecessary spew when trying to load optional firmware:
> "Direct firmware load for ... failed with error -2"
>
> Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Kalle Valo <kvalo@codeaurora.org>

But I think it would be good to change also request_firmware_direct() in
ath10k/testmode.c to request_firmware_nowarn().

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
