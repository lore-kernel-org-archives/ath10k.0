Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Bv7-0005vr-MK
 for ath10k@lists.infradead.org; Wed, 17 Dec 2014 10:33:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: send (re)assoc peer command when NSS changed
References: <1418719980-19753-1-git-send-email-janusz.dziedzic@tieto.com>
 <1418719980-19753-2-git-send-email-janusz.dziedzic@tieto.com>
Date: Wed, 17 Dec 2014 12:32:45 +0200
In-Reply-To: <1418719980-19753-2-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Tue, 16 Dec 2014 09:53:00 +0100")
Message-ID: <87a92mr2gi.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Assoc peer command contain information about NSS.
> When we will get IEEE80211_RC_NSS_CHANGED we should
> also send (re) assoc peer command to be sure firmware
> will know about it and RC will work correctly.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

Does this fix a user visible bug or is this something you just found
from doing code review?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
