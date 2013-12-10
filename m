Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqPMC-0003QJ-1B
 for ath10k@lists.infradead.org; Tue, 10 Dec 2013 15:36:20 +0000
Message-ID: <52A734D9.3000506@candelatech.com>
Date: Tue, 10 Dec 2013 07:35:53 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: split the if_limits and if_comb
References: <1386688840-12181-1-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1386688840-12181-1-git-send-email-bartosz.markowski@tieto.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 12/10/2013 07:20 AM, Bartosz Markowski wrote:
> Split the interface limits and inteface combination,
> to reflect the 10.X capabilites (no P2P, no STA and 8 VAP).

My 10.X firmware works just fine with stations..I just tested up
to 32 of them.

Maybe add firmware IEs to explicitly advertise how many it can
support instead of setting one flag and making assumptions?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
