Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWRzc-0007ck-DR
 for ath10k@lists.infradead.org; Mon, 31 Aug 2015 16:31:36 +0000
Subject: Re: [PATCH] ath10k: Drop probe responses when too many are queued
References: <1441019095-2364-1-git-send-email-nataraja@qti.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <55E48151.9080609@candelatech.com>
Date: Mon, 31 Aug 2015 09:31:13 -0700
MIME-Version: 1.0
In-Reply-To: <1441019095-2364-1-git-send-email-nataraja@qti.qualcomm.com>
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
To: Vivek Natarajan <nataraja@qti.qualcomm.com>, kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 08/31/2015 04:04 AM, Vivek Natarajan wrote:
> In a noisy environment, when multiple interfaces are created,
> the management tx descriptors are fully occupied by the probe
> responses from all the interfaces. This prevents a new station
> from a successful association.
>
> Fix this by limiting the probe responses when the specified
> threshold limit is reached.

Is this useful when firmware supports management-tx over HTT (instead of WMI)?

Or just for WMI mgt?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
