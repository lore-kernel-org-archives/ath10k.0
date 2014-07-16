Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7R8y-0005vz-HP
 for ath10k@lists.infradead.org; Wed, 16 Jul 2014 15:29:20 +0000
Message-ID: <53C69A32.3090305@candelatech.com>
Date: Wed, 16 Jul 2014 08:28:50 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC/RFT 2/2] ath10k: don't start monitor vdev for promisc
References: <1405516873-26411-1-git-send-email-michal.kazior@tieto.com>
 <1405516873-26411-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1405516873-26411-2-git-send-email-michal.kazior@tieto.com>
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
Cc: vh.nguyen@actiasodielec.fr, svens@stackframe.org, linux-wireless@vger.kernel.org

On 07/16/2014 06:21 AM, Michal Kazior wrote:
> ath10k doesn't apply any extra rx filters so
> there's no need to start monitor vdev for
> promiscuous mode.
>
> This fixes crashes with 4addr station interface
> bridging and some very rare crashes of AP
> interfaces with bridging as well.

Ahh, I was just working on some related hack-arounds to make sure
I left a vdev slot open for the monitor interface in case some poor
person started a sniffer on an interface and made it go promisc...

With this patch, I can be sure monitor interfaces will not
be automatically created without explicit user request?

Any idea if it will be a problem to apply this to what is
effectively a 3.15 kernel?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
