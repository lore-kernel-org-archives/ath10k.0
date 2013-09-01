Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG1HM-0007NN-CT
 for ath10k@lists.infradead.org; Sun, 01 Sep 2013 06:36:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/6] ath10k: CE cleanups
References: <1377068249-26025-1-git-send-email-michal.kazior@tieto.com>
 <1377601683-12072-1-git-send-email-michal.kazior@tieto.com>
Date: Sun, 1 Sep 2013 09:36:30 +0300
In-Reply-To: <1377601683-12072-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 27 Aug 2013 13:07:57 +0200")
Message-ID: <87zjrx6ob5.fsf@kamboji.qca.qualcomm.com>
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

> This patchset contains non-functional changes
> except patch #1 which changes memory allocation
> from dynamic to static.
>
> There is still some more to clean up in PCI/CE
> but it's probably better to keep patchsets compact
> and more frequent.
>
> v2:
>  * fix checkpatch warning (Kalle)
>
>
> Michal.
>
>
> Michal Kazior (6):
>   ath10k: use inline ce_state structure
>   ath10k: remove ce_op_state
>   ath10k: remove unused ce_attr parameters
>   ath10k: rename hif_ce_pipe_info to ath10k_pci_pipe
>   ath10k: rename ce_state to ath10k_ce_pipe
>   ath10k: rename ce_ring_state to ath10k_ce_ring

Applied all six, thanks.

I dropped the lock addition from patch 1 and patch 5 had a conflict due
to that change. Please double check that I didn't break anything.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
