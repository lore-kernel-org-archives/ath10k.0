Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alhua-0007pN-8E
 for ath10k@lists.infradead.org; Thu, 31 Mar 2016 19:05:44 +0000
Subject: Re: [PATCH 3/3] ath10k: fix unconditional num_mpdus_ready subtraction
References: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1459352551-11773-3-git-send-email-rmanohar@qti.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56FD71D3.5090103@candelatech.com>
Date: Thu, 31 Mar 2016 11:52:03 -0700
MIME-Version: 1.0
In-Reply-To: <1459352551-11773-3-git-send-email-rmanohar@qti.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, rmanohar@codeaurora.org

On 03/30/2016 08:42 AM, Rajkumar Manoharan wrote:
> Decrement num_mpdus_ready only when rx amsdu is processed successfully.
> Not doing so, will result in leak and impact stabilty under low memory
> cases.

Should this patch be rebased on top of the "ath10k: process htt rx indication as batch mode" patch?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
