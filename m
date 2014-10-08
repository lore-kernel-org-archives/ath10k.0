Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbsZi-0000wG-Nm
 for ath10k@lists.infradead.org; Wed, 08 Oct 2014 14:50:47 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21557.20300.648468.965143@gargle.gargle.HOWL>
Date: Wed, 8 Oct 2014 20:20:52 +0530
Subject: Re: How to know the information about RTS reception in mac80211 or
 device driver
In-Reply-To: <CA+BoTQkvUkdkWDLOzu2cz6C6SGWFL2SCgwMDLf=ruaFwP9umjg@mail.gmail.com>
References: <etPan.5433ced3.74b0dc51.2d48@Mac-Pro.local>
 <CA+BoTQkvUkdkWDLOzu2cz6C6SGWFL2SCgwMDLf=ruaFwP9umjg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Okhwan Lee <ohlee@mwnl.snu.ac.kr>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior wrote:
> I think you've just found an ath10k bug.
> 
> I've been running through Rx code lately. I was looking at
> htt_rx_mpdu_status and noticed it was a bit greedy. I then recalled
> someone was complaining about RTS reception.

Maybe the RX filter to receive control frames is not set properly in the FW ?
ath10k doesn't seem to use WMI_10X_PDEV_PARAM_RX_FILTER.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
