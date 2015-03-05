Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTWYD-0006xb-Lh
 for ath10k@lists.infradead.org; Thu, 05 Mar 2015 14:15:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Enable encrytion of ADDBA request in PMF
 configuration
References: <1425118689-32553-1-git-send-email-sjegadee@qti.qualcomm.com>
Date: Thu, 5 Mar 2015 16:14:26 +0200
In-Reply-To: <1425118689-32553-1-git-send-email-sjegadee@qti.qualcomm.com>
 (SenthilKumar Jegadeesan's message of "Sat, 28 Feb 2015 15:48:09
 +0530")
Message-ID: <87bnk74jlp.fsf@kamboji.qca.qualcomm.com>
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
To: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com> writes:

> In HT mode, firmware is not encrypting ADDBA request as PMF
> configuration is not set in peer flags during association.
>
> Set peer flags for MFP enabled station in ath10k driver.
>
> Implemented abstraction layer for peer flags.
>
> This change depends on mac80211 patch "[PATCH] mac80211: send
> station PMF configuration to driver".
>
> Signed-off-by: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>

Typo in the title "encrytion".

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
