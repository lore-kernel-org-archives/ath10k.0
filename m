Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOx7A-0005Pn-KP
 for ath10k@lists.infradead.org; Tue, 11 Aug 2015 00:08:24 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id D415E409E08
 for <ath10k@lists.infradead.org>; Mon, 10 Aug 2015 17:08:03 -0700 (PDT)
Message-ID: <55C93CE3.6070306@candelatech.com>
Date: Mon, 10 Aug 2015 17:08:03 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Repeatable crash of CT firmware (at least).
References: <55C3B297.2050704@candelatech.com>
In-Reply-To: <55C3B297.2050704@candelatech.com>
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
To: ath10k <ath10k@lists.infradead.org>

As an update, stock upstream kernels and multiple different official firmware versions
crash as well.

I've sent more details off to those that might be able to fix
things.

Thanks,
Ben

On 08/06/2015 12:16 PM, Ben Greear wrote:
> In case someone has time an interest, I would be curious if upstream
> firmware/kernels see this problem.  Unfortunately, it takes a bit of
> setup to do this test (namely, constant tx source, and if doing this with
> something like ath9k, then you might need a variable attenuator).
> 
> Possibly just a very loud constant tx source would reproduce the bug
> as well, and possibly it would happen in AP mode, etc.
> 
> Channel 1, HT40
> 
> Configure ath10k in station mode, associate with ath10k AP,
> start transmitting frames (about 4kpps tx, 1kpps rx in my case)
> 
> Add a constant-transmit noise source at around -65 db on the same channel.  This should
> cause ath10k station (and AP) to go silent.
> 
> Shortly after, the station system's ath10k firmware crashes due to assert
> in the firmware CE logic.
> 
> I know that a similar CE assert can happen if the host does bad things
> with the tx descriptors, so I am suspicious that is the case here.  For instance,
> maybe firmware is still trying to transmit the frame when host tears down
> the station vdev??
> 
> Of course, this could all be due to bugs in CT firmware and/or my kernel
> patches...
> 
> Thanks,
> Ben
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
