Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alrUU-0005Tg-Sw
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 05:19:27 +0000
MIME-Version: 1.0
Date: Fri, 01 Apr 2016 10:49:05 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 3/3] ath10k: fix unconditional num_mpdus_ready subtraction
In-Reply-To: <56FD71D3.5090103@candelatech.com>
References: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1459352551-11773-3-git-send-email-rmanohar@qti.qualcomm.com>
 <56FD71D3.5090103@candelatech.com>
Message-ID: <73a1d6a04908fe060559d1a6e9afb128@codeaurora.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

On 2016-04-01 00:22, Ben Greear wrote:
> On 03/30/2016 08:42 AM, Rajkumar Manoharan wrote:
>> Decrement num_mpdus_ready only when rx amsdu is processed 
>> successfully.
>> Not doing so, will result in leak and impact stabilty under low memory
>> cases.
> 
> Should this patch be rebased on top of the "ath10k: process htt rx
> indication as batch mode" patch?
> 
It should be on top of "ath10k: speedup htt rx descriptor processing for 
rx_ind". Instead of sending next version of original series, i sent it 
as follow up.

-Rajkumar



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
