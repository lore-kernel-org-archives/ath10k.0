Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqMEh-0002ea-69
 for ath10k@lists.infradead.org; Mon, 26 Feb 2018 17:06:50 +0000
MIME-Version: 1.0
Date: Mon, 26 Feb 2018 22:36:35 +0530
From: periyasa@codeaurora.org
Subject: Re: [PATCH] Revert "ath10k: send (re)assoc peer command when NSS
 changed"
In-Reply-To: <aedd8281-ee1b-e5ae-2521-fd3a7a221dd6@candelatech.com>
References: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
 <aedd8281-ee1b-e5ae-2521-fd3a7a221dd6@candelatech.com>
Message-ID: <dd7bb2acd1be43346315d7bb349b45b2@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,


> Can you share exactly which resource the firmware ran out of?  It would 
> seem to
> be a FW bug if it is leaking, so maybe it can be fixed as well...
> 

Firmware have total user_id = 528 (512 clients + 16 VAPs). Each user_id 
is allocated to peer when Firmware receive the WMI_PEER_ASSOC_CMDID 
request from host driver. Firmware free the user_id in peer delete 
operation.

Regards,
Karthikeyan P.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
