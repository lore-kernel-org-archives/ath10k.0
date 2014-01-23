Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Iwb-0006qo-AZ
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 11:59:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: add CSA support
References: <1390473506-15677-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 23 Jan 2014 13:59:08 +0200
In-Reply-To: <1390473506-15677-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 23 Jan 2014 11:38:24 +0100")
Message-ID: <87ha8u6h9v.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This is a refactored and rewritten AP CSA patch
> split into 2. As a bonus this fixes STA CSA as
> well.
>
>
> Michal Kazior (2):
>   ath10k: implement channel switching
>   ath10k: implement AP CSA

Oddly enough only the cover letter was delivered to ath10k list, no idea
what happened to the patches. But I can get the patches from
linux-wireless lists.

But do these patches depend to any mac80211 or cfg80211 patches. Or is
it safe to take these to my ath-next branch?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
