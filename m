Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnarA-0007UM-Fy
 for ath10k@lists.infradead.org; Wed, 29 Apr 2015 22:53:30 +0000
Message-ID: <554160D1.70809@candelatech.com>
Date: Wed, 29 Apr 2015 15:53:05 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Netlink Antenna Support
References: <CAP-AUyhhuXGL_U2rx5_h1Qp3+fR8KSGkrnp2iXoeeZ5h1+K9YA@mail.gmail.com>
In-Reply-To: <CAP-AUyhhuXGL_U2rx5_h1Qp3+fR8KSGkrnp2iXoeeZ5h1+K9YA@mail.gmail.com>
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
To: Brandon Enochs <enochs.brandon@gmail.com>
Cc: ath10k@lists.infradead.org

On 04/29/2015 01:24 PM, Brandon Enochs wrote:
> Does anyone know if the ath10k driver will, at some point, support
> netlink antenna masking?  The ath9k card supported this.  Further,
> will multiple antenna/signal strength pairs be supported like in the
> ath9k driver?

ath10k supports setting the antennas in use (nss).  You can use chains: 0, 0+1, or 0+1+2,
just like ath9k.

I don't think ath10k has any logic to report any of the details about antenna signal
strength for received frames.

Thanks,
Ben

> 
> Thanks,
> Brandon
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
