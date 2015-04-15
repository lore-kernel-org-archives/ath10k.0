Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YiMyV-0006Z1-AG
 for ath10k@lists.infradead.org; Wed, 15 Apr 2015 13:03:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/4] ath10k: ibss crypto fixes
References: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 15 Apr 2015 16:02:56 +0300
In-Reply-To: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 10 Apr 2015 13:23:19 +0000")
Message-ID: <87bnip7ddr.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, janusz.dziedzic@tieto.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> I've mainly tested this on kvalo/pending branch.
> Currently master branch contains 0f611d28fc2e
> ("mac80211: count interfaces correctly for
> combination checks") which breaks IBSS in
> wpa_supplicant due to P2P Device and interface
> combinations. This has been pointed out in the
> following thread:
>
>  [1]: http://thread.gmane.org/gmane.linux.kernel.wireless.general/135570/focus=136643
>
> If someone's interested in running ath10k IBSS
> make sure to use kernel prior to 4.0, revert the
> mentioned mac80211 patch or apply wpa_supplicant
> workaround patch from [1].

Is this IBSS regression fixed now or what's the status?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
