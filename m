Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b0AdH-0002Lw-FF
 for ath10k@lists.infradead.org; Tue, 10 May 2016 16:35:39 +0000
Subject: Re: [PATCH] ath10k: Fix 10.4 extended peer stats update
References: <1462897645-16219-1-git-send-email-mohammed@qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <57320DAF.2040508@candelatech.com>
Date: Tue, 10 May 2016 09:34:55 -0700
MIME-Version: 1.0
In-Reply-To: <1462897645-16219-1-git-send-email-mohammed@qca.qualcomm.com>
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org

On 05/10/2016 09:27 AM, Mohammed Shafi Shajakhan wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> 10.4 'extended peer stats' will be not be appended with normal peer stats
> data and they shall be coming in separate chunks. Fix this by maintaining
> a separate linked list 'extender peer stats' for 10.4 and update
> rx_duration for per station statistics. Also parse through beacon filter
> (if enabled), to make sure we parse the extended peer stats properly.
> This issue was exposed when more than one client is connected and
> extended peer stats for 10.4 is enabled

In general, maybe more of these stats should be kept in the driver instead
of the firmware?  The firmware is very tight on RAM already, and if
we can pass the needed info back to the host, it could gather arbitrary
amounts of stats as needed.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
