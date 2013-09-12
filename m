Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKA5M-0007bf-Q3
 for ath10k@lists.infradead.org; Thu, 12 Sep 2013 16:49:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/7] ath10k: improve TX path
References: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 12 Sep 2013 19:48:59 +0300
In-Reply-To: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 10 Sep 2013 15:49:56 +0200")
Message-ID: <87ob7ydlz8.fsf@qca.qualcomm.com>
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
> This patchset addresses two issues:
>
>  * system/userspace starvation on heavy briding
>    UDP TX
>  * unstable/inconsistent UDP TX throughput
>
> In short the patchset simplifies TX path by
> removing HTC TX workers, makes WMI commands block
> and makes ath10k more responsive to queues
> becoming full. This contributes to both improved
> throughput and makes the system more responsive
> under heavy UDP TX load.

This looks very good, it's great that we can get rid of the TX workers.
Please submit v2 and I'll apply these.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
