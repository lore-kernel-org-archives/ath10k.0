Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYFFx-0003pG-B0
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 13:43:05 +0000
Message-ID: <53469FD3.8040001@candelatech.com>
Date: Thu, 10 Apr 2014 06:42:43 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: double check bmi xfer pointers
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 04/10/2014 03:05 AM, Michal Kazior wrote:
> If for some reason copy engine ring buffer became
> corrupt ath10k could crash the machine due to
> invalid pointer dereference. It's very unlikely
> but devices can never be fully trusted so verify
> if the bmi xfer pointer read back from copy engine
> matches the original pointer. The bug looked as
> follows:

Thanks for fixing this.  I'll add this patch to my
tree and run more tests today.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
