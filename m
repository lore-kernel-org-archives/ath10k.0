Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bugee-0006ey-0A
 for ath10k@lists.infradead.org; Thu, 13 Oct 2016 14:06:41 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Cleanup calling ath10k_htt_rx_h_unchain
Date: Thu, 13 Oct 2016 14:06:09 +0000
Message-ID: <877f9ccpim.fsf@kamboji.qca.qualcomm.com>
References: <1475596199-4563-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1475596199-4563-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Tue, 4 Oct 2016 21:19:59	+0530")
Content-Language: en-US
Content-ID: <607CD885DD6FEC41878F656DF707168D@qualcomm.com>
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> 'ath10k_htt_rx_h_unchain' needs to be called only if the return
> value from 'ath10k_htt_rx_amsdu_pop' is 1('chained msdu's'), this
> change makes it more explicit and avoids doing a skb_peek, fetching
> rx descriptor pointer, checking rx msdu decap format for the case of
> ret = 0 (unchained msdus). Found this change during code walk through,
> not sure if this addresses any issue.
>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Applied to ath-next, thanks.

(The SMTP server failed, needed to send this manually)

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
