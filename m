Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20140718181759.GB2193@kroah.com>
References: <1405697232-11785-1-git-send-email-benoit.taine@lip6.fr>
 <20140718162213.GC31114@tuxdriver.com>
 <20140718164340.GA24960@kroah.com>
 <1405702472.30262.1.camel@dabdike.int.hansenpartnership.com>
 <20140718181759.GB2193@kroah.com>
Date: Sat, 19 Jul 2014 07:14:12 +1000
Message-ID: <CAPM=9tzgWdnv7jc+xjsJUf0EcyGU+V7nFHzzQ16ui1eE0ihyQA@mail.gmail.com>
Subject: Re: [PATCH 0/25] Replace DEFINE_PCI_DEVICE_TABLE macro use
From: Dave Airlie <airlied@gmail.com>
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
To: Greg KH <greg@kroah.com>
Cc: linux-mips@linux-mips.org, Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linux-pci@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Benoit Taine <benoit.taine@lip6.fr>, ath5k-devel@venema.h4ckr.net, linux-acenic@sunsite.dk, Linux SCSI List <linux-scsi@vger.kernel.org>, users@rt2x00.serialmonkey.com, linux-rdma@vger.kernel.org, ath10k@lists.infradead.org, linux-hippi@sunsite.dk, industrypack-devel@lists.sourceforge.net, Linux Wireless List <linux-wireless@vger.kernel.org>, xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@avagotech.com, ath9k-devel@venema.h4ckr.net, wil6210@qca.qualcomm.com, linux-pcmcia@lists.infradead.org, "John W. Linville" <linville@tuxdriver.com>, linux-can@vger.kernel.org, platform-driver-x86@vger.kernel.org, Network Development <netdev@vger.kernel.org>, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, e1000-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org, devel@linuxdriverproject.org

>
> We have almost 1000 more uses of the non-macro version than the "macro"
> version in the kernel today:
> $ git grep -w DEFINE_PCI_DEVICE_TABLE | wc -l
> 262
> $ git grep "const struct pci_device_id" | wc -l
> 1254

did you check for non-const ones? just to see if we have any of the
broken case in the tree :-)

as for consistency, pci_dev vs usb_device :-P

Dave.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
