Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAqWY-0005lp-E1
 for ath10k@lists.infradead.org; Tue, 24 Apr 2018 05:29:55 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 9/9] ath10k: re-enable the firmware fallback mechanism for
 testmode
References: <20180423201205.20533-1-andresx7@gmail.com>
 <20180423201205.20533-10-andresx7@gmail.com>
Date: Tue, 24 Apr 2018 08:29:38 +0300
In-Reply-To: <20180423201205.20533-10-andresx7@gmail.com> (Andres Rodriguez's
 message of "Mon, 23 Apr 2018 16:12:05 -0400")
Message-ID: <87fu3lcgu5.fsf@kamboji.qca.qualcomm.com>
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
Cc: arend.vanspriel@broadcom.com, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, hdegoede@redhat.com, mcgrof@kernel.org, alexdeucher@gmail.com, christian.koenig@amd.com

Andres Rodriguez <andresx7@gmail.com> writes:

> The ath10k testmode uses request_firmware_direct() in order to avoid
> producing firmware load warnings. Disabling the fallback mechanism was a
> side effect of disabling warnings.
>
> We now have a new API that allows us to avoid warnings while keeping the
> fallback mechanism enabled. So use that instead.
>
> Signed-off-by: Andres Rodriguez <andresx7@gmail.com>

Thanks!

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
