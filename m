Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQaQ8-00020W-Rv
 for ath10k@lists.infradead.org; Fri, 01 Nov 2019 17:09:10 +0000
Subject: Re: [RFC] ath10k: interface combination with monitor
References: <CAKR_QVJ2eHrESLOEqiKxbjr0SoZh3oJydtgcebBOXSpspbquWA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <bb62015e-d097-f54c-56ce-000d0b18a5ac@candelatech.com>
Date: Fri, 1 Nov 2019 10:09:07 -0700
MIME-Version: 1.0
In-Reply-To: <CAKR_QVJ2eHrESLOEqiKxbjr0SoZh3oJydtgcebBOXSpspbquWA@mail.gmail.com>
Content-Language: en-US
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
To: Tom Psyborg <pozega.tomislav@gmail.com>, ath10k <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>

On 11/1/19 10:03 AM, Tom Psyborg wrote:
> Hi
> 
> Is there a way to run monitor mode interface independent on STA/AP
> interface presence or their state?
> I am using airodump-ng/airmon-ng and I've noticed that while mon
> interface is brought up airodump-ng is unable to find any beacons
> unless sta interface is brought down. That is with QCA9880 devices,
> while with QCA9377 airodump-ng only finds beacons if the sta interface
> is associated to an AP.
> Does this need firmware change to work or driver changes are sufficient?
> 

I would expect it to work.  Have you tried -ct firmware on 9880 in this
manner?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
