Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJXCO-0001cq-Pi
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 23:50:37 +0000
Message-ID: <531120B6.7010107@candelatech.com>
Date: Fri, 28 Feb 2014 15:50:14 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RX rate mis-reported?
References: <53111667.7010909@candelatech.com>
 <CAEFj9842Pxs_cGU1b9Q49FFA9bkD4-ks0bX_Lz04n4ff3nuLVA@mail.gmail.com>
In-Reply-To: <CAEFj9842Pxs_cGU1b9Q49FFA9bkD4-ks0bX_Lz04n4ff3nuLVA@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/28/2014 03:45 PM, Yeoh Chun-Yeow wrote:
> Hi, Ben
> 
> I did have a submitted patch to correct the last_rx_rate due to the
> missing of VHT flag:
> http://www.spinics.net/lists/linux-wireless/msg119429.html
> 
> Maybe you can take a look on this.

I did see this, and I'm running it on my station machine, but
I have not updated the AP machine yet...I'll do that and see if
it fixes the problem.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
