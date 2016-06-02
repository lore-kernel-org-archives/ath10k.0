Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8TXm-0007SM-FK
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 14:24:19 +0000
Date: Thu, 2 Jun 2016 19:52:32 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v2 1/2] ath10k: remove duplicate and unused rx rate flags
Message-ID: <20160602142232.GA4729@atheros-ThinkPad-T61>
References: <1464852235-13110-1-git-send-email-mohammed@qca.qualcomm.com>
 <87a8j3zout.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a8j3zout.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

On Thu, Jun 02, 2016 at 01:45:15PM +0000, Valo, Kalle wrote:
> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:
> 
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> > All these flags are not used and their use is completely
> > covered by 'ath10k_hw_rate_ofdm', 'ath10k_hw_rate_cck',
> > and RX_PPDU_START_RATE_FLAG
> >
> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > Patchwork-Id: 9129361
> > Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> 
> I guess you took this patch from the pending branch? :) The Patchwork-Id
> line is something which my script adds for patches in the pending
> branch, and removes them before applying them to ath-next, but this line
> should not be visible when submitting patches.
>
[shafi] yes i am sorry :-( will send v3.

regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
