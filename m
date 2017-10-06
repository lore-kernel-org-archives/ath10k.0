Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e0Vri-0002nH-O7
 for ath10k@lists.infradead.org; Fri, 06 Oct 2017 16:54:03 +0000
Subject: Re: mesh point and ap mode on same interface
References: <e6b02c56-38c7-323e-2bc9-e2b4276b654c@tu-bs.de>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <cc8baced-bd74-5703-d885-6ec444eb62ce@candelatech.com>
Date: Fri, 6 Oct 2017 09:52:25 -0700
MIME-Version: 1.0
In-Reply-To: <e6b02c56-38c7-323e-2bc9-e2b4276b654c@tu-bs.de>
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
To: "Harms, Hannes" <hannes.harms@tu-bs.de>, ath10k@lists.infradead.org


On 10/06/2017 05:00 AM, Harms, Hannes wrote:
> Hi,
>
> is it possible to run a mesh point and an access
> point on the same physical interface?
> I have tried with a WLE900VX QCA9880, kernel 4.10 with no success.
>
> But according to this thread
> http://lists.infradead.org/pipermail/ath10k/2016-September/008374.html
> it should be possible.
>
> iw list gives to following:
>
> #valid interface combinations:
> #         * #{ AP, mesh point } <= 8, #{ managed } <= 1,
> #          total <= 8, #channels <= 1, STA/AP BI must match ...
>
> So it is not  a valid combination?
>
> I have tried t bring up the ap interface with iw / hostapd,
> after joining the mesh.
>
> When I start the second interface, rtnetlink responds with
> device or resource busy.

IBSS + AP works on the CT firmware/driver, at least,
but our CT 10.1 (988x) firmware does not support MESH at this point.

I think I had to modify the driver to relax the valid combinations check,
and possibly the stock firmware cannot handle that.

Maybe someday we'll support MESH on 988x, but to date, there has not been
a lot of interest...

http://www.candelatech.com/ath10k.php

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
