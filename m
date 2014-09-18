Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUWUs-0008Q6-89
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 07:51:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 00/10] ath10k: checkpatch fixes from v3.17
References: <20140914094728.9063.32593.stgit@x230>
Date: Thu, 18 Sep 2014 10:50:54 +0300
In-Reply-To: <20140914094728.9063.32593.stgit@x230> (Kalle Valo's message of
 "Sun, 14 Sep 2014 12:49:55 +0300")
Message-ID: <87r3z9s6xt.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Hi,
>
> some fixes to recently added checkpatch warnings. Please review.
>
> Kalle
>
> ---
>
> Kalle Valo (10):
>       ath10k: fix parenthesis alignment warning in ath10k_htt_rx_alloc()
>       ath10k: fix checkpatch warnings about parenthesis alignment
>       ath10k: fix use of multiple blank lines
>       ath10k: fix missing a blank line after declarations
>       ath10k: fix space after a cast style errors
>       ath10k: don't use return on void functions
>       ath10k: else is not generally useful after a break or return
>       ath10k: miscellaneous checkpatch fixes
>       ath10k: reformat help text in ath10k_read_simulate_fw_crash()
>       ath10k: use ether_addr_copy()

All ten applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
