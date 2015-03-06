Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTmsA-0006SG-S5
 for ath10k@lists.infradead.org; Fri, 06 Mar 2015 07:40:39 +0000
Date: Fri, 6 Mar 2015 13:09:44 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: fix quiet duration configuration
Message-ID: <20150306073936.GA3982@qca.qualcomm.com>
References: <1424368506-18193-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1424368506-18193-2-git-send-email-rmanohar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1424368506-18193-2-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: mka@google.com, linux-wireless@vger.kernel.org

On Thu, Feb 19, 2015 at 11:25:06PM +0530, Rajkumar Manoharan wrote:
> Duty cycle is nothing but percentage of one period in which a
> signal is active. But it is wrongly interpreted as ratio of quiet
> duration. So fix the quiet duration to the remaining percentage
> of duty cycle (active ratio).
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> ---
Kalle,

Please drop this change as it breaks the user space interface. Will send
updated patch ASAP. Sorry for the inconvenience.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
