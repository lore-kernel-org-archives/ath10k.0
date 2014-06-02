Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrV09-0003Pv-IP
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 16:22:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
Date: Mon, 2 Jun 2014 19:21:54 +0300
In-Reply-To: <53891ACD.7070902@candelatech.com> (Ben Greear's message of "Fri, 
 30 May 2014 16:57:01 -0700")
Message-ID: <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> I have a bunch of patches that can dump some firmware debug logs,
> stack, and exception stacks as ascii hex. Ath10k firmware-having folks
> can use private tools to extract and decode useful info from this.

You mean via printk? That sounds ugly.

There was talk on linux-wireless about how to handle firmware crash
dumps in a generic way. One proposal was to use ethtool and an event for
this. Before that I was thinking of using trace points. Maybe we should
support both?

We should come up with an extensible format how to provide the firmware
crash logs to user space, for example using some TLV based format, which
contain all the necessary information (hw details, firmware version,
memory dumps and whatnot). But ath10k should not have any parsing of the
dumps, that should happen in user space.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
