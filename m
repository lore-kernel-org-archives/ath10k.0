Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmXiV-0007z5-OT
 for ath10k@lists.infradead.org; Fri, 07 Nov 2014 00:47:56 +0000
Message-ID: <545C16A5.9030106@candelatech.com>
Date: Thu, 06 Nov 2014 16:47:33 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: New ath10k CT firmware released.
References: <545BD297.5040806@candelatech.com>
In-Reply-To: <545BD297.5040806@candelatech.com>
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 11/06/2014 11:57 AM, Ben Greear wrote:
> I have uploaded the latest CT version of the ath10k firmware.
> 
> http://www.candelatech.com/ath10k.php
> 
> This firmware fixes bugs in raw-tx mode, though probably only
> non-encrypted frames can be sent in this manner, and it requires
> an out-of-tree patch from Michal Kazior to make it work:
> 
> http://comments.gmane.org/gmane.linux.drivers.ath10k.devel/246
> 
> This firmware also significantly improves association times when using
> more than one vdev.  This, requires an additional kernel patch:
> 
> http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.17.dev.y/.git;a=commitdiff;h=a9756b6e2efffbec4101dbe81e9d6a2c503239ff;hp=5bfa637376c352fc17c56afc7b1d2e752750162c

I was a bit too clever it seems....  I have to be more careful about disabling
the ch reservation when there are no vdevs active, I think.

Hope to have it fixed shortly.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
