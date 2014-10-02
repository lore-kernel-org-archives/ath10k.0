Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZimF-0007zM-RW
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 15:58:48 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Thu, 02 Oct 2014 17:58:19 +0200
Message-ID: <7004963.mtH2SDQocr@wuerfel>
In-Reply-To: <87d2aamsg2.fsf@kamboji.qca.qualcomm.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <2397903.vznsjdQh6x@wuerfel> <87d2aamsg2.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: devicetree@vger.kernel.org, ath10k@lists.infradead.org

On Thursday 02 October 2014 17:55:57 Kalle Valo wrote:
> 
> > I notice that there are no Qualcomm or Atheros PCI host controller drivers
> > in Linux though, so you first have to write a driver that allows probing
> > the PCI bus, and get the binding reviewed for that before you can add
> > it to the dts files. Is this for ipq8064 or something else?
> 
> But now I'm lost again  I want ath10k and this feature to work with
> all possible PCI controllers, not just with Qualcomm controllers. So why
> do I need to wait for Qualcomm PCI host controller driver?

Sorry, my fault. You can definitely do this with any SoC that uses DT
for probing the PCI. I was merely assuming that you were asking about
ipq because the wifi chips and SoCs tend to come bundled from the
same manufacturer in embedded systems, and the MIPS based QCA SoCs
currently don't use DT.

For any machine that does not use DT, it would be much harder to
solve this problem though.

	Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
