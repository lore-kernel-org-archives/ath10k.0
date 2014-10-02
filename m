Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZhEg-00039t-4K
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 14:20:02 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Thu, 02 Oct 2014 16:19:28 +0200
Message-ID: <2397903.vznsjdQh6x@wuerfel>
In-Reply-To: <87lhoymvln.fsf@kamboji.qca.qualcomm.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <3548219.ad4Qe1WtGp@wuerfel> <87lhoymvln.fsf@kamboji.qca.qualcomm.com>
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

On Thursday 02 October 2014 16:47:48 Kalle Valo wrote:
> >
> > When you know the PCI bus/device/function ID of the device, you can put
> > a device node in the dts file that corresponds to the PCI dev, and you
> > can find the of_node pointer from pci_dev->dev.of_node. 
> 
> For me that's easier said than done as I'm a total newbie with Device
> Tree  Can you give any pointers or examples how to do that in
> practise, please? Especially "node in the dts file that corresponds to
> the PCI dev" part is puzzling me.

See the recent patch "[PATCH v4] ARM: shmobile: r8a7791: link PCI USB
devices to USB PHY" where someone does the same thing to supply additional
data to a PCI device node in shmobile.

Basically you just need to add a node under your PCI host controller node
with "reg = <0x800 0 0 0 0>" (or whatever the address is and put the
properties in there. See www.openfirmware.org/1275/bindings/pci/pci2_1.pdf
for the description of how to construct the addresses.

I notice that there are no Qualcomm or Atheros PCI host controller drivers
in Linux though, so you first have to write a driver that allows probing
the PCI bus, and get the binding reviewed for that before you can add
it to the dts files. Is this for ipq8064 or something else?

	Arnd


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
