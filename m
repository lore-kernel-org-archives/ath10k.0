Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbVox-0005vd-8x
 for ath10k@lists.infradead.org; Tue, 07 Oct 2014 14:32:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add tracing for frame transmission
References: <1412615346-18010-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Tue, 7 Oct 2014 17:32:30 +0300
In-Reply-To: <1412615346-18010-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Mon, 6 Oct 2014 22:39:06 +0530")
Message-ID: <87lhoshrwh.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Add tracing support to forward management and data frames to
> user space for packet inspection.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

My assumption is that this patch superseded the patches below. Please
let me know if I have misunderstood.

!  [  27: Rajkumar Manoharan     ] [PATCH 0/4] ath10k: Add tracing for tx and rx frames
!      [  70: Rajkumar Manoharan     ] [PATCH 1/4] ath10k: add tracepoint for wmi mgmt tx frames
!      [  68: Rajkumar Manoharan     ] [PATCH 2/4] ath10k: add tracepoint for wmi bcn tx
!      [  72: Rajkumar Manoharan     ] [PATCH 3/4] ath10k: add htt rx tracepoints
!      [  80: Rajkumar Manoharan     ] [PATCH 4/4] ath10k: add tracepoint for htt tx frames
!  [  80: Rajkumar Manoharan     ] [PATCH 1/2] ath10k: add tracepoint for htt tx frames
!      [ 105: Rajkumar Manoharan     ] [PATCH 2/2] ath10k: add tracing for frame transmission

For the future: it's a lot easier if you add a cover letter for the
patch series, keep the cover letter title unchanged and just increase
the version number after each revision. That way I can immeaditely see
what patches I should take or ignore.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
