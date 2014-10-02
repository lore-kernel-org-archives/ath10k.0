Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZgS2-0003R5-EO
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 13:29:47 +0000
Date: Thu, 2 Oct 2014 14:29:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: ath10k: calibration data through Device Tree?
Message-ID: <20141002132914.GN5788@leverpostej>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
> PCI devices.
> 
> Some of the devices store the calibration data to the host flash and the
> bootloader reads the data from the flash. And now we need a method to
> deliver the calibration data from bootloader to ath10k. 

What does this calibration data consist of?

What happens if you don't have the calibration data? Is it a critical
requirement for the use of the device, or does its absence simply result
in degraded performance?

What do you do on non-DT systems? Where does the information come from
in that case?

I'm somewhat puzzled as to why a discoverable PCI device would require
non-discoverable information to use.

> * The calibration data is now 2116 bytes, in the future it might be
>   longer. The data is unique for each radio and is created at the
>   factory.

Why would this change in future? Who is in charge of providing this
information, and deciding upon the format thereof?

> * ath10k must be able to reliably map the PCI device (=radio) to the
>   correct calibration data. Maybe with using PCI bus and slot numbers?

I guess we'd have to do something along those lines.

I'd like to get a better understanding of the problem before we start
figuring out how to pass an arbitrary blob of information around.

Thanks,
Mark.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
