Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLWnN-0004Up-7T
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 14:30:21 +0000
MIME-Version: 1.0
Subject: Re: ath10k: implement NAPI support
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160627055128.7005-1-rmanohar@qti.qualcomm.com>
Message-ID: <6169ec35e7d9438180c60909a96390ae@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 16:29:53 +0200
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, rmanohar@codeaurora.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> Add NAPI support for rx and tx completion. NAPI poll is scheduled
> from interrupt handler. The design is as below
> 
>  - on interrupt
>      - schedule napi and mask interrupts
>  - on poll
>    - process all pipes (no actual Tx/Rx)
>    - process Rx within budget
>    - if quota exceeds budget reschedule napi poll by returning budget
>    - process Tx completions and update budget if necessary
>    - process Tx fetch indications (pull-push)
>    - push any other pending Tx (if possible)
>    - before resched or napi completion replenish htt rx ring buffer
>    - if work done < budget, complete napi poll and unmask interrupts
> 
> This change also get rid of two tasklets (intr_tq and txrx_compl_task).
> 
> Measured peak throughput with NAPI on IPQ4019 platform in controlled
> environment. No noticeable reduction in throughput is seen and also
> observed improvements in CPU usage. Approx. 15% CPU usage got reduced
> in UDP uplink case.
> 
> DL: AP DUT Tx
> UL: AP DUT Rx
> 
> IPQ4019 (avg. cpu usage %)
> 
> ========
>                 TOT              +NAPI
>               ===========      =============
> TCP DL       644 Mbps (42%)    645 Mbps (36%)
> TCP UL       673 Mbps (30%)    675 Mbps (26%)
> UDP DL       682 Mbps (49%)    680 Mbps (49%)
> UDP UL       720 Mbps (28%)    717 Mbps (11%)
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

This is quite big change and I'm planning to queue this for 4.9. So I'm not
applying this quite yet.

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9199911/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
