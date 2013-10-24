Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZDi7-0005ci-Bq
 for ath10k@lists.infradead.org; Thu, 24 Oct 2013 05:43:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: tx power fixes
References: <1382526135-3215-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 24 Oct 2013 08:43:28 +0300
In-Reply-To: <1382526135-3215-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 23 Oct 2013 04:02:12 -0700")
Message-ID: <87iownjkan.fsf@kamboji.qca.qualcomm.com>
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
> This patchset fixes power units used in ath10k and
> also make it respect (user) configurable tx power.
>
>
> Michal Kazior (3):
>   ath10k: setup min channel power to a reasonable value
>   ath10k: use proper tx power unit
>   ath10k: respect power_level values

Thanks, all patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
