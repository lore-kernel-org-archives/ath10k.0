Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsaKX-0006SQ-C2
 for ath10k@lists.infradead.org; Mon, 16 Dec 2013 15:43:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: fix host corruption
References: <1386858261-16037-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 16 Dec 2013 17:43:10 +0200
In-Reply-To: <1386858261-16037-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 12 Dec 2013 15:24:18 +0100")
Message-ID: <874n68g5td.fsf@kamboji.qca.qualcomm.com>
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

> This patchset aims at fixing (or at least
> reducing) the frequency of a (apparently) strange
> HW bug.
>
> The bug happens in some workloads with different
> frequency with different hardware spinoffs. It is
> triggered by a cold reset after HW/FW has been
> excercised with some work.
>
> On x86 this could be a hang, on AP135 it is a data
> bus error.
>
>
> Michal Kazior (3):
>   ath10k: fix device initialization routine
>   ath10k: zero device DRAM to avoid host hangs
>   ath10k: zero CE config upon deinit

Let's put these patches on hold for now while we investigate more about
this problem.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
