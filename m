Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1acDEq-0006Jp-Mo
 for ath10k@lists.infradead.org; Sat, 05 Mar 2016 14:31:25 +0000
Message-ID: <56DAED8E.6020407@candelatech.com>
Date: Sat, 05 Mar 2016 06:30:38 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: move mgmt descriptor limit handle under mgmt_tx
References: <1457187017-12913-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1457187017-12913-1-git-send-email-rmanohar@qti.qualcomm.com>
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



On 03/05/2016 06:10 AM, Rajkumar Manoharan wrote:
> Firmware reserves few descriptors for management frames transmission.
> In 16 MBSSID scenario, these slots will be easy exhausted due to frequent
> probe responses. So for 10.4 based solutions, probe responses are limited
> by a threshold (24).

Do you mean probe requests or probe responses?

A single hardware scan request with lots of ssids in it will utilize all
firmware tx management frames (which is 5, it seems).  In my testing, the
firmware would just never send probe requests for the rest of the ssids
because the firmware scan state machine logic is broken.

If you really do mean responses, then it sounds like it would be better to
use the normal RX path for mgt frames in the firmware...


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
