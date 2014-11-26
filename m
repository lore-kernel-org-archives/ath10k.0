Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWFJ-0004pD-7o
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 06:38:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ath10k: Fix shared WEP
References: <1416896220-29691-1-git-send-email-sujith@msujith.org>
Date: Wed, 26 Nov 2014 08:38:10 +0200
In-Reply-To: <1416896220-29691-1-git-send-email-sujith@msujith.org> (Sujith
 Manoharan's message of "Tue, 25 Nov 2014 11:46:58 +0530")
Message-ID: <87lhmyxy99.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> When static keys are used in shared WEP, when a
> station is associated, message 3 is sent with an
> encrypted payload. But, for subsequent
> authentications that are triggered without a
> deauth, the auth frame is decrypted by the HW.
>
> To handle this, check if the WEP keys have already
> been set for the peer and if so, mark the
> frame as decrypted. This scenario can happen
> when a station changes its default TX key and initiates
> a new authentication sequence.
>
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>

Thanks, all three applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
