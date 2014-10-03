Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa5fr-0003l6-8Y
 for ath10k@lists.infradead.org; Fri, 03 Oct 2014 16:25:43 +0000
Date: Fri, 3 Oct 2014 17:25:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: ath10k: calibration data through Device Tree?
Message-ID: <20141003162513.GW26643@leverpostej>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
 <542DA1F7.9090904@amacapital.net> <2386503.dNPayhXJTQ@wuerfel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2386503.dNPayhXJTQ@wuerfel>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Andy Lutomirski <luto@amacapital.net>

> From a system design point, it's still horrible that you have to use
> DT for a device that is on a discoverable bus like PCI, but as you describe,
> the reality is that products are shipping that use ath10k PCI devices
> without this data in them.

I'd see any DT property for this as a workaround, the use of which
should be discouraged.

A fun question that springs to mind is can the ath10k chip be removed,
and if so am I able to place it into a non-DT system (whereupon I have
no calibration data, so it won't work)?

Mark.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
