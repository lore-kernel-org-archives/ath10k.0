Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQWbZ-0004K6-OQ
 for ath10k@lists.infradead.org; Thu, 20 Mar 2014 06:37:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Trouble connecting to broadcom AC APs?
References: <5329CD60.6080609@candelatech.com>
Date: Thu, 20 Mar 2014 08:36:58 +0200
In-Reply-To: <5329CD60.6080609@candelatech.com> (Ben Greear's message of "Wed, 
 19 Mar 2014 10:01:20 -0700")
Message-ID: <87txatfkad.fsf@kamboji.qca.qualcomm.com>
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

> We are seeing various funny things when trying to connect
> ath10k stations to commercial APs with broadcom AC NICs.
>
> It sort of works sometimes, but we often see failure to
> acquire DHCP lease in a timely manner, etc.

So it's a problem with broadcast frames? With or without encryption? Did
you try disabling power save?

> Similar testing on APs using QCA AC NICs appears to work
> much better.
>
> Our problems could be most anything, including the fact that this
> testing is done on our modified firmware, but I am curious if anyone
> else seems any similar issues?

Occasionally I test connecting to D-Link DIR-865L in STA mode. But I
just do just simple ping tests and with manual IPs.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
