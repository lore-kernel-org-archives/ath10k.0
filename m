Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYTyH-0004re-Mf
 for ath10k@lists.infradead.org; Fri, 11 Apr 2014 05:25:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ath10k: fix radar/cac
References: <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 11 Apr 2014 08:25:20 +0300
In-Reply-To: <1396610926-5787-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Apr 2014 13:28:44 +0200")
Message-ID: <87bnw8h1z3.fsf@kamboji.qca.qualcomm.com>
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

> Hi,
>
> This loosely depends on `ath10k: refactor monitor
> code`. Without it patch this patchset introduces
> some (harmless) runtime warnings.
>
> This v2 introduces a non-functional patch to avoid
> forward declaration. The [1/2] has a little
> conflict with `ath10k: refactor monitor code`
> which renames ath10k_monitor_stop() to
> ath10k_monitor_vdev_stop().
>
> Part of the original CAC problem is also addressed
> in `mac80211: fix radar_enabled propagation`.
>
>
> Michal Kazior (2):
>   ath10k: reorder functions
>   ath10k: refactor radar detection code

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
