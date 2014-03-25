Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMIV-0001QO-8k
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 08:01:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: dont call csa_finish more than once
References: <1395410520-26939-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 25 Mar 2014 10:00:54 +0200
In-Reply-To: <1395410520-26939-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 21 Mar 2014 15:02:00 +0100")
Message-ID: <87d2ha3dxl.fsf@kamboji.qca.qualcomm.com>
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

> Driver is supposed to call it only once for each
> scheduled channel_switch_beacon().
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
> This is required for multi-vif csa but since that
> isn't merged yet I'm not including any specifics
> in the commit log itself.
>
> Preventing multiple ieee80211_csa_finish() calls
> sounds like a good idea in general to me.

Based on the discussion I'm dropping this. Please resend if we actually
want to have this in ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
