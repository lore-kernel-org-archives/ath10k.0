Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJRWN-0007tx-Ns
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 17:46:53 +0000
Message-ID: <5310CB75.9030706@candelatech.com>
Date: Fri, 28 Feb 2014 09:46:29 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add recalc RTS/CTS protection method
References: <1393571908-23734-1-git-send-email-marek.kwaczynski@tieto.com>
In-Reply-To: <1393571908-23734-1-git-send-email-marek.kwaczynski@tieto.com>
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
To: bartosz.markowski@tieto.com
Cc: Marek Kwaczynski <marek.kwaczynski@tieto.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 02/27/2014 11:18 PM, bartosz.markowski@tieto.com wrote:
> From: Marek Kwaczynski <marek.kwaczynski@tieto.com>
> 
> Add recalculation of RTS/CTS protection when one or more legacy
> stations are connected to ath10k. In this case enable RTS/CTS
> protection and set sw retry profile are needed in the FW.
> Without this change legacy station is starved and has very low
> throughput.

> -			ath10k_warn("Failed to set CTS prot for VDEV: %d\n",
> -				    arvif->vdev_id);
> +			ath10k_warn("failed to recalc RTS/CTS prot %d\n",
> +				    ret);

Did you remove the vdev ID from the logging message on purpose?

I find having vdev ID in logging messages helps, especially when
trying to compare firmware logs with the driver logs...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
