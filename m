Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt8fm-0000GK-3i
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 05:28:23 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21620.5017.657509.251220@gargle.gargle.HOWL>
Date: Tue, 25 Nov 2014 10:58:57 +0530
Subject: Re: [PATCH 1/3] ath10k: Fix shared WEP
In-Reply-To: <87lhn0639s.fsf@kamboji.qca.qualcomm.com>
References: <1416796657-24657-1-git-send-email-sujith@msujith.org>
 <1416796657-24657-2-git-send-email-sujith@msujith.org>
 <87lhn0639s.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo wrote:
> No magic numbers, please. I didn't find anything for IV internals from
> ieee80211.h, not sure if we should add them there or just use ath10k
> internal defines.

We are just retrieving the keyidx from the IV - not sure adding a couple
of macros for "6" and "3" will make any difference.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
