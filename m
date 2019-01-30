Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gompp-0005eb-7A
 for ath10k@lists.infradead.org; Wed, 30 Jan 2019 10:11:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH for-5.0] ath10k: correct bus type for WCN3990
References: <20190129231201.42230-1-briannorris@chromium.org>
Date: Wed, 30 Jan 2019 12:11:01 +0200
In-Reply-To: <20190129231201.42230-1-briannorris@chromium.org> (Brian Norris's
 message of "Tue, 29 Jan 2019 15:12:01 -0800")
Message-ID: <87k1imlakq.fsf@kamboji.qca.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, Erik Stromdahl <erik.stromdahl@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Brian Norris <briannorris@chromium.org> writes:

> WCN3990 is SNOC, not PCI. This prevents probing WCN3990.
>
> Fixes: 367c899f622c ("ath10k: add bus type check in ath10k_init_hw_params")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> This was a regression in 4.20.

I'll queue this for 5.0.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
