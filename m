Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmBGl-0001Mp-8t
 for ath10k@lists.infradead.org; Thu, 06 Nov 2014 00:49:47 +0000
Message-ID: <545AC595.1020608@candelatech.com>
Date: Wed, 05 Nov 2014 16:49:25 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Slow connect times?
References: <5458261C.2020700@candelatech.com>
 <CAHqTa-21YOPiV_UxxWh23mB7AqLhj0n+h6eA5cTUH8eh32heRw@mail.gmail.com>
 <545A60E0.8070308@candelatech.com>
 <CAHqTa-2OKoKSqQXmfAq5esu5SWXJRvL8Vy+GMRsq4XertnTaFA@mail.gmail.com>
 <545A748C.9040008@candelatech.com>
 <CAHqTa-0nHBHR5FrxWvDfp7bhfN8LOK-EhpX+LDYPwBRvkZSWxw@mail.gmail.com>
In-Reply-To: <CAHqTa-0nHBHR5FrxWvDfp7bhfN8LOK-EhpX+LDYPwBRvkZSWxw@mail.gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 11/05/2014 11:12 AM, Avery Pennarun wrote:
> On Wed, Nov 5, 2014 at 11:03 AM, Ben Greear <greearb@candelatech.com> wrote:
>> Does not appear to be an AP problem, as ath9k stations to the ath10k AP are all
>> in the 20ms range.
> 
> Ah, ok, I just assumed you were using ath10k as an AP.  In that case I
> know nothing :)
> 


Ahhh, found the problem.  Firmware was trying to be helpful and
reserve the channel on vdev-start.  But, took it 200+ms to grab the
reservation when another vdev exists, and it shouldn't be needed
anyway as far as I can tell.

Disabled that 'feature' by hacking on driver a bit to pass a new flag to modified firmware
to tell it to ignore the reservation logic, and now a second station vdev associates
in about 6-8 ms :)

Take it easy,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
